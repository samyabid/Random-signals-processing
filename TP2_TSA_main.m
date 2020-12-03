clear variables;close all; clc;

x = genbrfil();
nd = 1;
nf = 4096;
N_fft = 2^13;%On prend N_fft > N pour eviter le repliement temporel 
M = 10;
Noverlap = M/3;
%estimateur_simple_DSP(x,nd,nf,N_fft);
estimateur_moyenne_DSP(x,nd,nf,N_fft,M);
%estimateur_welch_DSP(x,nd,nf,N_fft,M);
