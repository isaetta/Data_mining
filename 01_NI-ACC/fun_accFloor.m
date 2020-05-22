function [vettoreTagliMax] = fun_accFloor(datiG)

% Calcolo le accelerazioni medie ai piani prendendo i 3 accelerometri per
% ogni piano e ne faccio la media. Faccio lo stesso per gli accelerometri
% sui due servatoi verticali

matriceAcc(length(datiG),6) = 0;

%% Masse totali dei piani e dei serbatoi
massa3 = 2653;
massa2 = 4527;
massa1 = 2666;
massa0 = 1439;
serbatoio = 3020;

%% Accelerazioni medie
matriceAcc(:,1) = mean([detrend(datiG(:,2)) detrend(datiG(:,4))],2);                            % soletta
matriceAcc(:,2) = mean([detrend(datiG(:,7)) detrend(datiG(:,9)) detrend(datiG(:,11))],2);       % piano 1
matriceAcc(:,3) = mean([detrend(datiG(:,23)) detrend(datiG(:,25)) detrend(datiG(:,27))],2);     % piano 2
matriceAcc(:,4) = mean([detrend(datiG(:,34)) detrend(datiG(:,55)) detrend(datiG(:,38))],2);     % piano 3
matriceAcc(:,5) = detrend(datiG(:,15));                                                         % serbatoio 1
matriceAcc(:,6) = detrend(datiG(:,20));                                                         % serbatoio 2

%% Taglio al piano kg*m/s2
matriceTaglio(:,1) = -(massa3*matriceAcc(:,4));                                                               % taglio dal piano 3 al 2
matriceTaglio(:,2) = -(massa2*matriceAcc(:,3));                                                               % taglio dal piano 2 al 1
matriceTaglio(:,3) = -(massa1*matriceAcc(:,2) + serbatoio*matriceAcc(:,5) + serbatoio*matriceAcc(:,6));       % taglio dal piano 1 al 0
matriceTaglio(:,4) = -(massa0*matriceAcc(:,1));                                                               % taglio soletta
matriceTaglio(:,5) = matriceTaglio(:,1) + matriceTaglio(:,2) + matriceTaglio(:,3) + matriceTaglio(:,4);       % taglio tot base
matriceTaglio(:,6) = -(serbatoio*matriceAcc(:,5));                                                            % serbatoio 1
matriceTaglio(:,7) = -(serbatoio*matriceAcc(:,6));                                                            % serbatoio 2

%% VETTORE TAGLI MASSIMI
vettoreTagliMax(1) = max( abs( matriceTaglio(:,1) ) );  % taglio piano 3
vettoreTagliMax(2) = max( abs( matriceTaglio(:,2) ) );  % taglio piano 2
vettoreTagliMax(3) = max( abs( matriceTaglio(:,3) ) );  % taglio piano 1
vettoreTagliMax(4) = max( abs( matriceTaglio(:,4) ) );  % taglio soletta
vettoreTagliMax(5) = max( abs( matriceTaglio(:,5) ) );  % taglio totale alla base
vettoreTagliMax(6) = max( abs( matriceTaglio(:,6) ) );  % taglio serbatoio 1
vettoreTagliMax(7) = max( abs( matriceTaglio(:,7) ) );  % taglio serbatoio 2

%% PLOT
% ConfigTest = 2; % NI case test 
% if ConfigTest ==2
%     mANG = 3.74;    % ton
% else
%     mANG = 0;    % ton
% end
% mediaRC = (datiG(:,2) + datiG(:,4)) ./2;
% mST = 42;   % ton
% mRC = 23;   % ton
% mPlates = 0.95; % ton
% F_RO = detrend(datiG(:,90));
% F_RC = (mRC+mPlates) * (detrend(mediaRC));
% F_ST = (mST+mANG) * detrend(datiG(:,1));
% Vbase_v1 = F_RO - F_ST - F_RC;
% VbaseLIM_1 = [max(Vbase_v1) min(Vbase_v1)];
% 
% figure
% plot(matriceTaglio(:,5)/1000)
% hold on
% plot(Vbase_v1)

