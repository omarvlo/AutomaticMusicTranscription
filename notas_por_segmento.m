function notas_porsegmento = notas_por_segmento(ventana,matriz_inicios,matriz_originales)

%La ventana se interpeta en milisegundos, para el MIREX la evaluación se
%debe realizar en frames de 10 ms

[filas col] = size(matriz_inicios)

[filas_orig col_orig] = size(matriz_originales);

inicio_compas = 0;
final_compas = 0;
dur_compas = ventana;
%notas_por_compas=1;
conta=1;
num_compas = 1;

matriz_sin_midi = matriz_originales(:,2:col_orig);

a = max(matriz_sin_midi);
limite = max(a);
guardado = 0;

while (final_compas < limite)
    
    if num_compas ~=1
        inicio_compas = final_compas;
        final_compas = dur_compas*num_compas;
    end
    
    for i=1:1:filas
        %notas_por_compas(num_compas,1)=num_compas;
%         inicio_compas
%         final_compas
        matriz_inicios(i,1);
        for j=1:1:col
                %matriz_inicios(i,j)            
            if ((matriz_inicios(i,j)>=inicio_compas)&&(matriz_inicios(i,j)<final_compas)&&(matriz_inicios(i,j)~=0))
                notas_porsegmento(num_compas,conta)=matriz_inicios(i,1);
                conta=conta+1;
                guardado = matriz_inicios(i,1);
            elseif ((j==2)&&(matriz_inicios(i,j)>=inicio_compas)&&(matriz_inicios(i,j)<final_compas))                 
                notas_porsegmento(num_compas,conta)=matriz_inicios(i,1);
                guardado =matriz_inicios(i,1);
                conta=conta+1;
            else
                notas_porsegmento(num_compas,conta) = guardado;
            end
        end
    end
        conta=1;
        num_compas = num_compas + 1;
end