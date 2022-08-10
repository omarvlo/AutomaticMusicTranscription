
% References:
% [1] Patricio López-Serrano, Christian Dittmar, Jonathan Driedger, and
%     Meinard Müller.
%     Towards modeling and decomposing loop-based
%     electronic music.
%     In Proceedings of the International Conference
%     on Music Information Retrieval (ISMIR), pages 502–508,
%     New York City, USA, August 2016.
%0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% If you use the 'NMF toolbox' please refer to:
% [2] Patricio López-Serrano, Christian Dittmar, Yiğitcan Özer, and Meinard
%     Müller.
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

fs = 44100;

% Filtros Auditivos               
con_filtros = 1; %0: sin filtros auditivos 1: uso de filtros auditivos
num_filtros = 8; %elegir el n�mero de filtros en el banco en caso de que se usen

frec_minima = 20; %frecuencia m�nima audible por el ser humano
           
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
filenameC2 = 'C2.wav';
filenameCsos2 = 'C2#.wav';%
filenameD2 = 'D2.wav';
filenameDsos2 = 'D2#.wav';  
filenameE2 = 'E2.wav'; 
filenameF2 = 'F2.wav';
filenameFsos2 = 'F2#.wav';%
filenameG2 = 'G2.wav';
filenameGsos2 = 'G2#.wav';%
filenameA2 = 'A2.wav';
filenameAsos2 = 'A2#.wav'; 
filenameB2 = 'B2.wav';%
filenameC3 = 'C3.wav';
filenameCsos3 = 'C3#.wav';
filenameD3 = 'D3.wav';%
filenameDsos3 = 'D3#.wav';
filenameE3 = 'E3.wav';%
filenameF3 = 'F3.wav';%
filenameFsos3= 'F3#.wav';%
filenameG3= 'G3.wav';
filenameGsos3= 'G3#.wav';
filenameA3= 'A3.wav';
filenameAsos3 = 'A3#.wav';
filenameB3 = 'B3.wav';
filenameC4 = 'C4.wav';
filenameCsos4 = 'C4#.wav';
filenameD4 = 'D4.wav';
filenameDsos4 = 'D4#.wav';
filenameE4 = 'E4.wav'; 
filenameF4 = 'F4.wav';
filenameFsos4 = 'F4#.wav';%
filenameG4 = 'G4.wav';
filenameGsos4 = 'G4#.wav';
filenameA4 = 'A4.wav';
filenameAsos4 = 'A4#.wav';
filenameB4 = 'B4.wav';
filenameC5 = 'C5.wav';
filenameCsos5 = 'C5#.wav';%
filenameD5 = 'D5.wav';
filenameDsos5 = 'D5#.wav';
filenameE5 = 'E5.wav';
filenameF5 = 'F5.wav';
filenameFsos5 = 'F5#.wav';%
filenameG5 = 'G5.wav';%
filenameGsos5 = 'G5#.wav';
filenameA5 = 'A5.wav';%
filenameAsos5 = 'A5#.wav';%
filenameB5 = 'B5.wav';%
filenameC6 = 'C6.wav';
filenameCsos6 = 'C6#.wav';%
filenameD6 = 'D6.wav';
filenameDsos6 = 'D6#.wav';
filenameE6 = 'E6.wav';
filenameF6 = 'F6.wav';%
filenameFsos6 = 'F6#.wav';%
filenameG6 = 'G6.wav';%
filenameGsos6 = 'G6#.wav';
filenameA6 = 'A6.wav';
filenameAsos6 = 'A6#.wav';
filenameB6 = 'B6.wav';%
filenameC7 = 'C7.wav';
filenameCsos7 = 'C7#.wav';
filenameD7 = 'D7.wav'; 
filenameDsos7 = 'D7#.wav'; 
filenameE7 = 'E7.wav';
filenameF7 = 'F7.wav'; 
filenameFsos7 = 'F7#.wav'; 
filenameG7 = 'G7.wav'; 
filenameGsos7 = 'G7#.wav'; 
filenameA7 = 'A7.wav'; 
filenameAsos7 = 'A7#.wav'; 
filenameB7 = 'B7.wav'; 
filenameC8 = 'C8.wav'; 


