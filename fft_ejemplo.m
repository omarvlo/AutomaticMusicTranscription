% Ts = 1/50;
% t = 0:Ts:10-Ts;                     
% x = sin(2*pi*15*t) + sin(2*pi*20*t);
% 
% figure(1)
% plot(t,x)
% xlabel('Time (seconds)')
% ylabel('Amplitude')
% 
% y = fft(x);   
% fs = 1/Ts;
% f = 0:length(y)-1;
% f = f*fs/length(y);
% 
% figure(2)
% plot(f,abs(y))
% xlabel('Frequency (Hz)')
% ylabel('Magnitude')
% title('Magnitude')

fs = 10e3;
t = 0:1/fs:2;
x = vco(sin(2*pi*t),[0.1 0.4]*fs,fs);

stft(x,fs,'Window',kaiser(256,5),'OverlapLength',220,'FFTLength',512)