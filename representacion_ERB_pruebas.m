clear variables
clc
clear all

% initialization
inpPath = '../data/';
outPath = 'output/';

% create output directory, if it doesn't exist
if ~exist(outPath, 'dir')
  mkdir(outPath);
end

%Bach_Minuet_in_G      
%Prelude_I_in_C_major_BWV_846
%Fr_Elise
%Mozart_-_Piano_Sonata
% Borodin__Polovstian_Dance
% Chopin__Prelude_Op._28_No._20_in_C_minor
% Massenet__Elegy_in_E_minor
% Mendelssohn__Wedding_March
% Mozart__Eine_Kleine_Nachtmusik
% Mozart__Fantasy_No._3_in_D_minor
%Beethoven__Minuet_in_G_major
%Beethoven__Sonata_Pathetique_2nd_Mov
%Brahms__Waltz_No._9_in_D_minor
%Brahms__Waltz_No._15_in_A-flat_major
%Chopin__Minute_Waltz_Op._64_No._1_in_D-flat_major
%Chopin__Nocturne_Op._9_No._2_in_E-flat_major
%Chopin__Prelude_Op._28_No._6_in_B_minor
%Chopin__Prelude_Op._28_No._7_in_A_major
%Chopin__Waltz_Op._64_No._2_in_Csharp_minor
%Clementi__Sonatina_Op._36_No._1
%Field__Nocturne_in_B-flat_major
%Grieg__Canon_Op._38_No._8
%Grieg__Peer_Gynt_Morning
%Handel__Sarabande_in_D_minor
%Mendelssohn__Venetian_Boat_Song_Op._19b_No._6


fs = 44100;

base_MAPS = 0; %SE ELIGE LA BASE DE DATOS 
                %1 MAPS
                %0 Base de datos de Maestrí       
resampleo=1;
                
con_filtros = 1;

% Filtros ERBs
num_filtros = 50;
frec_minima = 60; %60 Hz para el C2

reduce = 2; %determina en cuanto se reduce la Fs
            %por ejemplo 2 sería una reducción de Fs/2


filenameE2 = 'E2_1.wav'; %base de datos de maestría
filenameG2 = 'G2.wav';
filenameA2 = 'A2.wav';
filenameB2 = 'B2.wav';%
filenameC3 = 'C3.wav';
filenameD3 = 'D3.wav';%
filenameE3 = 'E3_1.wav';%base de datos de maestría
filenameFsos3= 'F3#_1.wav';%base de datos de maestría
filenameG3= 'G3_1.wav';%base de datos de maestría
filenameGsos3= 'G3#.wav';
filenameA3= 'A3.wav';
filenameB3 = 'B3.wav';
filenameC4 = 'C4.wav';
filenameCsos4 = 'C4#_1.wav';%base de datos de maestría
filenameD4 = 'D4_1.wav';%base de datos de maestría
filenameE4 = 'E4.wav'; 
filenameF4 = 'F4.wav';
filenameFsos4 = 'F4#.wav';%
filenameG4 = 'G4.wav';
filenameGsos4 = 'G4#.wav';
filenameA4 = 'A4.wav';
filenameB4 = 'B4.wav';
filenameC5 = 'C5.wav';
filenameCsos5 = 'C5#.wav';%
filenameD5 = 'D5.wav';
filenameDsos5 = 'D5#.wav';
filenameE5 = 'E5.wav';
filenameF5 = 'F5.wav';
filenameFsos5 = 'F5#.wav';%
filenameG5 = 'G5.wav';%
filenameA5 = 'A5.wav';%
filenameB5 = 'B5.wav';%
filenameE6 = 'E6.wav';
filenameF3 = 'F3_1.wav';%base de datos de maestría
filenameEb4 = 'D4#.wav';
filenameBb4 = 'A4#.wav';
filenameBb3 = 'A3#.wav';
filenameBb5 = 'A5#.wav';
filenameC6 = 'C6.wav';
filenameD2 = 'D2.wav';
filenameDsos2 = 'D2#_1.wav';  %base de datos de maestría
filenameAsos2 = 'A2#_1.wav'; %base de datos de maestría
filenameD6 = 'D6.wav';
filenameA6 = 'A6.wav';
filenameC7 = 'C7.wav';
filenameE7 = 'E7.wav';
filenameD7 = 'D7.wav'; 
filenameB6 = 'B6.wav';%
filenameBb6 = 'A6#.wav';
filenameGsos6 = 'G6#.wav';
filenameG6 = 'G6.wav';%
filenameFsos6 = 'F6#.wav';%
filenameF6 = 'F6.wav';%
filenameDsos6 = 'D6#.wav';
filenameCsos6 = 'C6#.wav';%
filenameGsos5 = 'G5#.wav';
filenameF2 = 'F2_1.wav';% base de datos de maestría
filenameFsos2 = 'F2#.wav';%
filenameDsos3 = 'D3#.wav';
filenameC2 = 'C2.wav';