% 1. load the audio signal

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
[xC2, fsC2] = audioread([inpPath filenameC2]);
[xCsos2, fsCsos2] = audioread([inpPath filenameCsos2]);
[xD2, fsD2] = audioread([inpPath filenameD2]);
[xDsos2, fsDsos2] = audioread([inpPath filenameDsos2]);
[xE2, fsE2] = audioread([inpPath filenameE2]);
[xF2, fsF2] = audioread([inpPath filenameF2]);
[xFsos2, fsFsos2] = audioread([inpPath filenameFsos2]);
[xG2, fsG2] = audioread([inpPath filenameG2]);
[xGsos2, fsGsos2] = audioread([inpPath filenameGsos2]);
[xA2, fsA2] = audioread([inpPath filenameA2]);
[xAsos2, fsAsos2] = audioread([inpPath filenameAsos2]);
[xB2, fsB2] = audioread([inpPath filenameB2]);
[xC3, fsC3] = audioread([inpPath filenameC3]);
[xCsos3, fsCsos3] = audioread([inpPath filenameCsos3]);
[xD3, fsD3] = audioread([inpPath filenameD3]);
[xDsos3, fsDsos3] = audioread([inpPath filenameDsos3]);
[xE3, fsE3] = audioread([inpPath filenameE3]);
[xF3, fsF3] = audioread([inpPath filenameF3]);
[xFsos3, fsFsos3] = audioread([inpPath filenameFsos3]);
[xG3, fsG3] = audioread([inpPath filenameG3]);
[xGsos3, fsGsos3] = audioread([inpPath filenameGsos3]);
[xA3, fsA3] = audioread([inpPath filenameA3]);
[xAsos3, fsAsos3] = audioread([inpPath filenameAsos3]);
[xB3, fsB3] = audioread([inpPath filenameB3]);
[xC4, fsC4] = audioread([inpPath filenameC4]);
[xCsos4, fsCsos4] = audioread([inpPath filenameCsos4]);
[xD4, fsD4] = audioread([inpPath filenameD4]);
[xDsos4, fsDsos4] = audioread([inpPath filenameDsos4]);
[xE4, fsE4] = audioread([inpPath filenameE4]);
[xF4, fsF4] = audioread([inpPath filenameF4]);
[xFsos4, fsFsos4] = audioread([inpPath filenameFsos4]);
[xG4, fsG4] = audioread([inpPath filenameG4]);
[xGsos4, fsGsos4] = audioread([inpPath filenameGsos4]);
[xA4, fsA4] = audioread([inpPath filenameA4]);
[xAsos4, fsAsos4] = audioread([inpPath filenameAsos4]);
[xB4, fsB4] = audioread([inpPath filenameB4]);
[xC5, fsC5] = audioread([inpPath filenameC5]);
[xCsos5, fsCsos5] = audioread([inpPath filenameCsos5]);
[xD5, fsD5] = audioread([inpPath filenameD5]);
[xDsos5, fsDsos5] = audioread([inpPath filenameDsos5]);
[xE5, fsE5] = audioread([inpPath filenameE5]);
[xF5, fsF5] = audioread([inpPath filenameF5]);
[xFsos5, fsFsos5] = audioread([inpPath filenameFsos5]);
[xG5, fsG5] = audioread([inpPath filenameG5]);
[xGsos5, fsGsos5] = audioread([inpPath filenameGsos5]);
[xA5, fsA5] = audioread([inpPath filenameA5]);
[xAsos5, fsAsos5] = audioread([inpPath filenameAsos5]);
[xB5, fsB5] = audioread([inpPath filenameB5]);
[xC6, fsC6] = audioread([inpPath filenameC6]);
[xCsos6, fsCsos6] = audioread([inpPath filenameCsos6]);
[xD6, fsD6] = audioread([inpPath filenameD6]);
[xDsos6, fsDsos6] = audioread([inpPath filenameDsos6]);
[xE6, fsE6] = audioread([inpPath filenameE6]);
[xF6, fsF6] = audioread([inpPath filenameF6]);
[xFsos6, fsFsos6] = audioread([inpPath filenameFsos6]);
[xG6, fsG6] = audioread([inpPath filenameG6]);
[xGsos6, fsGsos6] = audioread([inpPath filenameGsos6]);
[xA6, fsA6] = audioread([inpPath filenameA6]);
[xAsos6, fsAsos6] = audioread([inpPath filenameAsos6]);
[xB6, fsB6] = audioread([inpPath filenameB6]);
[xCsos7, fsCsos7] = audioread([inpPath filenameCsos7]);
[xC7, fsC7] = audioread([inpPath filenameC7]);
[xD7, fsD7] = audioread([inpPath filenameD7]);
[xDsos7, fsDsos7] = audioread([inpPath filenameDsos7]);
[xE7, fsE7] = audioread([inpPath filenameE7]);
[xF7, fsF7] = audioread([inpPath filenameF7]);
[xFsos7, fsFsos7] = audioread([inpPath filenameFsos7]);
[xG7, fsG7] = audioread([inpPath filenameG7]);
[xGsos7, fsGsos7] = audioread([inpPath filenameGsos7]);
[xA7, fsA7] = audioread([inpPath filenameA7]);
[xAsos7, fsAsos7] = audioread([inpPath filenameAsos7]);
[xB7, fsB7] = audioread([inpPath filenameB7]); 
[xC8, fsC8] = audioread([inpPath filenameC8]);

