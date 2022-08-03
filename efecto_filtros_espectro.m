clear all
% initialization
inpPath = '../data/';
outPath = 'output/';
fs = 44100;

% create output directory, if it doesn't exist
if ~exist(outPath, 'dir')
  mkdir(outPath);
end
filenameG2 = 'G3.wav'; 
[xG2, fsG2] = audioread([inpPath filenameG2]);
xG2 = mean(xG2, 2);

paramSTFT.blockSize = 4096;
paramSTFT.hopSize = 2048;
paramSTFT.winFunc = hann(paramSTFT.blockSize);
paramSTFT.reconstMirror = true;
paramSTFT.appendFrame = true;

[XG2, AG2, PG2] = forwardSTFT(xG2, paramSTFT);

%espectro = calcula_transformada(xG2, paramSTFT);
%espectro=espectro/4;
[X,espectro,P] = forwardFFT(xG2, paramSTFT)

espectro_espectrograma = AG2(:,2);

figure(1)
plot(espectro_espectrograma)
hold on
plot(espectro)

figure(2)
subplot(2,1,1)
plot(espectro_espectrograma)
hold on
subplot(2,1,2)
plot(espectro)

[espectro_prom, resp_final, espectros_filtrados] =filtros_ERB(fs,4,20,espectro);

%aa_resp_final = resp(:,20);
espectro_filtrar = espectro_espectrograma;
medida = 200;

subplot(5,2,1)
plot(espectro_filtrar)
hold on
plot(resp_final(:,1))
axis([0 500 0 medida]) 
subplot(5,2,2)
plot(espectros_filtrados(:,1))
axis([0 500 0 medida]) 

subplot(5,2,3)
plot(espectro_filtrar)
hold on
plot(resp_final(:,2))  
axis([0 500 0 medida]) 
subplot(5,2,4)
plot(espectros_filtrados(:,2))
axis([0 500 0 medida]) 

subplot(5,2,5)
plot(espectro_filtrar)
hold on
plot(resp_final(:,3))
axis([0 500 0 medida]) 
subplot(5,2,6)
plot(espectros_filtrados(:,3))
axis([0 500 0 medida]) 

subplot(5,2,7)
plot(espectro_filtrar)
hold on
plot(resp_final(:,4))    
axis([0 500 0 medida]) 
subplot(5,2,8)
plot(espectros_filtrados(:,4))
axis([0 500 0 medida]) 
% 
subplot(5,2,9)
plot(espectro_filtrar)
hold on
plot(resp_final(:,5))   
axis([0 500 0 medida]) 
subplot(5,2,10)
plot(espectros_filtrados(:,5))
axis([0 500 0 medida]) 

figure(2)
subplot(1,2,1)
plot(espectro_filtrar)
axis([0 500 0 medida]) 
subplot(1,2,2)
plot(espectro_prom)
axis([0 500 0 medida]) 


% 
