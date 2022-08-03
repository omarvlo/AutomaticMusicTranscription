function rep_ERB = simplifica_ERB(rep_ERB_original, tam, fs)

%rep_ERB_original es la matriz con los filtros ERB de la señal
% tam es el tamaño de la ventana a la que se le calculará la raíz de la
% potencia, 23ms con base a Vicent(07)

tam = round(fs*tam);

[canales tam_senal] = size(rep_ERB_original);

for i=1:1:canales
    
    cont=1;
    x_total = rep_ERB_original(i,:);
    
    for j=1:tam:tam_senal
       
        if j+tam<=tam_senal  
            x_seg = x_total(j:j+tam);
            P=(norm(x_seg)^2)/tam_senal; 
            raiz_P = sqrt(P);
            a(cont) = raiz_P;
            cont = cont+1;  
        end
    end
    
    rep_ERB(i,:) = a;
    
end

