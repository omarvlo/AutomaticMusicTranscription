function distancia = calcula_distancia_greenwood(freq,L)

%L=L*10;

distancia = L-(16.7*log10((0.006046.*(freq))+1));
%distancia = distancia/10;


