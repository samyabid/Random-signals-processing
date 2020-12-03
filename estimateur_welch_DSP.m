function [Gamma_3] = estimateur_welch_DSP(x,nd,nf,N_fft,M,Noverlap)
x_e = x(nd:nf);
N = length(x_e);
[Gamma_3,f] = pwelch(x_e,hamming(M),Noverlap,N_fft,1,'twosided');
[Gth,Gbiais,fth] = sptheo(N,'simple');
Gamma_3 = Gamma_3(1:length(Gamma_3)/2);
f = f(1:length(f)/2);
plot(f,Gamma_3);
hold on;
plot(fth,Gth,'b');
plot(fth,Gbiais,'k');
ylim([-50 10]);
title('Etude : estimateur de Welch');
legend('Estimation','Theorique','Bias');
xlabel('Fréquence');
ylabel('dB');


end