filenameA0 = 'A0.wav'; 
filenameAsos0 = 'A0#.wav'; 
filenameB0 = 'B0.wav'; 
filenameC1 = 'C1.wav'; 
filenameCsos1 = 'C1#.wav'; 
filenameD1 = 'D1.wav'; 
filenameDsos1 = 'D1#.wav'; 
filenameE1 = 'E1.wav'; 
filenameF1 = 'F1.wav'; 
filenameFsos1 = 'F1#.wav'; 
filenameG1 = 'G1.wav'; 
filenameGsos1 = 'G1#.wav'; 
filenameA1 = 'A1.wav'; 
filenameAsos1 = 'A1#.wav'; 
filenameB1 = 'B1.wav'; 
filenameCsos2 = 'C2#.wav';%
filenameGsos2 = 'G2#.wav';%
filenameCsos3 = 'C3#_1.wav';% base de datos de maestría
filenameAsos5 = 'A5#.wav';%
filenameC8 = 'C8.wav'; 
filenameB7 = 'B7.wav'; 
filenameAsos7 = 'A7#.wav'; 
filenameA7 = 'A7.wav'; 
filenameGsos7 = 'G7#.wav'; 
filenameG7 = 'G7.wav'; 
filenameFsos7 = 'F7#.wav'; 
filenameF7 = 'F7.wav'; 
filenameDsos7 = 'D7#.wav'; 
filenameCsos7 = 'C7#.wav'; 


[xE2, fsE2] = audioread([inpPath filenameE2]);
[xG2, fsG2] = audioread([inpPath filenameG2]);
[xA2, fsA2] = audioread([inpPath filenameA2]);
[xB2, fsB2] = audioread([inpPath filenameB2]);
[xC3, fsC3] = audioread([inpPath filenameC3]);
[xD3, fsD3] = audioread([inpPath filenameD3]);
[xE3, fsE3] = audioread([inpPath filenameE3]);
[xFsos3, fsFsos3] = audioread([inpPath filenameFsos3]);
[xG3, fsG3] = audioread([inpPath filenameG3]);
[xGsos3, fsGsos3] = audioread([inpPath filenameGsos3]);
[xA3, fsA3] = audioread([inpPath filenameA3]);
[xB3, fsB3] = audioread([inpPath filenameB3]);
[xC4, fsC4] = audioread([inpPath filenameC4]);
[xCsos4, fsCsos4] = audioread([inpPath filenameCsos4]);
[xD4, fsD4] = audioread([inpPath filenameD4]);
[xE4, fsE4] = audioread([inpPath filenameE4]);
[xF4, fsF4] = audioread([inpPath filenameF4]);
[xFsos4, fsFsos4] = audioread([inpPath filenameFsos4]);
[xG4, fsG4] = audioread([inpPath filenameG4]);
[xGsos4, fsGsos4] = audioread([inpPath filenameGsos4]);
[xA4, fsA4] = audioread([inpPath filenameA4]);
[xB4, fsB4] = audioread([inpPath filenameB4]);
[xC5, fsC5] = audioread([inpPath filenameC5]);
[xCsos5, fsCsos5] = audioread([inpPath filenameCsos5]);
[xD5, fsD5] = audioread([inpPath filenameD5]);
[xDsos5, fsDsos5] = audioread([inpPath filenameDsos5]);
[xE5, fsE5] = audioread([inpPath filenameE5]);
[xF5, fsF5] = audioread([inpPath filenameF5]);
[xFsos5, fsFsos5] = audioread([inpPath filenameFsos5]);
[xG5, fsG5] = audioread([inpPath filenameG5]);
[xA5, fsA5] = audioread([inpPath filenameA5]);
[xB5, fsB5] = audioread([inpPath filenameB5]);
[xE6, fsE6] = audioread([inpPath filenameE6]);

