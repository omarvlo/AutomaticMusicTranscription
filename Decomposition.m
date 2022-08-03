%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name: demoEDMDecompositionFourComp
% Date: May 2018
% Programmer: Patricio LÃ³pez-Serrano
%
% This demo illustrates decomposition of a loop-based electronic dance
% music track, following [1,2].
%
% The script proceeds as follows:
%
% 1. Load audio files for the complete, downmixed track, as well as for the
%    individual loops that the track contains.
% 2. Compute STFTs for all audio data.
% 3. Each loop becomes a fixed template ("page") in the tensor W.
%    The track spectrogram is the target to approximate, V.
%    We wish to learn the activation matrix H, which answers the question
%    "Where was each loop activated throughout the track?"
% 4. Visualize results.
%
% References:
% [1] Patricio LÃ³pez-Serrano, Christian Dittmar, Jonathan Driedger, and
%     Meinard MÃ¼ller.
%     Towards modeling and decomposing loop-based
%     electronic music.
%     In Proceedings of the International Conference
%     on Music Information Retrieval (ISMIR), pages 502â€“508,
%     New York City, USA, August 2016.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% If you use the 'NMF toolbox' please refer to:
% [2] Patricio LÃ³pez-Serrano, Christian Dittmar, YiÄŸitcan Ã–zer, and Meinard
%     MÃ¼ller.
%     NMF Toolbox: Music Processing Applications of Nonnegative Matrix
%     Factorization
%     In Proceedings of the International Conference on Digital Audio Effects
%     (DAFx), 2019.
%
% License:
% This file is part of 'NMF toolbox'.
% https://www.audiolabs-erlangen.de/resources/MIR/NMFtoolbox/
% 'NMF toolbox' is free software: you can redistribute it and/or modify it
% under the terms of the GNU General Public License as published by the
% the Free Software Foundation, either version 3 of the License, or (at
% your option) any later version.
%
% 'NMF toolbox' is distributed in the hope that it will be useful, but
% WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
% Public License for more details.
%
% You should have received a copy of the GNU General Public License along
% with 'NMF toolbox'. If not, see http://www.gnu.org/licenses/.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
                %0 Base de datos de Maestría
                
con_filtros = 0;

% Filtros ERBs
num_filtros = 12;
frec_minima = 60; %60 Hz para el C2
                
reduce = 2; %determina en cuanto se reduce la Fs
            %por ejemplo 2 sería una reducción de Fs/2

