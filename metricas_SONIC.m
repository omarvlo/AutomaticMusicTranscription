function metricas = metricas_SONIC(midiname_original, transcrita)

tam_segmento = 0.010 % se analiza por ventanas de 10 ms de acuerdo con las metricas del MIREX
[originales_inicios originales_finales] = lector_midi_SONIC(midiname_original);
originales = adapta_resolucion(originales_inicios, originales_finales, tam_segmento);
[resultados_inicios resultados_finales] = lector_midi_SONIC(transcrita);
reconocidos = adapta_resolucion(resultados_inicios, resultados_finales, tam_segmento);
notas_porsegmento_original = notas_por_segmento_mod(tam_segmento,originales,originales);
notas_porsegmento = notas_por_segmento_mod(tam_segmento,reconocidos,originales);

[notas_porsegmento notas_porsegmento_original] = ajustar_arreglos(notas_porsegmento,notas_porsegmento_original);

metricas = calcula_metricas(notas_porsegmento,notas_porsegmento_original);
% mirex_metricas_old = calcula_precision_mirex(notas_porsegmento, notas_porsegmento_original);
% % 
% mirex_metricas_old = mirex_metricas_old'