

%periodo_seg = 0.025;
% tam_segmento = 1;
% no_total = length(s)/periodo;
% x1 = 1;
% x2 = x1 + periodo;

umbral = 0.00020;

[componente col] = size(nmfdH);

encendido=0;

inicio=0;
fin=0;
for i=1:1:componente



cont1=1;
cont2=1;
    for j=1:1:col 
        if (encendido==1&&(nmfdH(i,j)<umbral))
            fin(i,cont1) = j*deltaT;
            encendido=0;
            cont1 = cont1+1;
        end
        if((nmfdH(i,j)>umbral)&&(encendido==0))
            inicio(i,cont2) = j*deltaT;
            encendido=1;
            cont2 = cont2+1;
        end

    end
    
    espectro = nmfdW{i};
    [fil_esp col_esp] = size(espectro);
    for k=1:1:fil_esp
    maximos(k) = max(espectro(k,:));
    end
    [valor ind] = max(maximos);
    frecuencias(i,1)=ind*deltaF;    
    
end

resultados = [frecuencias inicio(:,1:end)];

for i=1:1:componente/2
    subplot(componente/2,1,i)
    vector_activacion = nmfdH(i,:);
    plot(vector_activacion)
end

espectro = nmfdW{1};
    [fil_esp col_esp] = size(espectro);
    for k=1:1:fil_esp
    maximos(k) = max(espectro(k,:));
    end
    [valor ind] = max(maximos);
    frecuencia=ind*deltaF;  
    plot(espectro)