if base_MAPS == 1
filenameE3 = 'MAPS_ISOL_NO_F_S1_M51_ENSTDkCl.wav';
filenameF3 = 'MAPS_ISOL_NO_F_S1_M53_ENSTDkCl.wav';
filenameFsos3 = 'MAPS_ISOL_NO_F_S1_M54_ENSTDkCl.wav';
filenameG3= 'MAPS_ISOL_NO_F_S0_M55_ENSTDkCl.wav';
filenameGsos3= 'MAPS_ISOL_NO_F_S1_M56_ENSTDkCl.wav';
filenameA3= 'MAPS_ISOL_NO_F_S0_M57_ENSTDkCl.wav';
filenameB3 = 'MAPS_ISOL_NO_F_S0_M59_ENSTDkCl.wav';
filenameCsos4 = 'MAPS_ISOL_NO_F_S1_M61_ENSTDkCl.wav';
filenameD4 = 'MAPS_ISOL_NO_F_S0_M62_AkPnBsdf.wav';
filenameEb4 = 'MAPS_ISOL_NO_F_S1_M63_ENSTDkCl.wav';
filenameE4 = 'MAPS_ISOL_NO_F_S0_M64_AkPnCGdD.wav';
%filenameC4 = 'MAPS_ISOL_NO_F_S0_M60_ENSTDkCl.wav';
filenameBb4 = 'MAPS_ISOL_NO_F_S1_M70_ENSTDkCl.wav';
filenameB4 = 'MAPS_ISOL_NO_F_S1_M71_ENSTDkCl.wav';
filenameC5 = 'MAPS_ISOL_NO_F_S0_M72_ENSTDkCl.wav';
filenameG4 = 'MAPS_ISOL_NO_F_S0_M67_ENSTDkCl.wav';
filenameA4 = 'MAPS_ISOL_NO_F_S0_M69_AkPnBsdf.wav';
filenameD5 = 'MAPS_ISOL_NO_F_S0_M74_AkPnBsdf.wav';
filenameE5 = 'MAPS_ISOL_NO_F_S1_M76_ENSTDkCl.wav';
filenameF5 = 'MAPS_ISOL_NO_F_S0_M77_AkPnBsdf.wav';
else
filenameE2 = 'E2_1.wav'; 
filenameG2 = 'G2_1.wav';
filenameA2 = 'A2_1.wav';
filenameB2 = 'B2_1.wav';%
filenameC3 = 'C3_1.wav';
filenameD3 = 'D3_1.wav';%
filenameE3 = 'E3_1.wav';
filenameFsos3= 'F3#_1.wav';%
filenameG3= 'G3_1.wav';
filenameGsos3= 'G3#_1.wav';
filenameA3= 'A3_1.wav';
filenameB3 = 'B3_1.wav';
filenameC4 = 'C4_1.wav';
filenameCsos4 = 'C4#_1.wav';%
filenameD4 = 'D4_1.wav';
filenameE4 = 'E4_1.wav'; 
filenameF4 = 'F4_1.wav';
filenameFsos4 = 'F4#_1.wav';%
filenameG4 = 'G4_1.wav';
filenameGsos4 = 'G4#_1.wav';
filenameA4 = 'A4_1.wav';
filenameB4 = 'B4_1.wav';
filenameC5 = 'C5_1.wav';
filenameCsos5 = 'C5#_1.wav';%
filenameD5 = 'D5_1.wav';
filenameDsos5 = 'D5#_1.wav';
filenameE5 = 'E5_1.wav';
filenameF5 = 'F5_1.wav';
filenameFsos5 = 'F5#_1.wav';%
filenameG5 = 'G5_1.wav';%
filenameA5 = 'A5_1.wav';%
filenameB5 = 'B5_1.wav';%
filenameE6 = 'E6_1.wav';
filenameF3 = 'F3_1.wav';
filenameEb4 = 'D4#_1.wav';
filenameBb4 = 'A4#_1.wav';
filenameBb3 = 'A3#_1.wav';
filenameBb5 = 'A5#_1.wav';
filenameC6 = 'C6_1.wav';
filenameD2 = 'D2_1.wav';
filenameDsos2 = 'D2#_1.wav';
filenameAsos2 = 'A2#_1.wav';
filenameD6 = 'D6_1.wav';
filenameA6 = 'A6_1.wav';
filenameC7 = 'C7_1.wav';
filenameE7 = 'MAPS_ISOL_NO_F_S0_M100_ENSTDkCl.wav';
filenameD7 = 'MAPS_ISOL_NO_F_S1_M98_ENSTDkCl.wav'; 
filenameB6 = 'B6_1.wav';%
filenameBb6 = 'A6#_1.wav';
filenameGsos6 = 'G6#_1.wav';
filenameG6 = 'G6_1.wav';%
filenameFsos6 = 'F6#_1.wav';%
filenameF6 = 'F6_1.wav';%
filenameDsos6 = 'D6#_1.wav';
filenameCsos6 = 'C6#_1.wav';%
filenameGsos5 = 'G5#_1.wav';
filenameF2 = 'F2_1.wav';%
filenameFsos2 = 'F2#_1.wav';%
filenameDsos3 = 'D3#_1.wav';
filenameC2 = 'C2_1.wav';

filenameA0 = 'MAPS_ISOL_NO_F_S0_M21_ENSTDkCl.wav'; 
filenameAsos0 = 'MAPS_ISOL_NO_F_S0_M22_ENSTDkCl.wav'; 
filenameB0 = 'MAPS_ISOL_NO_F_S0_M23_ENSTDkCl.wav'; 
filenameC1 = 'MAPS_ISOL_NO_F_S0_M24_ENSTDkCl.wav'; 
filenameCsos1 = 'MAPS_ISOL_NO_F_S0_M25_ENSTDkCl.wav'; 
filenameD1 = 'MAPS_ISOL_NO_F_S0_M26_ENSTDkCl.wav'; 
filenameDsos1 = 'MAPS_ISOL_NO_F_S1_M27_ENSTDkCl.wav'; 
filenameE1 = 'MAPS_ISOL_NO_F_S1_M28_ENSTDkCl.wav'; 
filenameF1 = 'MAPS_ISOL_NO_F_S0_M29_ENSTDkCl.wav'; 
filenameFsos1 = 'MAPS_ISOL_NO_F_S1_M30_ENSTDkCl.wav'; 
filenameG1 = 'MAPS_ISOL_NO_F_S1_M31_ENSTDkCl.wav'; 
filenameGsos1 = 'MAPS_ISOL_NO_F_S0_M32_ENSTDkCl.wav'; 
filenameA1 = 'MAPS_ISOL_NO_F_S0_M33_ENSTDkCl.wav'; 
filenameAsos1 = 'MAPS_ISOL_NO_F_S0_M34_ENSTDkCl.wav'; 
filenameB1 = 'MAPS_ISOL_NO_F_S0_M35_ENSTDkCl.wav'; 
filenameCsos2 = 'C2#_1.wav';%
filenameGsos2 = 'G2#_1.wav';%
filenameCsos3 = 'C3#_1.wav';%
filenameAsos5 = 'A5#_1.wav';%
filenameC8 = 'MAPS_ISOL_NO_F_S1_M108_ENSTDkCl.wav'; 
filenameB7 = 'MAPS_ISOL_NO_F_S1_M107_ENSTDkCl.wav'; 
filenameAsos7 = 'MAPS_ISOL_NO_F_S1_M106_ENSTDkCl.wav'; 
filenameA7 = 'MAPS_ISOL_NO_F_S1_M105_ENSTDkCl.wav'; 
filenameGsos7 = 'MAPS_ISOL_NO_F_S0_M104_ENSTDkCl.wav'; 
filenameG7 = 'MAPS_ISOL_NO_F_S0_M103_ENSTDkCl.wav'; 
filenameFsos7 = 'MAPS_ISOL_NO_F_S0_M102_ENSTDkCl.wav'; 
filenameF7 = 'MAPS_ISOL_NO_F_S0_M101_ENSTDkCl.wav'; 
filenameDsos7 = 'MAPS_ISOL_NO_F_S1_M99_ENSTDkCl.wav'; 
filenameCsos7 = 'MAPS_ISOL_NO_F_S1_M97_ENSTDkCl.wav'; 

