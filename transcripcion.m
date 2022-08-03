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

%Bach_Minuet_in_G      
%Prelude_I_in_C_major_BWV_846
%Fr_Elise
%Mozart_-_Piano_Sonata
% Borodin__Polovstian_Dance
% Chopin__Prelude_Op._28_No._20_in_C_minor
% Massenet__Elegy_in_E_minor
% Mendelssohn__Wedding_March
% Mozart__Eine_Kleine_Nachtmusik
% Mozart__Fantasy_No._3_in_D_minor
%Beethoven__Minuet_in_G_major
%Beethoven__Sonata_Pathetique_2nd_Mov
%Brahms__Waltz_No._9_in_D_minor
%Chopin__Nocturne_Op._9_No._2_in_E-flat_major
%Brahms__Waltz_No._15_in_A-flat_major
%Chopin__Minute_Waltz_Op._64_No._1_in_D-flat_major
%Chopin__Prelude_Op._28_No._6_in_B_minor
%Chopin__Prelude_Op._28_No._7_in_A_major
%Chopin__Waltz_Op._64_No._2_in_Csharp_minor
%Clementi__Sonatina_Op._36_No._1
%Field__Nocturne_in_B-flat_major
%Grieg__Canon_Op._38_No._8
%Grieg__Peer_Gynt_Morning
%Handel__Sarabande_in_D_minor
%Mendelssohn__Vene   tian_Boat_Song_Op._19b_No._6
% Field__Nocturne_in_B-flat_major
% Grieg__Canon_Op._38_No._8
% Grieg__Peer_Gynt_Morning
% Handel__Sarabande_in_D_minor
% Offenbach__Barcarolle_from_The_Tales_of_Hoffmann
% Pachelbel__Canon_in_D_major
% Prokofiev__Peter_and_the_Wolf
% Puccini__O_Mio_Babbino_Caro
% Rebikov__Valse_Melancolique_Op._2_No._3
% Saint-Saens__The_Swan
% Satie__Gnossienne_No._1
% Satie__Gymnopedie_No._1
% Schubert__Impromptu_Op._90_No._4_in_A-flat_major
% Schubert__Moment_Musicaux_No._1_in_C_major
% Schubert__Moment_Musicaux_No._3_in_F_minor
% Schubert__Serenade_in_D_minor
% Schumann__Scenes_From_Childhood_Op._15_No._12
% Schumann__The_Happy_Farmer
% Strauss__The_Blue_Danube_Waltz
% Tchaikovsky__Album_for_the_Young_-_Old_French_Song
% Tchaikovsky__Album_for_the_Young_-_Polka
% Tchaikovsky__Album_for_the_Young_-_Waltz
% Tchaikovsky__Nutcracker_-_Dance_of_the_Reed_Flutes
% Tchaikovsky__Nutcracker_-_Dance_of_the_Sugar_Plum_Fairies
% Tchaikovsky__Nutcracker_-_March_of_the_Toy_Soldiers
% Tchaikovsky__Nutcracker_-_Waltz_of_the_Flowers
% Tchaikovsky__Swan_Lake

%escala_octava_4
%ind_cancion = 1;
%total_canciones=10;

transcrip = 1;
ind_cancion=1;


% canciones = ["Chopin__Minute_Waltz_Op._64_No._1_in_D-flat_major"...
%  "Fr_Elise"...
%  "Mendelssohn__Venetian_Boat_Song_Op._19b_No._6"... 
%  "Mozart__Eine_Kleine_Nachtmusik"...  
%  "Mozart__Fantasy_No._3_in_D_minor"... 
%  "Schumann__Scenes_From_Childhood_Op._15_No._12"... 
%  "Strauss__The_Blue_Danube_Waltz"... 
%  "Tchaikovsky__Album_for_the_Young_-_Waltz"...  
%  "Tchaikovsky__Nutcracker_-_Dance_of_the_Reed_Flutes"...  
%  "Tchaikovsky__Nutcracker_-_Dance_of_the_Sugar_Plum_Fairies"];

% canciones = ["Offenbach__Barcarolle_from_The_Tales_of_Hoffmann"...
%  "Pachelbel__Canon_in_D_major"...
%  "Prelude_I_in_C_major_BWV_846"... 
%  "Prokofiev__Peter_and_the_Wolf"...  
%  "Puccini__O_Mio_Babbino_Caro"... 
%  "Saint-Saens__The_Swan"... 
%  "Satie__Gnossienne_No._1"... 
%  "Satie__Gymnopedie_No._1"...  
%  "Schubert__Impromptu_Op._90_No._4_in_A-flat_major"...  
%  "Schubert__Moment_Musicaux_No._1_in_C_major"];

