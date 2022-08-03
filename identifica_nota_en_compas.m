function notas_por_compas = identifica_nota_en_compas(bpm,fraccion,num_compases,matriz_inicios)

[filas col] = size(matriz_inicios)

tempo = bpm;
negra = 60/tempo;
compas = fraccion; %este es el factor para un compas de 3/8
dur_compas = negra*compas;

%num_compas=1;
total_compases = num_compases;
inicio_compas = 0;
final_compas = dur_compas;
%notas_por_compas=1;
conta=1;

for num_compas=1:total_compases
    
    if num_compas ~=1
        inicio_compas = final_compas;
        final_compas = dur_compas*num_compas;
    end
    
    for i=1:1:filas
        %notas_por_compas(num_compas,1)=num_compas;
%         inicio_compas
%         final_compas
        matriz_inicios(i,1)
        for j=1:1:col
                %matriz_inicios(i,j)            
            if ((matriz_inicios(i,j)>=inicio_compas)&&(matriz_inicios(i,j)<final_compas)&&(matriz_inicios(i,j)~=0))
                notas_por_compas(num_compas,conta)=matriz_inicios(i,1);
                conta=conta+1;  
            else
                if ((j==2)&&(matriz_inicios(i,j)>=inicio_compas)&&(matriz_inicios(i,j)<final_compas))
                notas_por_compas(num_compas,conta)=matriz_inicios(i,1);
                conta=conta+1;
                end
            end
        end
    end
        conta=1;
end