% make monaural if necessary
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
xC2 = mean(xC2, 2);
xCsos2 = mean(xCsos2, 2);
xD2 = mean(xD2, 2);
xDsos2 = mean(xDsos2, 2);
xF2 = mean(xF2, 2);
xFsos2 = mean(xFsos2, 2);
xE2 = mean(xE2, 2);
xG2 = mean(xG2, 2);
xGsos2 = mean(xGsos2, 2);
xA2 = mean(xA2, 2);
xAsos2 = mean(xAsos2, 2);
xB2 = mean(xB2, 2);
xC3 = mean(xC3, 2);
xCsos3 = mean(xCsos3, 2);
xD3 = mean(xD3, 2);
xDsos3 = mean(xDsos3, 2);
xE3 = mean(xE3, 2);
xF3 = mean(xF3, 2);
xFsos3 = mean(xFsos3, 2);
xG3 = mean(xG3, 2);
xGsos3 = mean(xGsos3, 2);
xA3 = mean(xA3, 2);
xAsos3 = mean(xAsos3, 2);
xB3 = mean(xB3, 2);
xC4 = mean(xC4, 2);
xCsos4 = mean(xCsos4, 2);
xD4 = mean(xD4, 2);
xDsos4 = mean(xDsos4, 2);
xE4 = mean(xE4, 2);
xF4 = mean(xF4, 2);
xFsos4 = mean(xFsos4, 2);
xG4 = mean(xG4, 2);
xGsos4 = mean(xGsos4, 2);
xA4 = mean(xA4, 2);
xAsos4 = mean(xAsos4, 2);
xB4 = mean(xB4, 2);
xC5 = mean(xC5, 2);
xCsos5 = mean(xCsos5, 2);
xD5 = mean(xD5, 2);
xDsos5 = mean(xDsos5, 2);
xE5 = mean(xE5, 2);
xF5 = mean(xF5, 2);
xFsos5 = mean(xFsos5, 2);
xG5 = mean(xG5, 2);
xGsos5 = mean(xGsos5, 2);
xA5 = mean(xA5, 2);
xAsos5 = mean(xAsos5, 2);
xB5 = mean(xB5, 2);
xC6 = mean(xC6, 2);
xCsos6 = mean(xCsos6, 2);
xD6 = mean(xD6, 2);
xDsos6 = mean(xDsos6, 2);
xE6 = mean(xE6, 2);
xF6 = mean(xF6, 2);
xFsos6 = mean(xFsos6, 2);
xG6 = mean(xG6, 2);
xGsos6 = mean(xGsos6, 2);
xA6 = mean(xA6, 2);
xAsos6 = mean(xAsos6, 2);
xB6 = mean(xB6, 2);
xC7 = mean(xC7, 2);
xCsos7 = mean(xCsos7, 2);
xD7 = mean(xD7, 2);
xDsos7 = mean(xDsos7, 2);
xE7 = mean(xE7, 2);
xF7 = mean(xF7, 2);
xFsos7 = mean(xFsos7, 2);
xG7 = mean(xG7, 2);
xGsos7 = mean(xGsos7, 2);
xA7 = mean(xA7, 2);
xAsos7 = mean(xAsos7, 2);
xB7 = mean(xB7, 2);
xC8 = mean(xC8, 2);


