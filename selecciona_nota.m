function nota = selecciona_nota_mir(tono)
    
        if tono < (65.4064+1)%C2
            nota = 36;
        
        elseif ((65.4064+1.1<tono && tono<69.29+2))%C2#
            nota = 37;
        
        elseif ((69.29+2.1<tono && tono<73.41+2))%D2
            nota = 38;
                
        elseif ((73.41+2.1<tono && tono<77.78+2))%D2#
            nota = 39;
                 
        elseif ((77.78+2.1<tono && tono<82.40+3))%E2
            nota = 40;
          
        elseif ((82.40+3.1<tono && tono<87.30+3))%F2
            nota = 41;
                
        elseif ((87.30+3.1<tono && tono<92.49+3))%F2#
            nota = 42;
                  
        elseif ((92.49+3.1<tono && tono<97.99+4))%G2
            nota = 43;
                  
        elseif ((97.99+4.1<tono && tono<103.82+4))%G2#
            nota = 44;
                  
        elseif ((103.82+4.1<tono && tono<110+4))%A2
            nota = 45;
                  
        elseif ((110+4.1<tono && tono<116.54+5))%A2#
            nota = 46;
                  
        elseif ((116.54+5.1<tono && tono<123.47+5))%B2
            nota = 47;
         
        elseif ((123.47+5.1<tono && tono<130.81+5))%C3
            nota = 48;
                 
        elseif ((130.81+5.1<tono && tono<138.59+5))%C3#
            nota = 49;
                 
        elseif ((138.59+5.1<tono && tono<146.83+5))%D3
            nota = 50;
                 
        elseif ((146.83+5.1<tono && tono<155.56+5))%D3#
            nota = 51;
                 
        elseif ((155.56+5.1<tono && tono<164.81+7))%E3
            nota = 52;
         
        elseif ((164.81+7.1<tono && tono<174.61+7))%F3
            nota = 53;
                 
        elseif ((174.61+7.1<tono && tono<184.99+7))%F3#
            nota = 54;
          
        elseif ((184.99+7.1<tono && tono<195.98+7))%G3
            nota = 55;
                 
        elseif ((195.98+7.1<tono && tono<207.65+7))%G3#
            nota = 56;
                  
        elseif ((207.65+7.1<tono && tono<220+9))%A3
            nota = 57;
                  
        elseif ((220+9.1<tono && tono<233.08+9))%A3#
            nota = 58;
                  
        elseif ((233.08+9.1<tono && tono<246.94+9))%B3
            nota = 59;
                  
        elseif ((246.94+9.1<tono && tono<261.62+10))%C4
            nota = 60;
                  
        elseif ((261.62+10.1<tono && tono<277.18+10))%C4#
            nota = 61;
                  
        elseif ((277.18+10.1<tono && tono<293.66+11))%D4
            nota = 62;
         
        elseif ((293.66+11.1<tono && tono<311.12+12))%D4#
            nota = 63;
                 
        elseif ((311.12+12.1<tono && tono<329.62+13))%E4
            nota = 64;
                
        elseif ((329.62+13.1<tono && tono<349.22+13))%F4
            nota = 65;
                 
        elseif ((349.22+13.1<tono && tono<369.99+14))%F4#
            nota = 66;
                 
        elseif ((369.99+14.1<tono && tono<391.99+16))%G4
            nota = 67;
                 
        elseif ((391.99+16.1<tono && tono<415.30+16))%G4#
            nota = 68;
         
        elseif ((415.30+16.1<tono && tono<440+16))%A4
            nota = 69;
                 
        elseif ((440+16.1<tono && tono<466.16+16))%A4#
            nota = 70;
                  
        elseif ((466.16+16.1<tono && tono<493.88+18))%B4
            nota = 71;
                    
        elseif ((493.88+18.1<tono && tono<523.25+18))%C5
            nota = 72;
                    
        elseif ((523.25+18.1<tono && tono<554.36+18))%C5#
            nota = 73;
                    
        elseif ((554.36+18.1<tono && tono<587.33+20))%D5
            nota = 74;
                    
        elseif ((587.336+20.1<tono && tono<622.25+20))%D5#
            nota = 75;
                    
        elseif ((622.25+20.1<tono && tono<659.25+22))%E5
            nota = 76;
                    
        elseif ((659.25+22.1<tono && tono<698.45+22))%F5
            nota = 77;
                    
        elseif ((698.45+22.1<tono && tono<739.98+24))%F5#
            nota = 78;
                    
        elseif ((739.98+24.1<tono && tono<783.99+25))%G5
            nota = 79;
                    
        elseif ((783.99+25.1<tono && tono<830.60+30))%G5#
            nota = 80;
                    
        elseif ((830.60+30.1<tono && tono<880+30))%A5
            nota = 81;
           
        elseif ((880+30.1<tono && tono<932.32+35))%A5#
            nota = 82;
                   
        elseif ((932.32+35.1<tono && tono<987.77+35))%B5
            nota = 83;
            
        elseif ((987.77+35.1<tono && tono<1046.50+35))%C6
            nota = 84;  
            
        elseif ((1046.50+35.1<tono && tono<1108.73+35))%C6#
            nota = 85; 
            
        elseif ((1108.73+35.1<tono && tono<1174.66+35))%D6
            nota = 86;  
            
        elseif ((1174.66+35.1<tono && tono<1244.51+35))%D6#
            nota = 87; 
            
        elseif ((1244.51+35.1<tono && tono<1318.51+35))%E6
            nota = 88;  
            
        elseif ((1318.51+35.1<tono && tono<1396.91+35))%F6
            nota = 89; 
            
        elseif ((1396.91+35.1<tono && tono<1479.98+35))%F6#
            nota = 90; 
            
        elseif ((1479.98+35.1<tono && tono<1567.98+35))%G6
            nota = 91; 
            
        elseif ((1567.98+35.1<tono && tono<	1661.22+35))%G6#
            nota = 92; 
            
        elseif ((1661.22+35.1<tono && tono<1760.00+35))%A6
            nota = 93; 
            
        elseif ((1760.00+35.1<tono && tono<1864.66+35))%A6#
            nota = 94; 
 
        elseif ((1864.66+35.1<tono && tono<1975.53+35))%B6
            nota = 95;
            
        elseif ((1975.53+35.1<tono && tono<2093.00+35))%C7
            nota = 96; 
            
        elseif ((2093.00+35.1<tono && tono<2217.46+35))%C7#
            nota = 97; 
            
        else
            nota = 24;
        end
