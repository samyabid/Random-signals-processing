function [x1,x2,x3,a,b] = synthese_de_signaux_aleatoires(N,B,m3,sigma3,Fs)
F = (2*B)/Fs; %on définit la fréquence réduite
%stdbis2 = sqrt((2*B/Fs)); %sigma2 théorique après filtrage
x1 = randn(1,N);%x1 possede des valeurs suivant une loi normale centree reduite
[b,a] = butter(8,F);%definition du filtre
x2 = filter(b,a,x1);
x3 = ((x2-mean(x2))/std(x2))*(sigma3) + m3 ;%on centre et reduit x2 pour pouvoir appliquer la formule
end

