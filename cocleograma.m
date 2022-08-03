function representacion_ERB = cocleograma(s,fs,num_filtros,frec_minima,tam)

fcoefs = MakeERBFilters_mod(fs,num_filtros,frec_minima); 

matriz_ERB = ERBFilterBank(s, fcoefs);

for j=1:size(matriz_ERB)
c=max(matriz_ERB(j,:),0);
c=filter([1],[1 -.99],c);
matriz_ERB(j,:)=c;
end


%rep_ERB_original es la matriz con los filtros ERB de la señal
% tam es el tamaño de la ventana a la que se le calculará la raíz de la
% potencia, 23ms con base a Vicent(07)

tam = round(fs*tam);

[canales tam_senal] = size(matriz_ERB);

for i=1:1:canales
    
    cont=1;
    x_total = matriz_ERB(i,:);
    
    for j=1:tam:tam_senal
       
        if j+tam<=tam_senal  
            x_seg = x_total(j:j+tam);
            P=(norm(x_seg)^2)/tam_senal; 
            raiz_P = sqrt(P);
            a(cont) = raiz_P;
            cont = cont+1;  
        end
    end
    
    representacion_ERB(i,:) = a;
    
end
% 
% representacion_ERB = representacion_ERB(:,1:326);