end
% 1. load the audio signal

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
xA3 = mean(xA3, 2);
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

% 2. compute STFT
paramSTFT.blockSize = 4096;
paramSTFT.hopSize = 2048;
paramSTFT.winFunc = hann(paramSTFT.blockSize);
paramSTFT.reconstMirror = true;
paramSTFT.appendFrame = true;


% get dimensions and time and freq resolutions
fs = fs/2;


deltaT = paramSTFT.hopSize / fs;
deltaF = fs / paramSTFT.blockSize;

% STFT computation
[XE2, AE2, PE2] = forwardSTFT(xE2, paramSTFT);
[XG2, AG2, PG2] = forwardSTFT(xG2, paramSTFT);
[XA2, AA2, PA2] = forwardSTFT(xA2, paramSTFT);
[XC3, AC3, PC3] = forwardSTFT(xC3, paramSTFT);
[XE3, AE3, PE3] = forwardSTFT(xE3, paramSTFT);
[XG3, AG3, PG3] = forwardSTFT(xG3, paramSTFT);
[XGsos3, AGsos3, PGsos3] = forwardSTFT(xGsos3, paramSTFT);
[XA3, AA3, PA3] = forwardSTFT(xA3, paramSTFT);
[XB3, AB3, PB3] = forwardSTFT(xB3, paramSTFT);
[XC4, AC4, PC4] = forwardSTFT(xC4, paramSTFT);
[XD4, AD4, PD4] = forwardSTFT(xD4, paramSTFT);
[XE4, AE4, PE4] = forwardSTFT(xE4, paramSTFT);
[XF4, AF4, PF4] = forwardSTFT(xF4, paramSTFT);
[XG4, AG4, PG4] = forwardSTFT(xG4, paramSTFT);
[XGos4, AGsos4, PGsos4] = forwardSTFT(xGsos4, paramSTFT);
[XA4, AA4, PA4] = forwardSTFT(xA4, paramSTFT);
[XB4, AB4, PB4] = forwardSTFT(xB4, paramSTFT);
[XC5, AC5, PC5] = forwardSTFT(xC5, paramSTFT);
[XD5, AD5, PD5] = forwardSTFT(xD5, paramSTFT);
[XDsos5, ADsos5, PDsos5] = forwardSTFT(xDsos5, paramSTFT);
[XE5, AE5, PE5] = forwardSTFT(xE5, paramSTFT);
[XF5, AF5, PF5] = forwardSTFT(xF5, paramSTFT);
[XE6, AE6, PE6] = forwardSTFT(xE6, paramSTFT);


[XB2, AB2, PB2] = forwardSTFT(xB2, paramSTFT);
[XD3, AD3, PD3] = forwardSTFT(xD3, paramSTFT);
[XFsos3, AFsos3, PFsos3] = forwardSTFT(xFsos3, paramSTFT);
[XCsos4, ACsos4, PCsos4] = forwardSTFT(xCsos4, paramSTFT);
[XFsos4, AFsos4, PFsos4] = forwardSTFT(xFsos4, paramSTFT);
[XCsos5, ACsos5, PCsos5] = forwardSTFT(xCsos5, paramSTFT);
[XFsos5, AFsos5, PFsos56] = forwardSTFT(xFsos5, paramSTFT);
[XG5, AG5, PG5] = forwardSTFT(xG5, paramSTFT);
[XA5, AA5, PA5] = forwardSTFT(xA5, paramSTFT);
[XB5, AB5, PB5] = forwardSTFT(xB5, paramSTFT);

[XF3, AF3, PF3] = forwardSTFT(xF3, paramSTFT);
[XEb4, AEb4, PEb4] = forwardSTFT(xEb4, paramSTFT);
[XBb4, ABb4, PBb4] = forwardSTFT(xBb4, paramSTFT);

