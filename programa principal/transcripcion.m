clear variables
clc
clear all

% initialization
    
inpPath = '../data/';
outPath = 'output/';

% create output directory, if it doesn't exist
if ~exist(outPath, 'dir')
  mkdir(outPath);
end

% Offenbach__Barcarolle_from_The_Tales_of_Hoffmann
% Grieg__Canon_Op._38_No._8
% Tchaikovsky__Album_for_the_Young_-_Polka
% Mendelssohn__Venetian_Boat_Song_Op._19b_No._6
% Handel__Sarabande_in_D_minor

transcrip = 1; %modo transcribir

filename ='Handel__Sarabande_in_D_minor.wav';
midiname = 'Handel__Sarabande_in_D_minor.mid';

selecciona = 3;% 1 sin filtros 2: 8 filtros 3: 12 filtros
bertin = 1; %uso de un criterio similar al de bertin(2007) para calcular el umbral en la matriz H 
        
switch selecciona
    case 1
        con_filtros=0;
        modelo = 'modelo_0fil_88n_20hz.mat';% sin filtros
        load(modelo) %
    case 2
        con_filtros = 1;
        modelo = 'modelo_8fil_88n_20hz.mat'% banco con 8 filtros
        s_modelo = 1; % 1: Propuesta 2: Slaney 3: Greenwood
        load(modelo) %
    case 3
        con_filtros = 1;
        modelo = 'modelo_12fil_88n_20hz.mat';% banco con 12 filtros
        s_modelo = 1; % 1: Propuesta 2: Slaney 3: Greenwood
        load(modelo) 
    otherwise
        disp('ERROR')
end

[xTr,fs] = audioread([inpPath filename]);

xTr = mean(xTr, 2);

    [XTr, ATr, PTr] = forwardSTFT(xTr, paramSTFT);
    if con_filtros ==1
    [ATr resp] = filtros_ERB(fs,num_filtros,frec_minima,ATr,transcrip,s_modelo);
    end
    [numBinsTr, numFramesTr] = size(XTr);  

% generate initial activations
numIter = 30;
paramNMFD.initW = initW;
paramActivations.numComp = numComp;
paramActivations.numFrames = numFramesTr;
initH = initActivations(paramActivations, 'uniform');
paramNMFD.initH = initH;

% NMFD parameters
paramNMFD.numComp = numComp;
paramNMFD.numFrames = numFramesTr;
paramNMFD.numIter = numIter;
paramNMFD.numTemplateFrames = numTemplateFrames;
paramNMFD.numBins = numBinsTr;
paramNMFD.fixW = 1;

% NMFD core method
[nmfdW, nmfdH] = NMFD(ATr, paramNMFD);
 
[componente col] = size(nmfdH);

encendido=0;

inicio=0;
fin=0;

    
num_desv = 1.5;

    for i=1:1:componente
        
   media = mean(nmfdH(i,:));
   desv = std(nmfdH(i,:));
   umbral = media+ num_desv*desv;
   set_umbral(i)=umbral;
        
    end
    
    umbral = mean(set_umbral);
    
for i=1:1:componente

cont1=1;
cont2=1;

    for j=1:1:col 
        
        if (encendido==1&&(nmfdH(i,j)<umbral))
            fin(i,cont1) = j*deltaT;
            encendido=0;
            cont1 = cont1+1;
        
        elseif((nmfdH(i,j)>umbral)&&(encendido==0))
            inicio(i,cont2) = j*deltaT;
            encendido=1;
            cont2 = cont2+1;
        else
            inicio(i,cont2) = 0;
            fin(i,cont1) = 0;
        end

    end
    
    
end


j=1;
for i=21:1:108 %C2:36 - C7:96
    
    nota_midi(j,1)=i;
    j=j+1;
end

resultados_inicios = [nota_midi inicio(:,1:end)];
resultados_finales = [nota_midi fin(:,1:end)];

tam_segmento = 0.010 % se analiza por ventanas de 10 ms de acuerdo con las metricas del MIREX
[originales_inicios originales_finales,tempo_midi] = lector_midi(midiname);
originales = adapta_resolucion(originales_inicios, originales_finales, tam_segmento);
reconocidos = adapta_resolucion(resultados_inicios, resultados_finales, tam_segmento);
notas_porsegmento_original = notas_por_segmento_mod(tam_segmento,originales,originales);
notas_porsegmento = notas_por_segmento_mod(tam_segmento,reconocidos,originales);

[notas_porsegmento notas_porsegmento_original] = ajustar_arreglos(notas_porsegmento,notas_porsegmento_original);

mirex_metricas = calcula_metricas(notas_porsegmento,notas_porsegmento_original);

escribe_midi_polifonico(resultados_inicios,resultados_finales,'Handel_Transcripcion.mid',tempo_midi);
%load handel
%sound(y,Fs)


