function [Gamma_1] = estimateur_simple_DSP(x,nd,nf,N_fft)
x_e = x(nd:nf);
X_f = fft(x_e,N_fft); 
N_f = length(X_f);
X_f = X_f(1:N_f/2);
Ds_X_f = abs(X_f).^2;
f = 0 : 1/N_fft : (1 - 1/N_fft)/2;
Gamma_1 = Ds_X_f./N;
semilogy(f,X_f)
title('Etude : estimateur simple');
xlabel('Fréquence');
ylabel('Amplitude');
end