[XBb3, ABb3, PBb3] = forwardSTFT(xBb3, paramSTFT);
[XBb5, ABb5, PBb5] = forwardSTFT(xBb5, paramSTFT);
[XC6, AC6, PC6] = forwardSTFT(xC6, paramSTFT);
[XD2, AD2, PD2] = forwardSTFT(xD2, paramSTFT);
[XDsos2, ADsos2, PDsos2] = forwardSTFT(xDsos2, paramSTFT);
[XAsos2, AAsos2, PAsos2] = forwardSTFT(xAsos2, paramSTFT);
[XD6, AD6, PD6] = forwardSTFT(xD6, paramSTFT);
[XA6, AA6, PA6] = forwardSTFT(xA6, paramSTFT);
[XC7, AC7, PC7] = forwardSTFT(xC7, paramSTFT);
[XE7, AE7, PE7] = forwardSTFT(xBb4, paramSTFT);
[XD7, AD7, PD7] = forwardSTFT(xBb4, paramSTFT);
[XB6, AB6, PB6] = forwardSTFT(xB6, paramSTFT);
[XBb6, ABb6, PBb6] = forwardSTFT(xBb6, paramSTFT);
[XGsos6, AGsos6, PGsos6] = forwardSTFT(xGsos6, paramSTFT);
[XG6, AG6, PG6] = forwardSTFT(xG6, paramSTFT);
[XFsos6, AFsos6, PFsos6] = forwardSTFT(xFsos6, paramSTFT);
[XF6, AF6, PF6] = forwardSTFT(xF6, paramSTFT);
[XDsos6, ADsos6, PDsos6] = forwardSTFT(xDsos6, paramSTFT);
[XCsos6, ACsos6, PCsos6] = forwardSTFT(xCsos6, paramSTFT);
[XGsos5, AGsos5, PGsos5] = forwardSTFT(xGsos5, paramSTFT);
[XF2, AF2, PF2] = forwardSTFT(xF2, paramSTFT);
[XFsos2, AFsos2, Fsos2] = forwardSTFT(xFsos2, paramSTFT);
[XDsos3, ADsos3, PDsos3] = forwardSTFT(xDsos3, paramSTFT);
[XC2, AC2, PC2] = forwardSTFT(xC2, paramSTFT);

[XA0, AA0, PA0] = forwardSTFT(xA0, paramSTFT);
[XAsos0, AAsos0, PAsos0] = forwardSTFT(xAsos0, paramSTFT);
[XB0, AB0, PB0] = forwardSTFT(xB0, paramSTFT);
[XC1, AC1, PC1] = forwardSTFT(xC1, paramSTFT);
[XCsos1, ACsos1, PCsos1] = forwardSTFT(xCsos1, paramSTFT);
[XD1, AD1, PD1] = forwardSTFT(xD1, paramSTFT);
[XDsos1, ADsos1, PDsos1] = forwardSTFT(xDsos1, paramSTFT);
[XE1, AE1, PE1] = forwardSTFT(xE1, paramSTFT);
[XF1, AF1, PF1] = forwardSTFT(xF1, paramSTFT);
[XFsos1, AFsos1, PFsos1] = forwardSTFT(xFsos1, paramSTFT);
[XG1, AG1, PG1] = forwardSTFT(xG1, paramSTFT);
[XGsos1, AGsos1, PGsos1] = forwardSTFT(xGsos1, paramSTFT);
[XA1, AA1, PA1] = forwardSTFT(xA1, paramSTFT);
[XAsos1, AAsos1, PAsos1] = forwardSTFT(xAsos1, paramSTFT);
[XB1, AB1, PB1] = forwardSTFT(xB1, paramSTFT);
[XCsos2, ACsos2, PCsos2] = forwardSTFT(xCsos2, paramSTFT);
[XGsos2, AGsos2, PGsos2] = forwardSTFT(xGsos2, paramSTFT);
[XCsos3, ACsos3, PCsos3] = forwardSTFT(xCsos3, paramSTFT);
[XAsos5, AAsos5, PAsos5] = forwardSTFT(xAsos5, paramSTFT);
[XC8, AC8, PC8] = forwardSTFT(xC8, paramSTFT);
[XB7, AB7, PB7] = forwardSTFT(xB7, paramSTFT);
[XAsos7, AAsos7, PAsos7] = forwardSTFT(xAsos7, paramSTFT);
[XA7, AA7, PA7] = forwardSTFT(xA7, paramSTFT);
[XGsos7, AGsos7, PGsos7] = forwardSTFT(xGsos7, paramSTFT);
[XG7, AG7, PG7] = forwardSTFT(xG7, paramSTFT);
[XFsos7, AFsos7, PFsos7] = forwardSTFT(xFsos7, paramSTFT);
[XF7, AF7, PF7] = forwardSTFT(xF7, paramSTFT);
[XDsos7, ADsos7, PDsos7] = forwardSTFT(xDsos7, paramSTFT);
[XCsos7, ACsos7, PCsos7] = forwardSTFT(xCsos7, paramSTFT);

