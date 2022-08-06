clear all; clc; close all;
tap = audioread('tapestry.wav');
[ceps,freqresp,fb,fbrecon,freqrecon] = mfcc(tap,16000,100);
imagesc(ceps); 