[xF3, fsF3] = audioread([inpPath filenameF3]);
[xEb4, fsEb4] = audioread([inpPath filenameEb4]);
[xBb4, fsBb4] = audioread([inpPath filenameBb4]);

[xBb3, fsBb3] = audioread([inpPath filenameBb3]);
[xBb5, fsBb5] = audioread([inpPath filenameBb5]);
[xC6, fsC6] = audioread([inpPath filenameC6]);
[xD2, fsD2] = audioread([inpPath filenameD2]);
[xDsos2, fsDsos2] = audioread([inpPath filenameDsos2]);
[xAsos2, fsAsos2] = audioread([inpPath filenameAsos2]);
[xD6, fsD6] = audioread([inpPath filenameD6]);
[xA6, fsA6] = audioread([inpPath filenameA6]);
[xC7, fsC7] = audioread([inpPath filenameC7]);
[xE7, fsE7] = audioread([inpPath filenameE7]);
[xD7, fsD7] = audioread([inpPath filenameD7]);
[xB6, fsB6] = audioread([inpPath filenameB6]);
[xBb6, fsBb6] = audioread([inpPath filenameBb6]);
[xGsos6, fsGsos6] = audioread([inpPath filenameGsos6]);
[xG6, fsG6] = audioread([inpPath filenameG6]);
[xFsos6, fsFsos6] = audioread([inpPath filenameFsos6]);
[xF6, fsF6] = audioread([inpPath filenameF6]);
[xDsos6, fsDsos6] = audioread([inpPath filenameDsos6]);
[xCsos6, fsCsos6] = audioread([inpPath filenameCsos6]);
[xGsos5, fsGsos5] = audioread([inpPath filenameGsos5]);
[xF2, fsF2] = audioread([inpPath filenameF2]);
[xFsos2, fsFsos2] = audioread([inpPath filenameFsos2]);
[xDsos3, fsDsos3] = audioread([inpPath filenameDsos3]);
[xC2, fsC2] = audioread([inpPath filenameC2]);

[xA0, fsA0] = audioread([inpPath filenameA0]);
[xAsos0, fsAsos0] = audioread([inpPath filenameAsos0]);
[xB0, fsB0] = audioread([inpPath filenameB0]);
[xC1, fsC1] = audioread([inpPath filenameC1]);
[xCsos1, fsCsos1] = audioread([inpPath filenameCsos1]);
[xD1, fsD1] = audioread([inpPath filenameD1]);
[xDsos1, fsDsos1] = audioread([inpPath filenameDsos1]);
[xE1, fsE1] = audioread([inpPath filenameE1]); 
[xF1, fsF1] = audioread([inpPath filenameF1]);
[xFsos1, fsFsos1] = audioread([inpPath filenameFsos1]);
[xG1, fsG1] = audioread([inpPath filenameG1]);
[xGsos1, fsGsos1] = audioread([inpPath filenameGsos1]);
[xA1, fsA1] = audioread([inpPath filenameA1]);
[xAsos1, fsAsos1] = audioread([inpPath filenameAsos1]);
[xB1, fsB1] = audioread([inpPath filenameB1]);
[xCsos2, fsCsos2] = audioread([inpPath filenameCsos2]);
[xGsos2, fsGsos2] = audioread([inpPath filenameGsos2]);
[xCsos3, fsCsos3] = audioread([inpPath filenameCsos3]);
[xAsos5, fsAsos5] = audioread([inpPath filenameAsos5]);
[xC8, fsC8] = audioread([inpPath filenameC8]);
[xB7, fsB7] = audioread([inpPath filenameB7]); 
[xAsos7, fsAsos7] = audioread([inpPath filenameAsos7]);
[xA7, fsA7] = audioread([inpPath filenameA7]);
[xGsos7, fsGsos7] = audioread([inpPath filenameGsos7]);
[xG7, fsG7] = audioread([inpPath filenameG7]);
[xFsos7, fsFsos7] = audioread([inpPath filenameFsos7]);
[xF7, fsF7] = audioread([inpPath filenameF7]);
[xDsos7, fsDsos7] = audioread([inpPath filenameDsos7]);
[xCsos7, fsCsos7] = audioread([inpPath filenameCsos7]);

