function [espectro_prom resp_final] =filtros_ERB(fs,num_filtros,frec_minima,espectro,transcrip,modelo)
%Se crean filtros ERB entre una frec_minima 
%a la frecuencia de muestro fs

if modelo == 1
    fcoefs = MakeERBFilters_mod(fs,num_filtros,frec_minima); 
elseif modelo==2
    fcoefs = MakeERBFilters_original(fs,num_filtros,frec_minima); 
elseif modelo==3
    fcoefs = MakeERBFilters_mod_greenwood(fs,num_filtros,frec_minima); 
end

%La respuesta resultante en frecuencia se calcula de la siguiente manera
% para 2048 puntos

[tam segmento] = size(espectro);

puntos = 2*tam;

y = ERBFilterBank([1 zeros(1,puntos-1)], fcoefs);

resp = 20*log10(abs(fft(y')));

%% normalización del filtro
corte = 0; % Si queremos cortar el valor mínimo de los filtros
%valor_corte = 60;

[fil col] = size(resp);

if corte==0

min_temporal = 1;

for i=1:1:col
    a = min(resp(:,i));
    if a<min_temporal
        min_temporal = a;
    end
end

valor_minimo = min_temporal*(-1);

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

%% FILTRADO DEL ESPECTRO

for i=1:1:col
    resp_final(:,i) = resp(1:tam,i); % se acota a cada filtro a la mitad de su propio espejo
end

sz = size(espectro);
espectro_sum = zeros(sz);


if transcrip ==1
    
for i=1:1:num_filtros
    for j=1:1:segmento
        espectros_filtrados(:,i) = resp_final(:,i).*espectro(:,j);  
        for k=1:1:tam
            espectro_prome(k,:) = mean(espectros_filtrados(k,:));
        end
        espectro_prom(:,j) = espectro_prome;
    end
end

    
else
    

[tam segmento] = size(espectro);
    
for i=1:1:num_filtros
    for j=1:1:segmento
        espectros_filtrados(:,i) = resp_final(:,i).*espectro(:,j);
        espectro_fil = resp_final(:,i).*espectro(:,j);
        espectro_sum = espectro_sum + espectro_fil;
    end
end

for i=1:1:tam
    espectro_prom(i,:) = mean(espectros_filtrados(i,:));
end

end


