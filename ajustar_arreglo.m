function arreglo = ajustar_arreglo(arreglo_in,sobrante)

[filas columnas] = size(arreglo_in)
arreglo = arreglo_in(sobrante+1:filas,:);