% make monaural if necessary

xE2 = mean(xE2, 2);
xG2 = mean(xG2, 2);
xA2 = mean(xA2, 2);
xC3 = mean(xC3, 2);
xE3 = mean(xE3, 2);
xG3 = mean(xG3, 2);
xGsos3 = mean(xGsos3, 2);

xB3 = mean(xB3, 2);
xC4 = mean(xC4, 2);
xD4 = mean(xD4, 2);
xE4 = mean(xE4, 2);
xF4 = mean(xF4, 2);
xG4 = mean(xG4, 2);
xGsos4 = mean(xGsos4, 2);
xA4 = mean(xA4, 2);
xB4 = mean(xB4, 2);
xC5 = mean(xC5, 2);
xD5 = mean(xD5, 2);
xDsos5 = mean(xDsos5, 2);
xE5 = mean(xE5, 2);
xF5 = mean(xF5, 2);
xE6 = mean(xE6, 2);

xB2 = mean(xB2, 2);
xD3 = mean(xD3, 2);
xFsos3 = mean(xFsos3, 2);
xCsos4 = mean(xCsos4, 2);
xFsos4 = mean(xFsos4, 2);
xCsos5 = mean(xCsos5, 2);
xFsos5 = mean(xFsos5, 2);
xG5 = mean(xG5, 2);
xA5 = mean(xA5, 2);
xB5 = mean(xB5, 2);

xF3 = mean(xF3, 2);
xEb4 = mean(xEb4, 2);
xBb4 = mean(xBb4, 2);

xBb3 = mean(xBb3, 2);
xBb5 = mean(xBb5, 2);
xC6 = mean(xC6, 2);
xD2 = mean(xD2, 2);
xDsos2 = mean(xDsos2, 2);
xAsos2 = mean(xAsos2, 2);
xD6 = mean(xD6, 2);
xA6 = mean(xA6, 2);
xC7 = mean(xC7, 2);
xE7 = mean(xE7, 2);
xD7 = mean(xD7, 2);
xB6 = mean(xB6, 2);
xBb6 = mean(xBb6, 2);
xGsos6 = mean(xGsos6, 2);
xG6 = mean(xG6, 2);
xFsos6 = mean(xFsos6, 2);
xF6 = mean(xF6, 2);
xDsos6 = mean(xDsos6, 2);
xCsos6 = mean(xCsos6, 2);
xGsos5 = mean(xGsos5, 2);
xF2 = mean(xF2, 2);
xFsos2 = mean(xFsos2, 2);
xDsos3 = mean(xDsos3, 2);
xC2 = mean(xC2, 2);

xA0 = mean(xA0, 2);
xAsos0 = mean(xAsos0, 2);
xB0 = mean(xB0, 2);
xC1 = mean(xC1, 2);
xCsos1 = mean(xCsos1, 2);
xD1 = mean(xD1, 2);
xDsos1 = mean(xDsos1, 2);
xE1 = mean(xE1, 2);
xF1 = mean(xF1, 2);
xFsos1 = mean(xFsos1, 2);
xG1 = mean(xG1, 2);
xGsos1 = mean(xGsos1, 2);
xA1 = mean(xA1, 2);
xAsos1 = mean(xAsos1, 2);
xB1 = mean(xB1, 2);
xCsos2 = mean(xCsos2, 2);
xGsos2 = mean(xGsos2, 2);
xCsos3 = mean(xCsos3, 2);
xAsos5 = mean(xAsos5, 2);
xC8 = mean(xC8, 2);
xB7 = mean(xB7, 2);
xAsos7 = mean(xAsos7, 2);
xA7 = mean(xA7, 2);
xGsos7 = mean(xGsos7, 2);
xG7 = mean(xG7, 2);
xFsos7 = mean(xFsos7, 2);
xF7 = mean(xF7, 2);
xDsos7 = mean(xDsos7, 2);
xCsos7 = mean(xCsos7, 2);

