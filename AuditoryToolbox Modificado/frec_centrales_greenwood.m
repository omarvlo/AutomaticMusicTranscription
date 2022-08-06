function dis_freq = frec_centrales_greenwood(lowFreq, highFreq, N)

L = 35
%% Frecuencias mínima y máxima
fmin = lowFreq;
fmax = highFreq;

%% distancias mínima y máxima
dmin = calcula_distancia_greenwood(fmax,L);
dmax = calcula_distancia_greenwood(fmin,L);

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

A = 165.4;
a = 0.06;


%% distribución de frecuencias
for i=1:nint
    frec(i) = A*((10.^(a*(L-d(i))))-1);
    %frec(i) = 3.695*1e4*exp(-1.485*d(i));
    %frec(i) = f/10;
end
dis_freq(1,1) = fmin;
dis_freq(2:length(frec)+1,1) = frec;
dis_freq(nint+2,1) = fmax;
dis_freq(1,2) = dmax;
dis_freq(2:length(frec)+1,2) = d;
dis_freq(nint+2,2) = dmin;
%xlswrite('Omar_Test_140620_2.xlsx',dis_freq)
dis_freq = dis_freq(:,1);
dis_freq = flip(dis_freq);
a=0;
