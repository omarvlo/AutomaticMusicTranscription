function energia = calcula_energia (s)

energia=0;
s1 = s;

for i = 1:1:(length(s1)-1)
    a = s1(i,1);
    a_cuadrado = a.^2;                              %%%%%%%%%% Promedio de la energía en el segmento s1
    energia = energia + a_cuadrado;   
end

return

