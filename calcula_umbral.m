function umbral = calcula_umbral(nmfdH,porcentaje_umbral)

[x,y] = size(nmfdH);

porcentaje_umbral = porcentaje_umbral/100;

for i=1:1:x   
    maximo = max(nmfdH(i,:));
    maximos(i,1) = maximo;
end

maximo_maximos = (max(maximos));
umbral = porcentaje_umbral*maximo_maximos;