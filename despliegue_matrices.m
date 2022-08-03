function despliegue_matrices(W,H,octava,umbral)

j = 1;
switch octava
    
%     case 2     
%         for i=1:1:11
%             subplot(11,2,j)
%             plot(W{i});
%             j = j+1;
%             subplot(11,2,j)
%             plot(H(i,:));
%             j = j+1;
%         end
%     case 3
%         for i=12:1:23
%             subplot(13,2,j)
%             plot(W{i});
%             j = j+1;
%             subplot(13,2,j)
%             plot(H(i,:));
%             j = j+1;
%         end      
     case 4
        for i=1:1:7
%             ylabel('Module Spectrogram')
%             ax.FontSize = 15;
%             t.FontSize = 15;
%             title('E2 Spectrogram')
            subplot(7,2,j)
            plot(W{i});        
            axis([0 500 0 0.07])
            if j==1
                t = title('Componentes de W')
                t.FontSize = 16;
            end
            if j==13
                xlabel('Frecuencia (dF)')


            end
                            ax = gca;
                            ax.FontSize = 12;
            j = j+1;
            subplot(7,2,j)
            plot(H(i,:));
            xin = [0 200]; % current y-axis limits
            hold on
            plot([xin(1) xin(2)],[umbral umbral])
            axis([0 200 0 0.07])
            if j==2
                t = title('Filas de H')
                t.FontSize = 16;
            end
            j = j+1;
            if j==15
                xlabel('Tiempo (dT)')


            end
                            ax = gca;
                            ax.FontSize = 12;
        end           
%     case 5
%         for i=36:1:47
%             subplot(12,2,j)
%             plot(W{i});
%             j = j+1;
%             subplot(12,2,j)
%             plot(H(i,:));
%             j = j+1;
%         end            
%     case 6
%         for i=48:1:59
%             subplot(12,2,j)
%             plot(W{i});
%             j = j+1;
%             subplot(12,2,j)
%             plot(H(i,:));
%             j = j+1;
%         end               
%     otherwise
%         disp('VALOR INCORRECTO')
end