% 2. compute STFT
paramSTFT.blockSize = 4096;
paramSTFT.hopSize = 2048;
paramSTFT.winFunc = hann(paramSTFT.blockSize);
paramSTFT.reconstMirror = true;
paramSTFT.appendFrame = true;

% get dimensions and time and freq resolutions

deltaT = paramSTFT.hopSize / fs;
deltaF = fs / paramSTFT.blockSize;

% STFT computation

[XA0, AA0, PA0] = forwardFFT(xA0, paramSTFT);
[XAsos0, AAsos0, PAsos0] = forwardFFT(xAsos0, paramSTFT);
[XB0, AB0, PB0] = forwardFFT(xB0, paramSTFT);
[XC1, AC1, PC1] = forwardFFT(xC1, paramSTFT);
[XCsos1, ACsos1, PCsos1] = forwardFFT(xCsos1, paramSTFT);
[XD1, AD1, PD1] = forwardFFT(xD1, paramSTFT);
[XDsos1, ADsos1, PDsos1] = forwardFFT(xDsos1, paramSTFT);
[XE1, AE1, PE1] = forwardFFT(xE1, paramSTFT);
[XF1, AF1, PF1] = forwardFFT(xF1, paramSTFT);
[XFsos1, AFsos1, PFsos1] = forwardFFT(xFsos1, paramSTFT);
[XG1, AG1, PG1] = forwardFFT(xG1, paramSTFT);
[XGsos1, AGsos1, PGsos1] = forwardFFT(xGsos1, paramSTFT);
[XA1, AA1, PA1] = forwardFFT(xA1, paramSTFT);
[XAsos1, AAsos1, PAsos1] = forwardFFT(xAsos1, paramSTFT);
[XB1, AB1, PB1] = forwardFFT(xB1, paramSTFT);
[XC2, AC2, PC2] = forwardFFT(xC2, paramSTFT);
[XCsos2, ACsos2, PCsos2] = forwardFFT(xCsos2, paramSTFT);
[XD2, AD2, PD2] = forwardFFT(xD2, paramSTFT);
[XDsos2, ADsos2, PDsos2] = forwardFFT(xDsos2, paramSTFT);
[XE2, AE2, PE2] = forwardFFT(xE2, paramSTFT);
[XF2, AF2, PF2] = forwardFFT(xF2, paramSTFT);
[XFsos2, AFsos2, Fsos2] = forwardFFT(xFsos2, paramSTFT);
[XG2, AG2, PG2] = forwardFFT(xG2, paramSTFT);
[XGsos2, AGsos2, PGsos2] = forwardFFT(xGsos2, paramSTFT);
[XA2, AA2, PA2] = forwardFFT(xA2, paramSTFT);
[XAsos2, AAsos2, PAsos2] = forwardFFT(xAsos2, paramSTFT);
[XB2, AB2, PB2] = forwardFFT(xB2, paramSTFT);
[XC3, AC3, PC3] = forwardFFT(xC3, paramSTFT);
[XCsos3, ACsos3, PCsos3] = forwardFFT(xCsos3, paramSTFT);
[XD3, AD3, PD3] = forwardFFT(xD3, paramSTFT);
[XDsos3, ADsos3, PDsos3] = forwardFFT(xDsos3, paramSTFT);
[XE3, AE3, PE3] = forwardFFT(xE3, paramSTFT);
[XF3, AF3, PF3] = forwardFFT(xF3, paramSTFT);
[XFsos3, AFsos3, PFsos3] = forwardFFT(xFsos3, paramSTFT);
[XG3, AG3, PG3] = forwardFFT(xG3, paramSTFT);
[XGsos3, AGsos3, PGsos3] = forwardFFT(xGsos3, paramSTFT);
[XA3, AA3, PA3] = forwardFFT(xA3, paramSTFT);
[XAsos3, AAsos3, PAsos3] = forwardFFT(xAsos3, paramSTFT);
[XB3, AB3, PB3] = forwardFFT(xB3, paramSTFT);
[XC4, AC4, PC4] = forwardFFT(xC4, paramSTFT);
[XCsos4, ACsos4, PCsos4] = forwardFFT(xCsos4, paramSTFT);
[XD4, AD4, PD4] = forwardFFT(xD4, paramSTFT);
[XDsos4, ADsos4, PDsos4] = forwardFFT(xDsos4, paramSTFT);
[XE4, AE4, PE4] = forwardFFT(xE4, paramSTFT);
[XF4, AF4, PF4] = forwardFFT(xF4, paramSTFT);
[XFsos4, AFsos4, PFsos4] = forwardFFT(xFsos4, paramSTFT);
[XG4, AG4, PG4] = forwardFFT(xG4, paramSTFT);
[XGos4, AGsos4, PGsos4] = forwardFFT(xGsos4, paramSTFT);
[XA4, AA4, PA4] = forwardFFT(xA4, paramSTFT);
[XAsos4, AAsos4, PAsos4] = forwardFFT(xAsos4, paramSTFT);
[XB4, AB4, PB4] = forwardFFT(xB4, paramSTFT);
[XC5, AC5, PC5] = forwardFFT(xC5, paramSTFT);
[XCsos5, ACsos5, PCsos5] = forwardFFT(xCsos5, paramSTFT);
[XD5, AD5, PD5] = forwardFFT(xD5, paramSTFT);
[XDsos5, ADsos5, PDsos5] = forwardFFT(xDsos5, paramSTFT);
[XE5, AE5, PE5] = forwardFFT(xE5, paramSTFT);
[XF5, AF5, PF5] = forwardFFT(xF5, paramSTFT);
[XFsos5, AFsos5, PFsos56] = forwardFFT(xFsos5, paramSTFT);
[XG5, AG5, PG5] = forwardFFT(xG5, paramSTFT);
[XGsos5, AGsos5, PGsos5] = forwardFFT(xGsos5, paramSTFT);
[XA5, AA5, PA5] = forwardFFT(xA5, paramSTFT);
[XAsos5, AAsos5, PAsos5] = forwardFFT(xAsos5, paramSTFT);
[XB5, AB5, PB5] = forwardFFT(xB5, paramSTFT);
[XC6, AC6, PC6] = forwardFFT(xC6, paramSTFT);
[XCsos6, ACsos6, PCsos6] = forwardFFT(xCsos6, paramSTFT);
[XD6, AD6, PD6] = forwardFFT(xD6, paramSTFT);
[XDsos6, ADsos6, PDsos6] = forwardFFT(xDsos6, paramSTFT);
[XE6, AE6, PE6] = forwardFFT(xE6, paramSTFT);
[XF6, AF6, PF6] = forwardFFT(xF6, paramSTFT);
[XFsos6, AFsos6, PFsos6] = forwardFFT(xFsos6, paramSTFT);
[XG6, AG6, PG6] = forwardFFT(xG6, paramSTFT);
[XGsos6, AGsos6, PGsos6] = forwardFFT(xGsos6, paramSTFT);
[XA6, AA6, PA6] = forwardFFT(xA6, paramSTFT);
[XAsos6, AAsos6, PAsos6] = forwardFFT(xAsos6, paramSTFT);
[XB6, AB6, PB6] = forwardFFT(xB6, paramSTFT);
[XC7, AC7, PC7] = forwardFFT(xC7, paramSTFT);
[XCsos7, ACsos7, PCsos7] = forwardFFT(xCsos7, paramSTFT);
[XD7, AD7, PD7] = forwardFFT(xD7, paramSTFT);
[XDsos7, ADsos7, PDsos7] = forwardFFT(xDsos7, paramSTFT);
[XE7, AE7, PE7] = forwardFFT(xE7, paramSTFT);
[XF7, AF7, PF7] = forwardFFT(xF7, paramSTFT);
[XFsos7, AFsos7, PFsos7] = forwardFFT(xFsos7, paramSTFT);
[XG7, AG7, PG7] = forwardFFT(xG7, paramSTFT);
[XGsos7, AGsos7, PGsos7] = forwardFFT(xGsos7, paramSTFT);
[XA7, AA7, PA7] = forwardFFT(xA7, paramSTFT);
[XAsos7, AAsos7, PAsos7] = forwardFFT(xAsos7, paramSTFT);
[XB7, AB7, PB7] = forwardFFT(xB7, paramSTFT);
[XC8, AC8, PC8] = forwardFFT(xC8, paramSTFT);

