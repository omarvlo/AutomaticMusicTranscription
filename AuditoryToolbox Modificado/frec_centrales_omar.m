function dis_freq = frec_centrales_omar(lowFreq, highFreq, N)

%% Frecuencias mínima y máxima
fmin = lowFreq;
fmax = highFreq;

%% distancias mínima y máxima
dmin = calcula_distancia_omar(fmax);
dmax = calcula_distancia_omar(fmin);

%% distribución de distancias
nint = N-2;
%d(1) = dmax;
for i=1:nint
    for j=1:nint
        c = (i)*((dmin-dmax)/(nint+1));
    end
    d(i) = dmax + c;
end

d = d';

%% distribución de frecuencias
for i=1:nint
    %frec(i) = 3.695*1e4*exp(-1.485*d(i));
    frec(i) = 2.003*1e4*exp(-141.2*d(i));
    %frec(i) = f/10;
end
%display('frecuencias nuevas')
%a =  2.021e4
%b = -141.3
dis_freq(1,1) = fmin;
dis_freq(2:length(frec)+1,1) = frec;
dis_freq(nint+2,1) = fmax;
dis_freq(1,2) = dmax;
dis_freq(2:length(frec)+1,2) = d;
dis_freq(nint+2,2) = dmin;
%xlswrite('Omar_Test_140620_2.xlsx',dis_freq)
dis_freq = dis_freq(:,1);
dis_freq = flip(dis_freq);
a = 1;