[P,Q] = rat((fs/reduce)/fs); %se vuelven a samplear los archivos a la mitad de frecuencia

if resampleo == 1

xE2 = resample(xE2,P,Q);
xG2 = resample(xG2,P,Q);
xA2 = resample(xA2,P,Q);
xC3 = resample(xC3,P,Q);
xE3 = resample(xE3,P,Q);
xG3 = resample(xG3,P,Q);
xGsos3 = resample(xGsos3,P,Q);
xA3 = resample(xA3,P,Q);
xB3 = resample(xB3,P,Q);
xC4 = resample(xC4,P,Q);
xD4 = resample(xD4,P,Q);
xE4 = resample(xE4,P,Q);
xF4 = resample(xF4,P,Q);
xG4 = resample(xG4,P,Q);
xGsos4 = resample(xGsos4,P,Q);
xA4 = resample(xA4,P,Q);
xB4 = resample(xB4,P,Q);
xC5 = resample(xC5,P,Q);
xD5 = resample(xD5,P,Q);
xDsos5 = resample(xDsos5,P,Q);
xE5 = resample(xE5,P,Q);
xF5 = resample(xF5,P,Q);
xE6 = resample(xE6,P,Q);

xB2 = resample(xB2,P,Q);
xD3 = resample(xD3,P,Q);
xFsos3 = resample(xFsos3,P,Q);
xCsos4 = resample(xCsos4,P,Q);
xFsos4 = resample(xFsos4,P,Q);
xCsos5 = resample(xCsos5,P,Q);
xFsos5 = resample(xFsos5,P,Q);
xG5 = resample(xG5,P,Q);
xA5 = resample(xA5,P,Q);
xB5 = resample(xB5,P,Q);

xF3 = resample(xF3,P,Q);
xEb4 = resample(xEb4,P,Q);
xBb4 = resample(xBb4,P,Q);


xBb3 = resample(xBb3,P,Q);
xBb5 = resample(xBb5,P,Q);
xC6 = resample(xC6,P,Q);
xD2 = resample(xD2,P,Q);
xDsos2 = resample(xDsos2,P,Q);
xAsos2 = resample(xAsos2,P,Q);
xD6 = resample(xD6,P,Q);
xA6 = resample(xA6,P,Q);
xC7 = resample(xC7,P,Q);
xE7 = resample(xE7,P,Q);
xD7 = resample(xD7,P,Q);
xB6 = resample(xB6,P,Q);
xBb6 = resample(xBb6,P,Q);
xGsos6 = resample(xGsos6,P,Q);
xG6 = resample(xG6,P,Q);
xFsos6 = resample(xFsos6,P,Q);
xF6 = resample(xF6,P,Q);
xDsos6 = resample(xDsos6,P,Q);
xCsos6 = resample(xCsos6,P,Q);
xGsos5 = resample(xGsos5,P,Q);
xF2 = resample(xF2,P,Q);
xFsos2 = resample(xFsos2,P,Q);
xDsos3 = resample(xDsos3,P,Q);
xC2 = resample(xC2,P,Q);

