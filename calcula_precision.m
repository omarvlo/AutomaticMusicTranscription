
function [precision precision_recall] = calcula_precision(notas_originales, notas_reconocidas)

[fil_orig col_orig] = size(notas_originales);
[fil_rec col_rec] = size(notas_reconocidas);

if col_orig>col_rec
    columnas = col_rec;
else
    columnas = col_orig;
end

num_notas=0;
num_notas_rec=0;
verdaderos_positivos=0;
falsos_negativos=0;
for i=1:1:fil_orig
    
    for j=1:1:columnas
        
        if (notas_originales(i,j)~=0)
            nota = notas_originales(i,j);
            num_notas = num_notas+1;
                
            for k=1:1:col_rec
                if ((nota == notas_reconocidas(i,k))&&(notas_reconocidas(i,j)~=0))
                    num_notas_rec = num_notas_rec + 1;
                    break
                end
            end
            
            for k=1:1:col_rec
                if ((nota == notas_reconocidas(i,k))&&(notas_reconocidas(i,j)~=0))
                    verdaderos_positivos = verdaderos_positivos + 1;
                elseif (notas_reconocidas(i,j)~=0)
                    falsos_negativos = falsos_negativos + 1;
                end
            end
            
        end
        
    end
    
    precision(i,1) = (num_notas_rec/num_notas)*100;
    precision_recall(i,1) = (num_notas_rec/(num_notas_rec+falsos_negativos))*100;
    
    num_notas=0;
    num_notas_rec=0;
    falsos_negativos=0;
end
a=1;