transcrip =0; %0: entrenar 1: transcribir)
modelo=1; % 1: Propuesta: 2: M. Slaney 3:Greenwood

if (con_filtros == 1)

[AA0 resp] = filtros_ERB(fs,num_filtros,frec_minima,AA0,transcrip,modelo);
[AAsos0 resp] = filtros_ERB(fs,num_filtros,frec_minima,AAsos0,transcrip,modelo);
[AB0 resp] = filtros_ERB(fs,num_filtros,frec_minima,AB0,transcrip,modelo);
[AC1 resp] = filtros_ERB(fs,num_filtros,frec_minima,AC1,transcrip,modelo);
[ACsos1 resp] = filtros_ERB(fs,num_filtros,frec_minima,ACsos1,transcrip,modelo);
[AD1 resp] = filtros_ERB(fs,num_filtros,frec_minima,AD1,transcrip,modelo);
[ADsos1 resp] = filtros_ERB(fs,num_filtros,frec_minima,ADsos1,transcrip,modelo);
[AE1 resp] = filtros_ERB(fs,num_filtros,frec_minima,AE1,transcrip,modelo);
[AF1 resp] = filtros_ERB(fs,num_filtros,frec_minima,AF1,transcrip,modelo);
[AFsos1 resp] = filtros_ERB(fs,num_filtros,frec_minima,AFsos1,transcrip,modelo);
[AG1 resp] = filtros_ERB(fs,num_filtros,frec_minima,AG1,transcrip,modelo);
[AGsos1 resp] = filtros_ERB(fs,num_filtros,frec_minima,AGsos1,transcrip,modelo);
[AA1 resp] = filtros_ERB(fs,num_filtros,frec_minima,AA1,transcrip,modelo);
[AAsos1 resp] = filtros_ERB(fs,num_filtros,frec_minima,AAsos1,transcrip,modelo);
[AB1 resp] = filtros_ERB(fs,num_filtros,frec_minima,AB1,transcrip,modelo);
[AC2 resp] = filtros_ERB(fs,num_filtros,frec_minima,AC2,transcrip,modelo);
[ACsos2 resp] = filtros_ERB(fs,num_filtros,frec_minima,ACsos2,transcrip,modelo);
[AD2, resp] = filtros_ERB(fs,num_filtros,frec_minima,AD2,transcrip,modelo);
[ADsos2 resp] = filtros_ERB(fs,num_filtros,frec_minima,ADsos2,transcrip,modelo);
[AE2 resp] = filtros_ERB(fs,num_filtros,frec_minima,AE2,transcrip,modelo);
[AF2 resp] = filtros_ERB(fs,num_filtros,frec_minima,AF2,transcrip,modelo);
[AFsos2 resp] = filtros_ERB(fs,num_filtros,frec_minima,AFsos2,transcrip,modelo);
[AG2 resp] = filtros_ERB(fs,num_filtros,frec_minima,AG2,transcrip,modelo);
[AGsos2 resp] = filtros_ERB(fs,num_filtros,frec_minima,AGsos2,transcrip,modelo);
[AA2 resp] = filtros_ERB(fs,num_filtros,frec_minima,AA2,transcrip,modelo);
[AAsos2 resp] = filtros_ERB(fs,num_filtros,frec_minima,AAsos2,transcrip,modelo);
[AB2 resp] = filtros_ERB(fs,num_filtros,frec_minima,AB2,transcrip,modelo);
[AC3 resp] = filtros_ERB(fs,num_filtros,frec_minima,AC3,transcrip,modelo);
[ACsos3 resp] = filtros_ERB(fs,num_filtros,frec_minima,ACsos3,transcrip,modelo);
[AD3 resp] = filtros_ERB(fs,num_filtros,frec_minima,AD3,transcrip,modelo);
[ADsos3 resp] = filtros_ERB(fs,num_filtros,frec_minima,ADsos3,transcrip,modelo);
[AE3 resp] = filtros_ERB(fs,num_filtros,frec_minima,AE3,transcrip,modelo);
[AF3 resp] = filtros_ERB(fs,num_filtros,frec_minima,AF3,transcrip,modelo);
[AFsos3 resp] = filtros_ERB(fs,num_filtros,frec_minima,AFsos3,transcrip,modelo);
[AG3 resp] = filtros_ERB(fs,num_filtros,frec_minima,AG3,transcrip,modelo);
[AGsos3 resp] = filtros_ERB(fs,num_filtros,frec_minima,AGsos3,transcrip,modelo);
[AA3 resp] = filtros_ERB(fs,num_filtros,frec_minima,AA3,transcrip,modelo);
[AAsos3 resp] = filtros_ERB(fs,num_filtros,frec_minima,AAsos3,transcrip,modelo);
[AB3 resp] = filtros_ERB(fs,num_filtros,frec_minima,AB3,transcrip,modelo);
[AC4 resp] = filtros_ERB(fs,num_filtros,frec_minima,AC4,transcrip,modelo);
[ACsos4 resp] = filtros_ERB(fs,num_filtros,frec_minima,ACsos4,transcrip,modelo);
[AD4 resp] = filtros_ERB(fs,num_filtros,frec_minima,AD4,transcrip,modelo);
[ADsos4 resp] = filtros_ERB(fs,num_filtros,frec_minima,ADsos4,transcrip,modelo);
[AE4 resp] = filtros_ERB(fs,num_filtros,frec_minima,AE4,transcrip,modelo);
[AF4 resp] = filtros_ERB(fs,num_filtros,frec_minima,AF4,transcrip,modelo);
[AFsos4 resp] = filtros_ERB(fs,num_filtros,frec_minima,AFsos4,transcrip,modelo);
[AG4 resp] = filtros_ERB(fs,num_filtros,frec_minima,AG4,transcrip,modelo);
[AGsos4 resp] = filtros_ERB(fs,num_filtros,frec_minima,AGsos4,transcrip,modelo);
[AA4 resp] = filtros_ERB(fs,num_filtros,frec_minima,AA4,transcrip,modelo);
[AAsos4 resp] = filtros_ERB(fs,num_filtros,frec_minima,AAsos4,transcrip,modelo);
[AB4 resp] = filtros_ERB(fs,num_filtros,frec_minima,AB4,transcrip,modelo);
[AC5 resp] = filtros_ERB(fs,num_filtros,frec_minima,AC5,transcrip,modelo);
[ACsos5 resp] = filtros_ERB(fs,num_filtros,frec_minima,ACsos5,transcrip,modelo);
[AD5 resp] = filtros_ERB(fs,num_filtros,frec_minima,AD5,transcrip,modelo);
[ADsos5 resp] = filtros_ERB(fs,num_filtros,frec_minima,ADsos5,transcrip,modelo);
[AE5 resp] = filtros_ERB(fs,num_filtros,frec_minima,AE5,transcrip,modelo);
[AF5 resp] = filtros_ERB(fs,num_filtros,frec_minima,AF5,transcrip,modelo);
[AFsos5 resp] = filtros_ERB(fs,num_filtros,frec_minima,AFsos5,transcrip,modelo);
[AG5 resp] = filtros_ERB(fs,num_filtros,frec_minima,AG5,transcrip,modelo);
[AGsos5 resp] = filtros_ERB(fs,num_filtros,frec_minima,AGsos5,transcrip,modelo);
[AA5 resp] = filtros_ERB(fs,num_filtros,frec_minima,AA5,transcrip,modelo);
[AAsos5 resp] = filtros_ERB(fs,num_filtros,frec_minima,AAsos5,transcrip,modelo);
[AB5 resp] = filtros_ERB(fs,num_filtros,frec_minima,AB5,transcrip,modelo);
[AC6 resp] = filtros_ERB(fs,num_filtros,frec_minima,AC6,transcrip,modelo);
[ACsos6 resp] = filtros_ERB(fs,num_filtros,frec_minima,ACsos6,transcrip,modelo);
[AD6 resp] = filtros_ERB(fs,num_filtros,frec_minima,AD6,transcrip,modelo);
[ADsos6 resp] = filtros_ERB(fs,num_filtros,frec_minima,ADsos6,transcrip,modelo);
[AE6 resp] = filtros_ERB(fs,num_filtros,frec_minima,AE6,transcrip,modelo);
[AF6 resp] = filtros_ERB(fs,num_filtros,frec_minima,AF6,transcrip,modelo);
[AFsos6 resp] = filtros_ERB(fs,num_filtros,frec_minima,AFsos6,transcrip,modelo);
[AG6 resp] = filtros_ERB(fs,num_filtros,frec_minima,AG6,transcrip,modelo);
[AGsos6 resp] = filtros_ERB(fs,num_filtros,frec_minima,AGsos6,transcrip,modelo);
[AA6 resp] = filtros_ERB(fs,num_filtros,frec_minima,AA6,transcrip,modelo);
[AAsos6 resp] = filtros_ERB(fs,num_filtros,frec_minima,AAsos6,transcrip,modelo);
[AB6 resp] = filtros_ERB(fs,num_filtros,frec_minima,AB6,transcrip,modelo);
[AC7 resp] = filtros_ERB(fs,num_filtros,frec_minima,AC7,transcrip,modelo);
[ACsos7 resp] = filtros_ERB(fs,num_filtros,frec_minima,ACsos7,transcrip,modelo);
[AD7 resp] = filtros_ERB(fs,num_filtros,frec_minima,AD7,transcrip,modelo);
[ADsos7 resp] = filtros_ERB(fs,num_filtros,frec_minima,ADsos7,transcrip,modelo);
[AE7 resp] = filtros_ERB(fs,num_filtros,frec_minima,AE7,transcrip,modelo);
[AF7 resp] = filtros_ERB(fs,num_filtros,frec_minima,AF7,transcrip,modelo);
[AFsos7 resp] = filtros_ERB(fs,num_filtros,frec_minima,AFsos7,transcrip,modelo);
[AG7 resp] = filtros_ERB(fs,num_filtros,frec_minima,AG7,transcrip,modelo);
[AGsos7 resp] = filtros_ERB(fs,num_filtros,frec_minima,AGsos7,transcrip,modelo);
[AA7 resp] = filtros_ERB(fs,num_filtros,frec_minima,AA7,transcrip,modelo);
[AAsos7 resp] = filtros_ERB(fs,num_filtros,frec_minima,AAsos7,transcrip,modelo);
[AB7 resp] = filtros_ERB(fs,num_filtros,frec_minima,AB7,transcrip,modelo);
[AC8 resp] = filtros_ERB(fs,num_filtros,frec_minima,AC8,transcrip,modelo);

