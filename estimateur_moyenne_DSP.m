function [Gamma_2] = estimateur_moyenne_DSP(x,nd,nf,N_fft,M)
x_e = x(nd:nf);
N = length(x_e);
[Gamma_2,f] = pwelch(x_e,rectwin(M),0,N_fft,1,'twosided');
[Gth,Gbiais,fth] = sptheo(N,'moyenne');
Gamma_2 = Gamma_2(1:length(Gamma_2)/2);
f = f(1:length(f)/2);
plot(f,10*log10(Gamma_2),'r');
hold on;
plot(fth,Gth,'b');
plot(fth,Gbiais,'k');
ylim([-50 10]);
title('Etude : estimateur moyenné');
legend('Estimation','Theorique','Bias');
xlabel('Fréquence');
ylabel('dB');

end
