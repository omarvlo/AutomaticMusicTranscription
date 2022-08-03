function [s_filtrada, resp_final] =filtros_ERB_Slnaey(fs,num_filtros,frec_minima,espectrograma,banda)
%Se crean 10 filtros ERB entre una frecuencia mínima de 60 
%con una frecuencia de muestreo de 22050Hz
fcoefs = MakeERBFilters_original(fs,num_filtros,frec_minima); 
%La respuesta resultante en frecuencia se calcula de la siguiente manera
% para 2048 puntos
[tam segmento] = size(espectrograma)


puntos = 2*tam;

y = ERBFilterBank([1 zeros(1,puntos-1)], fcoefs);

resp = 20*log10(abs(fft(y')));

%% normalización del filtro
corte = 0; % Si queremos cortar el valor mínimo de los filtros
valor_corte = 60;

[fil col] = size(resp)

if corte==0

min_temporal = 1;

for i=1:1:col
    a = min(resp(:,i));
    if a<min_temporal
        min_temporal = a;
    end
end

valor_minimo = min_temporal*(-1)

%valor_minimo = 60;


for i=1:1:col
    for j=1:1:fil
%         if resp(j,i)<=-60;
%             resp(j,i)=-60;
%         end
        resp(j,i) = resp(j,i)+valor_minimo;
    end
    a = 1;
end


for i=1:1:col
    resp(:,i) = normalize(resp(:,i),'range');
end

else
    

for i=1:1:col
    for j=1:1:fil
        if resp(j,i)<=-valor_corte;
            resp(j,i)=-valor_corte;
        end
        resp(j,i) = resp(j,i)+valor_corte;
    end
    a = 1;
end


for i=1:1:col
    resp(:,i) = normalize(resp(:,i),'range');
end

end

%% FILTRADO DEL ESPECTROGRAMA
% for i=1:1:num_filtros 
%     for j=1:1:segmento
%         filtros_ERB(:,segmento) = resp(:,i).*espectrograma(:,segmento);
%     end
% end

% for i=1:1:col
%     resp_final(:,i) = resp(tam:tam*2-1,i); % se acota a cada filtro a la mitad de su propio espejo
% end

for i=1:1:col
    resp_final(:,i) = resp(1:tam,i); % se acota a cada filtro a la mitad de su propio espejo
end



for i=1:1:segmento
    for j=1:1:num_filtros-1
        filtros_ERB(:,i) = resp_final(:,j).*espectrograma(:,i);
    end
end

s_filtrada = filtros_ERB;

a = 1;

% [fil col] = size(espectrograma)
% for i=1:1:col
% figure(1)
% subplot(col,1,i)
% plot (espectrograma(:,i))
% end
% 
% [fil col] = size(s_filtrada)
% for i=1:1:col
% figure(2)
% subplot(col,1,i)
% plot (s_filtrada(:,i))
% end

