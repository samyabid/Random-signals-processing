function [Ni, c, hi,delta_x] = calcul_histogramme(x,M)
N = length(x);
if  nargin == 2 %on teste si l'utilisateur a fourni deux arguments
    delta_x = (max(x) - min(x))/M;%M est donc fourni, on def delta_x
    [Ni,c] = hist(x,M);
    hi = Ni/(N*delta_x);% on normalise l'histogramme
    stem(c,hi);
    xlabel("Les classes")
    ylabel("Ni")
    title("Estimation de la densité de probabilité de x")
%     str_tmp=sprintf('dx = %f',delta_x); 
%     text(2,0.3,str_tmp);
%     texte1 = "Choix non optimal"
%     text(2,0.35,texte1);

elseif  nargin == 1 %M n'est pas défini
    delta_x = 3.49 * std(x)* N^(-1/3);%on utilise la formule optimisee de delta_x
    M = (max(x) - min(x)) / delta_x;
    [Ni,c] = hist (x,M);
    hi = Ni/(N*delta_x);
    stem(c,hi);
    xlabel("Les classes")
    ylabel("Ni")
    title("Estimation de la densité de probabilité de x")
%     str_tmp=sprintf('dx = %f',delta_x);
%     text(2,0.3,str_tmp);
%     texte1 = "Choix optimal"
%     text(2,0.35,texte1);


end