xA0 = resample(xA0,P,Q);
xAsos0 = resample(xAsos0,P,Q);
xB0 = resample(xB0,P,Q);
xC1 = resample(xC1,P,Q);
xCsos1 = resample(xCsos1,P,Q);
xD1 = resample(xD1,P,Q);
xDsos1 = resample(xDsos1,P,Q);
xE1 = resample(xE1,P,Q);
xF1 = resample(xF1,P,Q);
xFsos1 = resample(xFsos1,P,Q);
xG1 = resample(xG1,P,Q);
xGsos1 = resample(xGsos1,P,Q);
xA1 = resample(xA1,P,Q);
xAsos1 = resample(xAsos1,P,Q);
xB1 = resample(xB1,P,Q);
xCsos2 = resample(xCsos2,P,Q);
xGsos2 = resample(xGsos2,P,Q);
xCsos3 = resample(xCsos3,P,Q);
xAsos5 = resample(xAsos5,P,Q);
xC8 = resample(xC8,P,Q);
xB7 = resample(xB7,P,Q);
xAsos7 = resample(xAsos7,P,Q);
xA7 = resample(xA7,P,Q);
xGsos7 = resample(xGsos7,P,Q);
xG7 = resample(xG7,P,Q);
xFsos7 = resample(xFsos7,P,Q);
xF7 = resample(xF7,P,Q);
xDsos7 = resample(xDsos7,P,Q);
xCsos7 = resample(xCsos7,P,Q);

fs = fs/2;

end

% 2. compute STFT
% paramSTFT.blockSize = 4096;
% paramSTFT.hopSize = 2048;
% paramSTFT.winFunc = hann(paramSTFT.blockSize);
% paramSTFT.reconstMirror = true;
% paramSTFT.appendFrame = true;
% 
% % get dimensions and time and freq resolutions
% 
% 
% deltaT = paramSTFT.hopSize / fs;
% deltaF = fs / paramSTFT.blockSize;

