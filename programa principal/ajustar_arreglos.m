function [reconocidos_out originales_out] = ajustar_arreglos(reconocidos_in,originales_in)

[filas_rec columnas_rec] = size(reconocidos_in);
[filas_orig columnas_orig] = size(originales_in);

reconocidos_out = reconocidos_in(1:filas_rec,:);

originales_out = originales_in(1:filas_rec,:);