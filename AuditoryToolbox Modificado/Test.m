% impulse=[1 zeros(1,1023)];
% 
% [ERBforward, ERBfeedback]=MakeERBFilters(16000,64,20);
% y=ERBFilterBank(ERBforward,ERBfeedback,impulse);
% response=20*log10(abs(fft(y(1:5:64,:)')));
% freqScale=(0:1023)/1024*16000;
% axis([2 4 -70 10])
% semilogx(freqScale(1:512),response(1:512,:))
% figure(2)
% plot(impulse)
clear all; close all;

tap = audioread('tapestry.wav');


%The ten ERB filters between 100 and 8000Hz are computed using

fcoefs = MakeERBFilters(16000,8,100);
%The resulting frequency response is given by
y = ERBFilterBank([1 zeros(1,511)], fcoefs);
resp = 20*log10(abs(fft(y')));
freqScale = (0:511)/512*16000;
semilogx(freqScale(1:255),resp(1:255,:));
axis([100 16000 -60 0])
xlabel('Frequency (Hz)');
ylabel('Filter Response (dB)');

fcoefs=MakeERBFilters(16000,40,100);
coch=ERBFilterBank(tap, fcoefs);
for j=1:size(coch,1)
c=max(coch(j,:),0);
c=filter([1],[1 -.99],c);
coch(j,:)=c;
end
imagesc(coch);
% 
% [s,fs] = audioread('MAPS_ISOL_CH0.1_M_ENSTDkCl.wav');
% s = s(:,1);
% %figure(2)
% %imagesc(s);
% fcoefs = MakeERBFilters(44100,5,20);
% coch = ERBFilterBank(s, fcoefs);
% for j=1:size(coch,1)
%     c=max(coch(j,:),0);
%     c=filter([1],[1 -.99],c);
%     coch(j,:)=c;
% end
% figure(2)
% imagesc(coch);
% %sound(s,fs)
% 
% % Extracción de características con MFCC
% for i=1:3000
% z(i) = s(i);
% end
% [ceps,freqresp,fb,fbrecon,freqrecon] = mfcc(z,44100,100);
% figure(3)
% imagesc(ceps); colormap(1-gray);
