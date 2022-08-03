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

resampleo=1;
reduce=2;

filenameA3= 'A3.wav';
filenameB4 = 'B4.wav';

[xA3, fsA3] = audioread([inpPath filenameA3]);
[xB4, fsB4] = audioread([inpPath filenameB4]);

fs = fsA3;

xA3 = mean(xA3, 2);
xB4 = mean(xB4, 2);

[P,Q] = rat((fs/reduce)/fs); %se vuelven a samplear los archivos a la mitad de frecuencia

if resampleo == 1
    xA3 = resample(xA3,P,Q);
    xB4 = resample(xB4,P,Q);
    fs = fs/2;
end

Fs = fs;

a = xA3; %chirp(t,100,1,200,'quadratic');

a_fft = spectrogram(a,128,120,128);
b_fft = fft(a);

L = length(b_fft);

P2 = abs(b_fft/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;

% 2. compute STFT
paramSTFT.blockSize = 4096;
paramSTFT.hopSize = 2048;
paramSTFT.winFunc = hann(paramSTFT.blockSize);
paramSTFT.reconstMirror = true;
paramSTFT.appendFrame = true;

% get dimensions and time and freq resolutions

deltaT = paramSTFT.hopSize / fs;
deltaF = fs / paramSTFT.blockSize;

[XA3, AA3, PA3] = forwardSTFT(xA3, paramSTFT);
[XB4, AB4, PB4] = forwardSTFT(xB4, paramSTFT);

% figure(1)
% plot(a_fft)
% figure(2)
% plot(f,P1) 
% 
% figure(3)
% plot(a_fft(:,1756))