[numBinsE3, numFramesE3] = size(XE3);

%Adaptación

AA0 = AA0(:,1:8);
AA1 = AA1(:,1:8);
AA7 = AA7(:,1:8);
AAsos0 = AAsos0(:,1:8);
AAsos1 = AAsos1(:,1:8);
AAsos7 = AAsos7(:,1:8);
AB0 = AB0(:,1:8);
AB1 = AB1(:,1:8);
AB7 = AB7(:,1:8);
AC1 = AC1(:,1:8);
AC8 = AC8(:,1:8);
ACsos1 = ACsos1(:,1:8);
ACsos7 = ACsos7(:,1:8);
AD1 = AD1(:,1:8);
ADsos1 = ADsos1(:,1:8);
ADsos7 = ADsos7(:,1:8);
AE1 = AE1(:,1:8);
AF1 = AF1(:,1:8);
AF7 = AF7(:,1:8);
AFsos1 = AFsos1(:,1:8);
AFsos7 = AFsos7(:,1:8);
AG1 = AG1(:,1:8);
AG7 = AG7(:,1:8);
AGsos1 = AGsos1(:,1:8);
AGsos7 = AGsos7(:,1:8);



% [AE3_ERB resp] = filtros_ERB(fs,num_filtros,frec_minima,AE3,0,60);
% figure(1)
% subplot(2,1,1)
% plot(AE3)
% title('Espectro de la nota E3')
% xlabel('Frecuencia (Hz)');
% ylabel('|H(w)|');
% subplot(2,1,2)
% plot(AE3_ERB)
% title('Espectro de la nota E3 filtrado por los ERB')
% xlabel('Frecuencia (Hz)');
% ylabel('|H(w)|');
% 
% figure(2)
% plot(AE3)
% hold on
% plot(resp)
% title('Espectro de la nota E3 y el banco de filtros')
% xlabel('Frecuencia (Hz)');
% ylabel('|H(w)|');
% 
% figure(3)
% plot(resp)
% title('Banco de filtros ERB normalizado')
% xlabel('Frecuencia (Hz)');
% ylabel('|H(w)|');
% 
% figure(4)
% plot(AE3)
% title('Espectro de la nota E3')
% xlabel('Frecuencia (Hz)');
% ylabel('|H(w)|');

if (con_filtros == 1)
[AE2 resp] = filtros_ERB(fs,num_filtros,frec_minima,AE3,0,60);
[AG2 resp] = filtros_ERB(fs,num_filtros,frec_minima,AG2,0,60);
[AA2 resp] = filtros_ERB(fs,num_filtros,frec_minima,AA2,0,60);
[AC3 resp] = filtros_ERB(fs,num_filtros,frec_minima,AC3,0,60);
[AE3 resp] = filtros_ERB(fs,num_filtros,frec_minima,AE3,0,60);
[AG3 resp] = filtros_ERB(fs,num_filtros,frec_minima,AG3,0,60);
[AGsos3 resp] = filtros_ERB(fs,num_filtros,frec_minima,AGsos3,0,60);
[AA3 resp] = filtros_ERB(fs,num_filtros,frec_minima,AA3,0,60);
[AB3 resp] = filtros_ERB(fs,num_filtros,frec_minima,AB3,0,60);
[AC4 resp] = filtros_ERB(fs,num_filtros,frec_minima,AC4,0,60);
[AD4 resp] = filtros_ERB(fs,num_filtros,frec_minima,AD4,0,60);
[AE4 resp] = filtros_ERB(fs,num_filtros,frec_minima,AE4,0,60);
[AF4 resp] = filtros_ERB(fs,num_filtros,frec_minima,AF4,0,60);
[AG4 resp] = filtros_ERB(fs,num_filtros,frec_minima,AG4,0,60);
[AGsos4 resp] = filtros_ERB(fs,num_filtros,frec_minima,AGsos4,0,60);
[AA4 resp] = filtros_ERB(fs,num_filtros,frec_minima,AA4,0,60);
[AB4 resp] = filtros_ERB(fs,num_filtros,frec_minima,AB4,0,60);
[AC5 resp] = filtros_ERB(fs,num_filtros,frec_minima,AC5,0,60);
[AD5 resp] = filtros_ERB(fs,num_filtros,frec_minima,AD5,0,60);
[ADsos5 resp] = filtros_ERB(fs,num_filtros,frec_minima,ADsos5,0,60);
[AE5 resp] = filtros_ERB(fs,num_filtros,frec_minima,AE5,0,60);
[AF5 resp] = filtros_ERB(fs,num_filtros,frec_minima,AF5,0,60);
[AE6 resp] = filtros_ERB(fs,num_filtros,frec_minima,AE6,0,60);