% STFT computation
% [XE2, AE2, PE2] = forwardSTFT(xE2, paramSTFT);
% [XG2, AG2, PG2] = forwardSTFT(xG2, paramSTFT);
% [XA2, AA2, PA2] = forwardSTFT(xA2, paramSTFT);
% [XC3, AC3, PC3] = forwardSTFT(xC3, paramSTFT);
% [XE3, AE3, PE3] = forwardSTFT(xE3, paramSTFT);
% [XG3, AG3, PG3] = forwardSTFT(xG3, paramSTFT);
% [XGsos3, AGsos3, PGsos3] = forwardSTFT(xGsos3, paramSTFT);
% [XA3, AA3, PA3] = forwardSTFT(xA3, paramSTFT);
% [XB3, AB3, PB3] = forwardSTFT(xB3, paramSTFT);
% [XC4, AC4, PC4] = forwardSTFT(xC4, paramSTFT);
% [XD4, AD4, PD4] = forwardSTFT(xD4, paramSTFT);
% [XE4, AE4, PE4] = forwardSTFT(xE4, paramSTFT);
% [XF4, AF4, PF4] = forwardSTFT(xF4, paramSTFT);
% [XG4, AG4, PG4] = forwardSTFT(xG4, paramSTFT);
% [XGos4, AGsos4, PGsos4] = forwardSTFT(xGsos4, paramSTFT);
% [XA4, AA4, PA4] = forwardSTFT(xA4, paramSTFT);
% [XB4, AB4, PB4] = forwardSTFT(xB4, paramSTFT);
% [XC5, AC5, PC5] = forwardSTFT(xC5, paramSTFT);
% [XD5, AD5, PD5] = forwardSTFT(xD5, paramSTFT);
% [XDsos5, ADsos5, PDsos5] = forwardSTFT(xDsos5, paramSTFT);
% [XE5, AE5, PE5] = forwardSTFT(xE5, paramSTFT);
% [XF5, AF5, PF5] = forwardSTFT(xF5, paramSTFT);
% [XE6, AE6, PE6] = forwardSTFT(xE6, paramSTFT);
% [XB2, AB2, PB2] = forwardSTFT(xB2, paramSTFT);
% [XD3, AD3, PD3] = forwardSTFT(xD3, paramSTFT);
% [XFsos3, AFsos3, PFsos3] = forwardSTFT(xFsos3, paramSTFT);
% [XCsos4, ACsos4, PCsos4] = forwardSTFT(xCsos4, paramSTFT);
% [XFsos4, AFsos4, PFsos4] = forwardSTFT(xFsos4, paramSTFT);
% [XCsos5, ACsos5, PCsos5] = forwardSTFT(xCsos5, paramSTFT);
% [XFsos5, AFsos5, PFsos56] = forwardSTFT(xFsos5, paramSTFT);
% [XG5, AG5, PG5] = forwardSTFT(xG5, paramSTFT);
% [XA5, AA5, PA5] = forwardSTFT(xA5, paramSTFT);
% [XB5, AB5, PB5] = forwardSTFT(xB5, paramSTFT);
% [XF3, AF3, PF3] = forwardSTFT(xF3, paramSTFT);
% [XEb4, AEb4, PEb4] = forwardSTFT(xEb4, paramSTFT);
% [XBb4, ABb4, PBb4] = forwardSTFT(xBb4, paramSTFT);
% [XBb3, ABb3, PBb3] = forwardSTFT(xBb3, paramSTFT);
% [XBb5, ABb5, PBb5] = forwardSTFT(xBb5, paramSTFT);
% [XC6, AC6, PC6] = forwardSTFT(xC6, paramSTFT);
% [XD2, AD2, PD2] = forwardSTFT(xD2, paramSTFT);
% [XDsos2, ADsos2, PDsos2] = forwardSTFT(xDsos2, paramSTFT);
% [XAsos2, AAsos2, PAsos2] = forwardSTFT(xAsos2, paramSTFT);
% [XD6, AD6, PD6] = forwardSTFT(xD6, paramSTFT);
% [XA6, AA6, PA6] = forwardSTFT(xA6, paramSTFT);
% [XC7, AC7, PC7] = forwardSTFT(xC7, paramSTFT);
% [XE7, AE7, PE7] = forwardSTFT(xBb4, paramSTFT);
% [XD7, AD7, PD7] = forwardSTFT(xBb4, paramSTFT);
% [XB6, AB6, PB6] = forwardSTFT(xB6, paramSTFT);
% [XBb6, ABb6, PBb6] = forwardSTFT(xBb6, paramSTFT);
% [XGsos6, AGsos6, PGsos6] = forwardSTFT(xGsos6, paramSTFT);
% [XG6, AG6, PG6] = forwardSTFT(xG6, paramSTFT);
% [XFsos6, AFsos6, PFsos6] = forwardSTFT(xFsos6, paramSTFT);
% [XF6, AF6, PF6] = forwardSTFT(xF6, paramSTFT);
% [XDsos6, ADsos6, PDsos6] = forwardSTFT(xDsos6, paramSTFT);
% [XCsos6, ACsos6, PCsos6] = forwardSTFT(xCsos6, paramSTFT);
% [XGsos5, AGsos5, PGsos5] = forwardSTFT(xGsos5, paramSTFT);
% [XF2, AF2, PF2] = forwardSTFT(xF2, paramSTFT);
% [XFsos2, AFsos2, Fsos2] = forwardSTFT(xFsos2, paramSTFT);
% [XDsos3, ADsos3, PDsos3] = forwardSTFT(xDsos3, paramSTFT);
% [XC2, AC2, PC2] = forwardSTFT(xC2, paramSTFT);
% [XA0, AA0, PA0] = forwardSTFT(xA0, paramSTFT);
% [XAsos0, AAsos0, PAsos0] = forwardSTFT(xAsos0, paramSTFT);
% [XB0, AB0, PB0] = forwardSTFT(xB0, paramSTFT);
% [XC1, AC1, PC1] = forwardSTFT(xC1, paramSTFT);
% [XCsos1, ACsos1, PCsos1] = forwardSTFT(xCsos1, paramSTFT);
% [XD1, AD1, PD1] = forwardSTFT(xD1, paramSTFT);
% [XDsos1, ADsos1, PDsos1] = forwardSTFT(xDsos1, paramSTFT);
% [XE1, AE1, PE1] = forwardSTFT(xE1, paramSTFT);
% [XF1, AF1, PF1] = forwardSTFT(xF1, paramSTFT);
% [XFsos1, AFsos1, PFsos1] = forwardSTFT(xFsos1, paramSTFT);
% [XG1, AG1, PG1] = forwardSTFT(xG1, paramSTFT);
% [XGsos1, AGsos1, PGsos1] = forwardSTFT(xGsos1, paramSTFT);
% [XA1, AA1, PA1] = forwardSTFT(xA1, paramSTFT);
% [XAsos1, AAsos1, PAsos1] = forwardSTFT(xAsos1, paramSTFT);
% [XB1, AB1, PB1] = forwardSTFT(xB1, paramSTFT);
% [XCsos2, ACsos2, PCsos2] = forwardSTFT(xCsos2, paramSTFT);
% [XGsos2, AGsos2, PGsos2] = forwardSTFT(xGsos2, paramSTFT);
% [XCsos3, ACsos3, PCsos3] = forwardSTFT(xCsos3, paramSTFT);
% [XAsos5, AAsos5, PAsos5] = forwardSTFT(xAsos5, paramSTFT);
% [XC8, AC8, PC8] = forwardSTFT(xC8, paramSTFT);
% [XB7, AB7, PB7] = forwardSTFT(xB7, paramSTFT);
% [XAsos7, AAsos7, PAsos7] = forwardSTFT(xAsos7, paramSTFT);
% [XA7, AA7, PA7] = forwardSTFT(xA7, paramSTFT);
% [XGsos7, AGsos7, PGsos7] = forwardSTFT(xGsos7, paramSTFT);
% [XG7, AG7, PG7] = forwardSTFT(xG7, paramSTFT);
% [XFsos7, AFsos7, PFsos7] = forwardSTFT(xFsos7, paramSTFT);
% [XF7, AF7, PF7] = forwardSTFT(xF7, paramSTFT);
% [XDsos7, ADsos7, PDsos7] = forwardSTFT(xDsos7, paramSTFT);
% [XCsos7, ACsos7, PCsos7] = forwardSTFT(xCsos7, paramSTFT);


