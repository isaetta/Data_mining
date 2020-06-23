function [vettoreTagliMax] = fun_taglioMax(spectrum)

%% Masse dei serbatoi [kg]
serbatoio = 3020;

%% Taglio al piano [kg*m/s2 = N]
for ii=1:length(spectrum)
    matriceTaglio(ii,1) = -(serbatoio*spectrum(ii,1));
end

%% VETTORE TAGLI MASSIMI
vettoreTagliMax(1) = max( abs( matriceTaglio(:,1) ) ); 
