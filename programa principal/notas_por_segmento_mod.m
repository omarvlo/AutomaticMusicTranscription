function notas_porsegmento = notas_por_segmento_mod(ventana,matriz_inicios,matriz_originales)

%La ventana se interpeta en milisegundos, para el MIREX la evaluación se
%debe realizar en frames de 10 ms

[filas col] = size(matriz_inicios)

[filas_orig col_orig] = size(matriz_originales);

segmento_inicio = 0;
segmento_final = 0;
dur_compas = ventana;
%notas_por_compas=1;
conta=1;
num_compas = 1;

matriz_sin_midi = matriz_originales(:,2:col_orig);

a = max(matriz_sin_midi);
limite = max(a);
guardado = 0;
num_segmento = 1;

while (segmento_final < limite)
    
        if num_segmento ~=1
            segmento_inicio = segmento_final;
        end
        segmento_final = dur_compas*num_segmento;  
        
    for i=1:1:filas
        

        
        %notas_por_compas(num_compas,1)=num_compas;
%         segmento_inicio
%         segmento_final
        matriz_inicios(i,1);

        for j=2:1:col
                %matriz_inicios(i,j);          
            if ((matriz_inicios(i,j)>segmento_inicio)&&(matriz_inicios(i,j)<=segmento_final)&&(matriz_inicios(i,j)~=0))
                notas_porsegmento(num_segmento,conta)=matriz_inicios(i,1);
                guardado = matriz_inicios(i,1);
                conta=conta+1;
                break
%             elseif ((j==2)&&(matriz_inicios(i,j)>=segmento_inicio)&&(matriz_inicios(i,j)<segmento_final))%caso 1 (único)                 
%                 notas_porsegmento(num_compas,conta)=matriz_inicios(i,1);
%                 guardado=matriz_inicios(i,1);
%                 conta=conta+1;
%             else
%                 notas_porsegmento(num_segmento,conta) = guardado;
%                 conta=conta+1;  
            end
        end
        
    end
        conta=1;
        num_segmento = num_segmento + 1;
end