[AB2 resp] = filtros_ERB(fs,num_filtros,frec_minima,AB2,0,60);
[AD3 resp] = filtros_ERB(fs,num_filtros,frec_minima,AD3,0,60);
[AFsos3 resp] = filtros_ERB(fs,num_filtros,frec_minima,AFsos3,0,60);
[ACsos4 resp] = filtros_ERB(fs,num_filtros,frec_minima,ACsos4,0,60);
[AFsos4 resp] = filtros_ERB(fs,num_filtros,frec_minima,AFsos4,0,60);
[ACsos5 resp] = filtros_ERB(fs,num_filtros,frec_minima,ACsos5,0,60);
[AFsos5 resp] = filtros_ERB(fs,num_filtros,frec_minima,AFsos5,0,60);
[AG5 resp] = filtros_ERB(fs,num_filtros,frec_minima,AG5,0,60);
[AA5 resp] = filtros_ERB(fs,num_filtros,frec_minima,AA5,0,60);
[AB5 resp] = filtros_ERB(fs,num_filtros,frec_minima,AB5,0,60);

[AF3 resp] = filtros_ERB(fs,num_filtros,frec_minima,AF3,0,60);
[AEb4 resp] = filtros_ERB(fs,num_filtros,frec_minima,AEb4,0,60);
[ABb4 resp] = filtros_ERB(fs,num_filtros,frec_minima,ABb4,0,60);

[ABb3 resp] = filtros_ERB(fs,num_filtros,frec_minima,ABb3,0,60);
[ABb5 resp] = filtros_ERB(fs,num_filtros,frec_minima,ABb5,0,60);
[AC6 resp] = filtros_ERB(fs,num_filtros,frec_minima,AC6,0,60);
[AD2 resp] = filtros_ERB(fs,num_filtros,frec_minima,AD2,0,60);
[ADsos2 resp] = filtros_ERB(fs,num_filtros,frec_minima,ADsos2,0,60);
[AAsos2 resp] = filtros_ERB(fs,num_filtros,frec_minima,AAsos2,0,60);
[AD6 resp] = filtros_ERB(fs,num_filtros,frec_minima,AD6,0,60);
[AA6 resp] = filtros_ERB(fs,num_filtros,frec_minima,AA6,0,60);
[AC7 resp] = filtros_ERB(fs,num_filtros,frec_minima,AC7,0,60);
[AE7 resp] = filtros_ERB(fs,num_filtros,frec_minima,AE7,0,60);
[AD7 resp] = filtros_ERB(fs,num_filtros,frec_minima,AD7,0,60);
[AB6 resp] = filtros_ERB(fs,num_filtros,frec_minima,AB6,0,60);
[ABb6 resp] = filtros_ERB(fs,num_filtros,frec_minima,ABb6,0,60);
[AGsos6 resp] = filtros_ERB(fs,num_filtros,frec_minima,AGsos6,0,60);
[AG6 resp] = filtros_ERB(fs,num_filtros,frec_minima,AG6,0,60);
[AFsos6 resp] = filtros_ERB(fs,num_filtros,frec_minima,AFsos6,0,60);
[AF6 resp] = filtros_ERB(fs,num_filtros,frec_minima,AF6,0,60);
[ADsos6 resp] = filtros_ERB(fs,num_filtros,frec_minima,ADsos6,0,60);
[ACsos6 resp] = filtros_ERB(fs,num_filtros,frec_minima,ACsos6,0,60);
[AGsos5 resp] = filtros_ERB(fs,num_filtros,frec_minima,AGsos5,0,60);
[AF2 resp] = filtros_ERB(fs,num_filtros,frec_minima,AF2,0,60);
[AFsos2 resp] = filtros_ERB(fs,num_filtros,frec_minima,AFsos2,0,60);
[ADsos3 resp] = filtros_ERB(fs,num_filtros,frec_minima,ADsos3,0,60);
[AC2 resp] = filtros_ERB(fs,num_filtros,frec_minima,AC2,0,60);

