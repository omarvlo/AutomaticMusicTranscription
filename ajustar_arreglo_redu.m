function arreglo = ajustar_arreglo_redu(arreglo_in,arreglo_ok)

[filas columnas] = size(arreglo_ok)

[filas2 columnas2] = size(arreglo_in)

if filas<filas2
arreglo = arreglo_in(1:filas,:);
else
arreglo = arreglo_in(1:filas2,:);    
end

hola = 1;