if modelo == 1
    display('filtros Propuesta')
elseif modelo==2
    display('filtros Slaney')
elseif modelo==3
    display('filtros Greenwood')
end

end

if con_filtros == 1
    str = ['NMF usando banco de ', num2str(num_filtros), ' filtros'];
    disp(str)
else
    display('NMF sin filtros')
end

% 3. apply NMF variants to STFT magnitude
numComp = 88;
numIter = 60;

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
initW{30} = AD3;
initW{31} = ADsos3;
initW{32} = AE3;
initW{33} = AF3;
initW{34} = AFsos3;
initW{35} = AG3;
initW{36} = AGsos3;
initW{37} = AA3;
initW{38} = AAsos3;
initW{39} = AB3;
initW{40} = AC4;
initW{41} = ACsos4;
initW{42} = AD4;
initW{43} = ADsos4;
initW{44} = AE4;
initW{45} = AF4;
initW{46} = AFsos4;
initW{47} = AG4;
initW{48} = AGsos4;
initW{49} = AA4;
initW{50} = AAsos4;
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
initW{62} = AAsos5;
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
initW{74} = AAsos6;
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

%numTemplateFrames = numFramesE2;
[numBinsAC4, numFramesAC4] = size(AC4);
numTemplateFrames = numFramesAC4;

save('modelo_8fil_88n_20hz.mat','numComp','numIter','paramSTFT','deltaF','deltaT','initW','numTemplateFrames', 'num_filtros','frec_minima');