[AA0 resp] = filtros_ERB(fs,num_filtros,frec_minima,AA0,0,60);
[AAsos0 resp] = filtros_ERB(fs,num_filtros,frec_minima,AAsos0,0,60);
[AB0 resp] = filtros_ERB(fs,num_filtros,frec_minima,AB0,0,60);
[AC1 resp] = filtros_ERB(fs,num_filtros,frec_minima,AC1,0,60);
[ACsos1 resp] = filtros_ERB(fs,num_filtros,frec_minima,ACsos1,0,60);
[AD1 resp] = filtros_ERB(fs,num_filtros,frec_minima,AD1,0,60);
[ADsos1 resp] = filtros_ERB(fs,num_filtros,frec_minima,ADsos1,0,60);
[AE1 resp] = filtros_ERB(fs,num_filtros,frec_minima,AE1,0,60);
[AF1 resp] = filtros_ERB(fs,num_filtros,frec_minima,AF1,0,60);
[AFsos1 resp] = filtros_ERB(fs,num_filtros,frec_minima,AFsos1,0,60);
[AG1 resp] = filtros_ERB(fs,num_filtros,frec_minima,AG1,0,60);
[AGsos1 resp] = filtros_ERB(fs,num_filtros,frec_minima,AGsos1,0,60);
[AA1 resp] = filtros_ERB(fs,num_filtros,frec_minima,AA1,0,60);
[AAsos1 resp] = filtros_ERB(fs,num_filtros,frec_minima,AAsos1,0,60);
[AB1 resp] = filtros_ERB(fs,num_filtros,frec_minima,AB1,0,60);
[ACsos2 resp] = filtros_ERB(fs,num_filtros,frec_minima,ACsos2,0,60);
[AGsos2 resp] = filtros_ERB(fs,num_filtros,frec_minima,AGsos2,0,60);
[ACsos3 resp] = filtros_ERB(fs,num_filtros,frec_minima,ACsos3,0,60);
[AAsos5 resp] = filtros_ERB(fs,num_filtros,frec_minima,AAsos5,0,60);
[AC8 resp] = filtros_ERB(fs,num_filtros,frec_minima,AC8,0,60);
[AB7 resp] = filtros_ERB(fs,num_filtros,frec_minima,AB7,0,60);
[AAsos7 resp] = filtros_ERB(fs,num_filtros,frec_minima,AAsos7,0,60);
[AA7 resp] = filtros_ERB(fs,num_filtros,frec_minima,AA7,0,60);
[AGsos7 resp] = filtros_ERB(fs,num_filtros,frec_minima,AGsos7,0,60);
[AG7 resp] = filtros_ERB(fs,num_filtros,frec_minima,AG7,0,60);
[AFsos7 resp] = filtros_ERB(fs,num_filtros,frec_minima,AFsos7,0,60);
[AF7 resp] = filtros_ERB(fs,num_filtros,frec_minima,AF7,0,60);
[ADsos7 resp] = filtros_ERB(fs,num_filtros,frec_minima,ADsos7,0,60);
[ACsos7 resp] = filtros_ERB(fs,num_filtros,frec_minima,ACsos7,0,60);
end

%Adaptar el tamaño de cada matriz de los espectrogramas
if base_MAPS == 1
AB4 = AB4(:,1:45);
ABb4 = ABb4(:,1:45);
ACsos4 = ACsos4(:,1:45);
AD4 = AD4(:,1:45);
AE3 = AE3(:,1:45);
AE4 = AE4(:,1:45);
AEb4 = AEb4(:,1:45);
AF3 = AF3(:,1:45);
AFsos3 = AFsos3(:,1:45);
AGsos3 = AGsos3(:,1:45);
end

% AB3 = AB3(:,1:15);
% AB4 = AB4(:,1:15);
% ABb4 = ABb4(:,1:15);
% AC5 = AC5(:,1:15);
% ACsos4 = ACsos4(:,1:15);
% AD4 = AD4(:,1:15);
% AE4 = AE4(:,1:15);
% AEb4 = AEb4(:,1:15);
% AG3 = AG3(:,1:15);

% 3. apply NMF variants to STFT magnitude
numComp = 88;
numIter = 30;

initW = [];
initW{1} = AA0;
initW{2} = AAsos0;
initW{3} = AB0;
initW{4} = AC1;
initW{5} = ACsos1;
initW{6} = AD1;
initW{7} = ADsos1;
initW{8} = AE1;
initW{9} = AF1;
initW{10} = AFsos1;
initW{11} = AG1;
initW{12} = AGsos1;
initW{13} = AA1;
initW{14} = AAsos1;
initW{15} = AB1;
initW{16} = AC2;
initW{17} = ACsos2;
initW{18} = AD2;
initW{19} = ADsos2;
initW{20} = AE2;
initW{21} = AF2;
initW{22} = AFsos2;
initW{23} = AG2;
initW{24} = AGsos2;  
initW{25} = AA2;
initW{26} = AAsos2;
initW{27} = AB2;
initW{28} = AC3;
initW{29} = ACsos3;
initW{30} = ADsos3;
initW{31} = AD3;
initW{32} = AE3;
initW{33} = AF3;
initW{34} = AFsos3;
initW{35} = AG3;
initW{36} = AGsos3;
initW{37} = AA3;
initW{38} = ABb3;
initW{39} = AB3;
initW{40} = AC4;
initW{41} = ACsos4;
initW{42} = AD4;
initW{43} = AEb4;
initW{44} = AE4;
initW{45} = AF4;
initW{46} = AFsos4;
initW{47} = AG4;
initW{48} = AGsos4;
initW{49} = AA4;
initW{50} = ABb4;
initW{51} = AB4;
initW{52} = AC5;
initW{53} = ACsos5;
initW{54} = AD5;
initW{55} = ADsos5;
initW{56} = AE5;
initW{57} = AF5;
initW{58} = AFsos5;
initW{59} = AG5;
initW{60} = AGsos5;
initW{61} = AA5;
initW{62} = ABb5;
initW{63} = AB5;
initW{64} = AC6;
initW{65} = ACsos6;
initW{66} =  AD6;
initW{67} = ADsos6;
initW{68} = AE6;
initW{69} = AF6;
initW{70} = AFsos6;
initW{71} = AG6;
initW{72} = AGsos6;
initW{73} = AA6;
initW{74} = ABb6;
initW{75} = AB6;
initW{76} = AC7;
initW{77} = ACsos7;
initW{78} = AD7;
initW{79} = ADsos7;
initW{80} = AE7;
initW{81} = AF7;
initW{82} = AFsos7;
initW{83} = AG7;
initW{84} = AGsos7;
initW{85} = AA7;
initW{86} = AAsos7;
initW{87} = AB7;
initW{88} = AC8;


