
function [matriz_inicios, matriz_finales] = lector_midi_SONIC(midiname)

%clear all; clc;

midi = readmidi(midiname);
% ticks = midi.ticks_per_quarter_note;
% [tempo timesig] = midiInfo_tempo(midi);
% messages = midi.track.messages;
% messages = struct2cell(messages);
% timesig = messages{5,1,5};

% tempo_midi(:,1) = timesig(:,1);
% tempo_midi(1,2) = ticks;
% tempo_midi(1,3) = tempo;

Notes_complete = midiInfo(midi,0);

Notes = Notes_complete(:,[3 5:6]);

eventos = length(Notes)

cont1=1; 
cont2=1;
cont3=1;
guardados = 1;
repetido=false;

for i=1:1:eventos

    nota = Notes(i,1);
 
    num_guardados = length(guardados);
    for k=1:1:num_guardados
        if (nota==guardados(k)&&(i~=1))
            repetido=true;
        end
    end
    
    if repetido==false

    matriz_inicios(cont1,cont2)=nota;
    matriz_finales(cont1,cont2)=nota;
    cont2=cont2+1;
    
    matriz_inicios(cont1,cont2)=Notes(cont3,2);
    matriz_finales(cont1,cont2)=Notes(cont3,3);
    cont2=cont2+1;
    
    for j=1:1:eventos
        if (nota==Notes(j,1))&&(i~=j) 
            matriz_inicios(cont1,cont2) = Notes(j,2);
            matriz_finales(cont1,cont2) = Notes(j,3);
            cont2 = cont2+1;
        end
    end
    cont1 = cont1+1;
    cont2=1;
    prueba = 1;
    end
    
    %cont1=1;
    guardados(cont3)=nota;
    cont3=cont3+1;
    repetido=false;
end

% xlswrite('original_inicios.xlsx',matriz_inicios)
% xlswrite('original_finales.xlsx',matriz_finales)

[filas col] = size(matriz_inicios)

tempo = 120;
negra = 60/tempo;
compas = 3; %este es el factor para un compas de 3/8
dur_compas = negra*compas;

num_compas=1;
total_compases = 64;
inicio_compas = 0;
final_compas = dur_compas;
conta=1;

%notas_por_compass = identifica_nota_en_compas(tempo,compas,total_compases,matriz_inicios);
% for num_compas=1:total_compases
%     
%     if num_compas ~=1
%         inicio_compas = final_compas;
%         final_compas = dur_compas*num_compas;
%     end
%     
%     for i=1:1:filas
%         %notas_por_compas(num_compas,1)=num_compas;
%         inicio_compas
%         final_compas
%         matriz_inicios(i,1)
%         for j=1:1:col
%                 %matriz_inicios(i,j)            
%             if ((matriz_inicios(i,j)>=inicio_compas)&&(matriz_inicios(i,j)<final_compas)&&(matriz_inicios(i,j)~=0))
%                 notas_por_compas(num_compas,conta)=matriz_inicios(i,1);
%                 conta=conta+1;  
%             else
%                 if ((j==2)&&(matriz_inicios(i,j)>=inicio_compas)&&(matriz_inicios(i,j)<final_compas))
%                 notas_por_compas(num_compas,conta)=matriz_inicios(i,1);
%                 conta=conta+1;
%                 end
%             end
%         end
%     end
%         conta=1;
% end