% canciones = ["Grieg__Canon_Op._38_No._8"...
%  "Grieg__Peer_Gynt_Morning"...
%  "Brahms__Waltz_No._15_in_A-flat_major"... 
%  "Tchaikovsky__Swan_Lake"...  
%  "Mozart_-_Piano_Sonata"... 
%  "Clementi__Sonatina_Op._36_No._1"... 
%  "Tchaikovsky__Album_for_the_Young_-_Polka"... 
%  "Bach_Minuet_in_G"...  
%  "Handel__Sarabande_in_D_minor"...  
%  "Tchaikovsky__Nutcracker_-_March_of_the_Toy_Soldiers"];

% for ind_cancion=1:1:total_canciones 
% 
% canciones = ["Bach_Minuet_in_G"...
%  "Satie__Gnossienne_No._1"...
%  "Tchaikovsky__Album_for_the_Young_-_Waltz"... 
%  "Strauss__The_Blue_Danube_Waltz"...  
%  "Tchaikovsky__Nutcracker_-_March_of_the_Toy_Soldiers"... 
%  "Offenbach__Barcarolle_from_The_Tales_of_Hoffmann"... 
%  "Grieg__Canon_Op._38_No._8"... 
%  "Tchaikovsky__Album_for_the_Young_-_Polka"...  
%  "Mendelssohn__Venetian_Boat_Song_Op._19b_No._6"...  
%  "Handel__Sarabande_in_D_minor"];
% 
% nombre_cancion = canciones(ind_cancion)
% 
% wav_ext = ".wav"
% mid_ext = ".mid" 

% filename = strcat(nombre_cancion,wav_ext)
% filename =convertStringsToChars(filename)
% midiname = strcat(nombre_cancion,mid_ext)
% midiname =convertStringsToChars(midiname)
filename ='Handel__Sarabande_in_D_minor.wav';
midiname = 'Handel__Sarabande_in_D_minor.mid';


% base_MAPS = 0;
%frec_minima = 60; %60 Hz para el C2 
%umbral = 0;

selecciona = 3;% 1 sin filtros 2: 8 filtros 3: 12 filtros
bertin = 1; %c2onsiderando el umbral usado por bertin

%porcentaje_umbral = 0.55; %0.55 para base MAPS piano virtual
                          %0.6 para base de piano sintetizada con MuseScore
% if base_MAPS ~= 1
%                  
switch selecciona
    case 1%sin_filtro_mix_06mayo
        %escala_octava_4_yamaha
        %escala_octava_4_Correct
        %sin_filtro_mix_22junio
        con_filtros=0;
        modelo = 'sin_filtro_88_22jun.mat';
        load(modelo) %
    case 2
        con_filtros = 1;
        modelo = '8fil_88n_20hz_8_OK.mat'
        load(modelo) %
        %8fil_88n_60hz_7.mat';
        %8_canales__88_22jun.mat
        %8_canales_mix_22junio
        %8_canales__88_23jun.mat   
    case 3
        con_filtros = 1;
        modelo = '12fil_88n_20hz_espectro_venterc.mat';
        s_modelo = 1; % 1: Propuesta 2: Slaney 3: Greenwood
        load(modelo) 
    otherwise
        disp('ERROR')
end


% else
%     
%     switch selecciona
%     case 1    
%         load('sinfiltros_mix_MAPS_AkPnBsdf.mat') %
%     case 2
%         load('8_canales_mix_MAPS_AkPnBsdf.mat')
%     case 3
%         load('10_canales_mix_MAPS_AkPnBsdf.mat')
%     case 4
%         load('12_canales_mix_MAPS_AkPnBsdf.mat')
%     case 5
%         load('50_canales_mix_MAPS_AkPnBsdf.mat')
%     case 6
%         load('88_canales_mix_MAPS_AkPnBsdf.mat')        
%     otherwise
%         disp('ERROR')
%     end
%     
%end

%load('prueba.mat')
[xTr,fs] = audioread([inpPath filename]);

xTr = mean(xTr, 2);

% 
% if STFT_rep == 1
    [XTr, ATr, PTr] = forwardSTFT(xTr, paramSTFT);
    if con_filtros ==1
    [ATr resp] = filtros_ERB(fs,num_filtros,frec_minima,ATr,transcrip,s_modelo);
    end
    [numBinsTr, numFramesTr] = size(XTr);  
% else
%     ATr = cocleograma(xTr,fs,num_filtros,frec_minima,ventana_r_potencia);
%     ATr = flip(ATr);
%     [numBinsTr, numFramesTr] = size(ATr);
%     
% end


% for i=1:1:numComp 
%     espectro = initW{i};
%     [fil_esp col_esp] = size(espectro);
%     for k=1:1:fil_esp
%     maximos(k) = max(espectro(k,:));
%     end
%     [valor ind] = max(maximos);
%     frecuencias_originales(i,1)=ind*deltaF;          
% end

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