%La respuesta resultante en frecuencia se calcula de la siguiente manera
% para 2048 puntos
% [tam segmento] = size(espectrograma)
% 
% puntos = 2*tam;
% 
% y = ERBFilterBank([1 zeros(1,puntos-1)], fcoefs);
% 
% resp = 20*log10(abs(fft(y')));

% [XG2, AG2, PG2] = forwardSTFT(xG2, paramSTFT);
% [XG3, AG3, PG3] = forwardSTFT(xG3, paramSTFT);
% [XG4, AG4, PG4] = forwardSTFT(xG4, paramSTFT);
% [XG5, AG5, PG5] = forwardSTFT(xG5, paramSTFT);
% [XG6, AG6, PG6] = forwardSTFT(xG6, paramSTFT);
% [XG7, AG7, PG7] = forwardSTFT(xG7, paramSTFT);

% fcoefs = MakeERBFilters_mod(fs,num_filtros,frec_minima); 

ERB_C2 = representacion_ERB(xG2,fs,num_filtros,frec_minima);
ERB_C3 = representacion_ERB(xG3,fs,num_filtros,frec_minima);
ERB_C4 = representacion_ERB(xG4,fs,num_filtros,frec_minima);
ERB_C5 = representacion_ERB(xG5,fs,num_filtros,frec_minima);
ERB_C6 = representacion_ERB(xG6,fs,num_filtros,frec_minima);
ERB_C7 = representacion_ERB(xG7,fs,num_filtros,frec_minima);

figure(1)
subplot(2,1,1)
imagesc(ERB_C2);
title('Cocleagrama ERB')
subplot(2,1,2)
imagesc(AC2);
title('STFT')
figure(2)
subplot(2,1,1)
imagesc(ERB_C3);
title('Cocleagrama ERB')
subplot(2,1,2)
imagesc(AC3);
title('STFT')
figure(3)
subplot(2,1,1)
imagesc(ERB_C4);
title('Cocleagrama ERB')
subplot(2,1,2)
imagesc(AC4);
title('STFT')
figure(4)
subplot(2,1,1)
imagesc(ERB_C5);
title('Cocleagrama ERB')
subplot(2,1,2)
imagesc(AC5);
title('STFT')
figure(5)
subplot(2,1,1)
imagesc(ERB_C6);
title('Cocleagrama ERB')
subplot(2,1,2)
imagesc(AC6);
title('STFT')
figure(6)
subplot(2,1,1)
imagesc(ERB_C7);
title('Cocleagrama ERB')
subplot(2,1,2)
imagesc(AC7);
title('STFT')



