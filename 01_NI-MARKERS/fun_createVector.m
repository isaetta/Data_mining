function [vMarkers] = fun_createVector(markers,dataIndex)

%% RICHIAMO VETTORE DEI MARKERS
[numMarkers,~] = fun_createVector_listMarkers();

% cd(dataDir);
% try cd('Vector');
% catch mkdir('Vector');
%     cd('Vector');
% end

%% CREO IL VETTORE (prendo solo le direzioni lungo x)
% Riempio "la riga" della matrice con i valori massimi di ogni markers
for kk=1:length(numMarkers)
    vMarkers(kk) = max( abs( detrend( markers(:,str2num(string(numMarkers(kk))),1) ) ) );
end

% Calcolo la differenza tra i massimi degli spostamenti dei markers più significativi
vMarkers(kk+1) = max( abs( detrend( markers(:,39,1) ) - detrend( markers(:,30,1) ) ) );
vMarkers(kk+2) = max( abs( detrend( markers(:,36,1) ) - detrend( markers(:,31,1) ) ) );
vMarkers(kk+3) = max( abs( detrend( markers(:,50,1) ) - detrend( markers(:,43,1) ) ) );
vMarkers(kk+4) = max( abs( detrend( markers(:,51,1) ) - detrend( markers(:,44,1) ) ) );
vMarkers(kk+5) = max( abs( detrend( markers(:,53,1) ) - detrend( markers(:,45,1) ) ) );
vMarkers(kk+6) = max( abs( detrend( markers(:,54,1) ) - detrend( markers(:,47,1) ) ) );
vMarkers(kk+7) = max( abs( detrend( markers(:,29,1) ) - detrend( markers(:,7,1) ) ) );
vMarkers(kk+8) = max( abs( detrend( markers(:,66,1) ) - detrend( markers(:,47,1) ) ) );
vMarkers(kk+9) = max( abs( detrend( markers(:,47,1) ) - detrend( markers(:,26,1) ) ) );
vMarkers(kk+10) = max( abs( detrend( markers(:,26,1) ) - detrend( markers(:,2,1) ) ) );
vMarkers(kk+11) = max( abs( detrend( markers(:,66,1) ) - detrend( markers(:,2,1) ) ) );
vMarkers(kk+12) = max( abs( detrend( markers(:,61,1) ) - detrend( markers(:,42,1) ) ) );
vMarkers(kk+13) = max( abs( detrend( markers(:,42,1) ) - detrend( markers(:,16,1) ) ) );
vMarkers(kk+14) = max( abs( detrend( markers(:,16,1) ) - detrend( markers(:,2,1) ) ) );
vMarkers(kk+15) = max( abs( detrend( markers(:,61,1) ) - detrend( markers(:,2,1) ) ) );

cd(dataIndex);