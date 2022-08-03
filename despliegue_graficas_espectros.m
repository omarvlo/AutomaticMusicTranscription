function despliegue_graficas(nmfdW,nmfdH,octava,umbral)

    for i=1:1:88
   media = mean(nmfdH(i,:));
   desv = std(nmfdH(i,:));
   umbral = media+ 3*desv;
   set_umbral(i)=umbral;
        
    end
    
    umbral = mean(set_umbral);

constante_octava = 12;
%octava = octava-2;
[fil col] = size(nmfdH);

a_1 = 40+(constante_octava*octava);
a_2 = 42+(constante_octava*octava);
a_3 = 44+(constante_octava*octava);
a_4 = 45+(constante_octava*octava);
a_5 = 47+(constante_octava*octava);
a_6 = 49+(constante_octava*octava);
a_7 = 51+(constante_octava*octava);

figure(1)
subplot(7,2,1)
plot(nmfdW{a_1});        
subplot(7,2,2)
plot(nmfdH(a_1,:));
hold on          
xin = [0 200]; % current y-axis limits                 
plot([xin(1) xin(2)],[umbral umbral])
axis([0 200 0 2*umbral])

subplot(7,2,3)
plot(nmfdW{a_2});        
subplot(7,2,4)
plot(nmfdH(a_2,:));
hold on
xin = [0 200]; % current y-axis limits                 
plot([xin(1) xin(2)],[umbral umbral])
%axis([0 200 0 4.2269e-4])

subplot(7,2,5)
plot(nmfdW{a_3});        
subplot(7,2,6)
plot(nmfdH(a_3,:));
hold on
xin = [0 200]; % current y-axis limits                 
plot([xin(1) xin(2)],[umbral umbral])
%axis([0 200 0 4.2269e-4])

subplot(7,2,7)
plot(nmfdW{a_4});        
subplot(7,2,8)
plot(nmfdH(a_4,:));
hold on
xin = [0 200]; % current y-axis limits                 
plot([xin(1) xin(2)],[umbral umbral])
%axis([0 200 0 4.2269e-4])

subplot(7,2,9)
plot(nmfdW{a_5});        
subplot(7,2,10)
plot(nmfdH(a_5,:));
hold on
xin = [0 200]; % current y-axis limits                 
plot([xin(1) xin(2)],[umbral umbral])
%axis([0 200 0 4.2269e-4])

subplot(7,2,11)
plot(nmfdW{a_6});        
subplot(7,2,12)
plot(nmfdH(a_6,:));
hold on
xin = [0 200]; % current y-axis limits                 
plot([xin(1) xin(2)],[umbral umbral])
%axis([0 200 0 4.2269e-4])

subplot(7,2,13)
plot(nmfdW{a_7});        
subplot(7,2,14)
plot(nmfdH(a_7,:));
hold on
xin = [0 200]; % current y-axis limits                 
plot([xin(1) xin(2)],[umbral umbral])
axis([0 200 0 4.2269e-4])
