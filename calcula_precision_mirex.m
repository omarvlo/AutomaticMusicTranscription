function mirex_metricas = calcula_precision_mirex(reconocido, original)

[fil1 col1] = size(reconocido)
[fil2 col2] = size(original)

accuracy = 0;

sobrante = fil1-fil2

%reconocido = ajustar_arreglo(reconocido,sobrante);

[porcentajes_precision porcentajes_recall] = calcula_precision(reconocido,original);

porcentajes_precision(isnan(porcentajes_precision))= min(porcentajes_precision);

porcentajes_recall(isnan(porcentajes_recall))= min(porcentajes_recall);

suma_precision = sum(porcentajes_precision);

suma_recall = sum(porcentajes_recall);

for i=1:1:length(porcentajes_precision)
    
    if (porcentajes_precision(i,1)==100)
        accuracy = accuracy + 1;
    end
end


mirex_precision = suma_precision/length(porcentajes_precision);

mirex_recall = suma_recall/length(porcentajes_recall);

mirex_exactitud = (accuracy/length(porcentajes_precision))*100;

mirex_metricas= [mirex_precision; mirex_recall; mirex_exactitud];
