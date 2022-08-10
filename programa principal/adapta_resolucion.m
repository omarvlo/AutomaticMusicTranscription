function matriz = adapta_resolucion(matriz_inicios, matriz_finales, paso)

[filas, col_orig] = size(matriz_inicios);

tiempos_inicios = matriz_inicios(:,2:col_orig); %se quitan las notas en cada matriz para que sea más fácil trabajar con los tiempos
tiempos_finales = matriz_finales(:,2:col_orig);

[filas, col] = size(tiempos_inicios);

%matriz=0;
cont=0;

for i=1:1:filas
    
    for j=1:1:col
        
        segmento = (tiempos_finales(i,j) - tiempos_inicios(i,j))/paso;
        
        if segmento~=0
        for k=1:1:segmento
            
            if k==1
                matriz(i,k+cont) = tiempos_inicios(i,j);
            else
            matriz(i,k+cont) = matriz(i,k+cont-1) + paso;
            end
            
        end
        cont = cont + k;
        elseif (cont~=0)
            matriz(i,cont)=0;
            cont = cont + 1;
        else
            matriz(i,j)=0;
        end
    end
    cont = 0;
end

columna_notas = matriz_inicios(:,1);% se devuelve la columna de los valores de notas midi
%Add new column
matriz = [columna_notas matriz];

a=1;