numTemplateFrames = numFramesE3;

save('sin_filtro.mat','numComp','numIter','paramSTFT','deltaF','deltaT','initW','P','Q','numTemplateFrames');

filename = 'martinillo.wav'; 
midiname = 'martinillo.mid';

[xTr,fs] = audioread([inpPath filename]);

xTr = mean(xTr, 2);

%[P,Q] = rat((fs/reduce)/fs); %se vuelven a samplear los archivos a la mitad de frecuencia

xTr = resample(xTr,P,Q);

% STFT computation
[XTr, ATr, PTr] = forwardSTFT(xTr, paramSTFT);

[numBinsTr, numFramesTr] = size(XTr);

% generate initial activations
paramActivations.numComp = numComp;
paramActivations.numFrames = numFramesTr;
initH = initActivations(paramActivations, 'uniform');
paramNMFD.initH = initH;

% NMFD parameters
paramNMFD.numComp = numComp;
paramNMFD.numFrames = numFramesTr;
paramNMFD.numIter = numIter;
paramNMFD.numTemplateFrames = numTemplateFrames;
paramNMFD.numBins = numBinsTr;
paramNMFD.fixW = 1;

% NMFD core method
[nmfdW, nmfdH, nmfdV, divKL] = NMFD(ATr, paramNMFD);


% %% visualize
% paramVis.deltaT = deltaT;
% paramVis.deltaF = deltaF;
% paramVis.logComp = 1e5;
% fh1 = visualizeComponentsNMF(ATr, nmfdW, nmfdH, nmfdV, paramVis);

% %% save result
% saveas(fh1,[outPath,'Prelude_No._4_in_E_Minor_Chopin.png']);

umbral = 0.00030;

[componente col] = size(nmfdH);

encendido=0;

inicio=0;
fin=0;
for i=1:1:componente

%     subplot(componente/2,1,i)
%     vector_activacion = nmfdH(i,:);
%     plot(vector_activacion)

cont1=1;
cont2=1;
    for j=1:1:col 
        if (encendido==1&&(nmfdH(i,j)<umbral))
            fin(i,cont1) = j*deltaT;
            encendido=0;
            cont1 = cont1+1;
        
        elseif((nmfdH(i,j)>umbral)&&(encendido==0))
            inicio(i,cont2) = j*deltaT;
            encendido=1;
            cont2 = cont2+1;
        else
            inicio(i,cont2) = 0;
            fin(i,cont1) = 0;
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

for i=1:1:length(frecuencias)
    
    tono = frecuencias(i);
    nota_midi(i,1) = selecciona_nota(tono);
end

resultados_inicios = [nota_midi inicio(:,1:end)];
resultados_finales = [nota_midi fin(:,1:end)];

xlswrite('transcripcion_inicios.xlsx',resultados_inicios)
xlswrite('transcripcion_finales.xlsx',resultados_finales)

% 
% tempo = 120;
% total_compases = 64;
% compas = 3; %3/4
tam_segmento = 0.010 % se analiza por ventanas de 10 ms de acuerdo con las metricas del MIREX
[originales_inicios originales_finales] = lector_midi(midiname);
originales = adapta_resolucion(originales_inicios, originales_finales, tam_segmento);
reconocidos = adapta_resolucion(resultados_inicios, resultados_finales, tam_segmento);
notas_porsegmento_original = notas_por_segmento_mod(tam_segmento,originales,originales);
notas_porsegmento = notas_por_segmento_mod(tam_segmento,reconocidos,originales);

[notas_porsegmento notas_porsegmento_original] = ajustar_arreglos(notas_porsegmento,notas_porsegmento_original);

mirex_metricas = calcula_precision_mirex(notas_porsegmento, notas_porsegmento_original);