% %% visualize
% paramVis.deltaT = deltaT;
% paramVis.deltaF = deltaF;
% paramVis.logComp = 1e5;
% fh1 = visualizeComponentsNMF(ATr, nmfdW, nmfdH, nmfdV, paramVis);

% %% save result
% saveas(fh1,[outPath,'Prelude_No._4_in_E_Minor_Chopin.png']);

%umbral = calcula_umbral(nmfdH,porcentaje_umbral);

%umbral = 0.00010;%%%%0.00020
 
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

%     subplot(componente/2,1,i)
%     vector_activacion = nmfdH(i,:);
%     plot(vector_activacion)

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
    
%     espectro = nmfdW{i};
%     [fil_esp col_esp] = size(espectro);
%     for k=1:1:fil_esp
%     maximos(k) = max(espectro(k,:));
%     end
%     [valor ind] = max(maximos);
%     frecuencias(i,1)=ind*deltaF;    
    
end

% frecuencias_ok = [27.5 29.14 30.87 32.7 34.65 36.71 38.89 41.2 43.65 46.25 49 51.91 55 58.27 61.74 65.41 69.3 73.42 77.78 82.41 87.31 92.5 98 103.83 110 116.54 123.47 130.81 138.59 146.83 155.56 164.81 174.61 185 196 207.65 220 233.08 246.94 261.63 277.18 293.66 311.13 329.63 349.23 369.99 392 415.3 440 466.16 493.88 523.25 554.37 587.33 622.25 659.26 698.46 739.99 783.99 830.61 880 932.33 987.77 1046.5 1108.73 1174.66 1244.51 1318.51 1396.91 1479.98 1567.98 1661.22 1760 1864.66 1975.53 2093 2217.46 2349.32 2489.02 2637.02 2793.83 2959.96 3135.96 3322.44 3520 3729.31 3951.07 4186.01];
% 
% frecuencias_ok = frecuencias_ok';

% for i=1:1:length(frecuencias)
%     
%     tono = frecuencias(i);
%     nota_midi(i,1) = selecciona_nota(tono);
% end
j=1;
for i=21:1:108 %C2:36 - C7:96
    
    nota_midi(j,1)=i;
    j=j+1;
end

%nota_midi = [37;38;39;40;41;42;43;44;45;46;47;48;49;50;51;52;53;54;55;56;57;58;59;60;61;62;63;64;65;66;67;68;69;70;71;72;73;74;75;76;77;78;79;80;81;82;83;84;85;86;87;88;89;90;91;92;93;94;95;96];
% for i=1:1:88
%     nota_midi(i)=i+20;
% end
%nota_midi = [60;62;64;65;67;69;71]

resultados_inicios = [nota_midi inicio(:,1:end)];
resultados_finales = [nota_midi fin(:,1:end)];

% tempo = 120;
% total_compases = 64;
% compas = 3; %3/4
tam_segmento = 0.010 % se analiza por ventanas de 10 ms de acuerdo con las metricas del MIREX
[originales_inicios originales_finales,tempo_midi] = lector_midi(midiname);
originales = adapta_resolucion(originales_inicios, originales_finales, tam_segmento);
reconocidos = adapta_resolucion(resultados_inicios, resultados_finales, tam_segmento);
notas_porsegmento_original = notas_por_segmento_mod(tam_segmento,originales,originales);
notas_porsegmento = notas_por_segmento_mod(tam_segmento,reconocidos,originales);

[notas_porsegmento notas_porsegmento_original] = ajustar_arreglos(notas_porsegmento,notas_porsegmento_original);

mirex_metricas = calcula_metricas(notas_porsegmento,notas_porsegmento_original);
arreglo_mirex_metricas(ind_cancion,:) = mirex_metricas(1,:)

% filename_excel = 'evaluación_transcripción.xlsx';
% sheet = 1;
% xlRange = sprintf('A%d',ind_cancion);
% xlswrite(filename_excel,filename,sheet,xlRange)
% xlRange = sprintf('B%d',ind_cancion);
% xlswrite(filename_excel,arreglo_mirex_metricas(ind_cancion,:),sheet,xlRange)

% clc
% ind_cancion
% clearvars -except inpPath outPath canciones ind_cancion total_canciones arreglo_mirex_metricas paramSTFT paramActivations transcrip;
% end

% load handel
% sound(y,Fs)


% mirex_metricas_old = calcula_precision_mirex(notas_porsegmento, notas_porsegmento_original);
% % 
% mirex_metricas_old = mirex_metricas_old'

%save(nombre,'notas_porsegmento');
