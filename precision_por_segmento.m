function notas_por_segmento = notas_porsegmento(ventana,matriz_inicios)

%La ventana se interpeta en milisegundos, para el MIREX la evaluación se
%debe realizar en frames de 10 ms

[filas col] = size(matriz_inicios)

inicio_compas = 0;
final_compas = 0;
dur_compas = ventana;
%notas_por_compas=1;
conta=1;
num_compas = 1;

a = max(matriz_inicios);
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
                notas_por_segmento(num_compas,conta)=matriz_inicios(i,1);
                conta=conta+1;
                guardado = matriz_inicios(i,1);
            elseif ((j==2)&&(matriz_inicios(i,j)>=inicio_compas)&&(matriz_inicios(i,j)<final_compas))                 
                notas_por_segmento(num_compas,conta)=matriz_inicios(i,1);
                guardado =matriz_inicios(i,1);
                conta=conta+1;
            else
                notas_por_segmento(num_compas,conta) = guardado;
            end
        end
    end
        conta=1;
        num_compas = num_compas + 1;
end