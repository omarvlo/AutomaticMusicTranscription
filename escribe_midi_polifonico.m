function escribe_midi_polifonico(inicios,finales,nombre_archivo,tempo_midi)

%tempo_calculado = round((60/tempo)*1000000);
% negra = 60/tempo;
% acum = 0;
% acum2 = 0;
% tempo=1000000;

timesig = tempo_midi(:,1);
ticks = tempo_midi(1,2);
tempo = tempo_midi(1,3);


[filas, col] = size(inicios);

cont=1;

for i=1:1:filas
    %M(cont,3)=inicios(i,1);
    for j=1:1:col-1
        if ((inicios(i,j+1)~=0)&&(finales(i,j+1)~=0))
            M(cont,3)=inicios(i,1);
            M(cont,5)=inicios(i,j+1);
            M(cont,6)=finales(i,j+1);
            cont=cont+1;
        end
    end
end

N = cont;  % number of notes

a = M(:,3);
b = M(:,5);
c = M(:,6);

[Bsorted,I] = sort(b);
Asorted = a(I);
Csorted = c(I);

M(:,3) = Asorted;
M(:,5) = Bsorted;
M(:,6) = Csorted;

M(:,1) = 1;         % all in track 1
M(:,2) = 1;         % all in channel 1
M(:,4) = 100;  % lets have volume ramp up 80->120
% 
% 
 midi_new = matrix2midi_mod(M,ticks,timesig,tempo);
 writemidi(midi_new, nombre_archivo);