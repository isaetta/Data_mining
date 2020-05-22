function fun_strainGauges(datiG,time)

try cd('useful_file');
catch mkdir('useful_file');
    cd('useful_file');
end

% valori profilo HEA220 dei pilastri
eCol = 210*10^9;        % modulo elastico [Pa]
iCol = 5.410*10^(-5);   % inerzia asse forte [m^4]
aCol = 6.434*10^(-3);	% area [m^2]
lCol = 0.21;            % altezza profilo tra assi delle ali [m]

% valori delle barre che tengono ancorata la platea
eBar = 210*10^9;        % modulo elastico barra[Pa] 
iBar = 3.217*10^(-9);   % inerzia [m^4]
aBar = 2.01*10^(-4);    % area [m^2]
lBar = 3.974;           % distanza tra due SG lungo l'asse x (direzione sisma) [m]

% calcolo profilo
for col = 99:2:105
    valueC(:,1) = detrend(datiG(:,col));                        % deformazione ala dx (ch) [-]
    valueC(:,2) = detrend(datiG(:,col+1));                      % deformazione ala sx (ch+1) [-]
    valueC(:,3) = time(:,1);                                    % tempo [s]
    valueC(:,4) = eCol*aCol*(valueC(:,1)+valueC(:,2))/2;        % sforzo assiale [N]
    valueC(:,5) = eCol*iCol*(valueC(:,1)+valueC(:,2))/lCol;     % momento [Nm]

    if col == 99
        fileUsefulName = ['Colonna NE.mat'];
    elseif col == 101
        fileUsefulName = ['Colonna NW.mat'];
    elseif col == 103
        fileUsefulName = ['Colonna SE.mat'];
    elseif col == 105
        fileUsefulName = ['Colonna SW.mat'];
    else
        disp(['Error!!']);
    end
    save(fileUsefulName, 'valueC', '-ASCII');
end

% calcolo barre
for col = 107:108
    valueB(:,1) = detrend(datiG(:,col));                        % deformazione barra N/S 7 [-]
    valueB(:,2) = detrend(datiG(:,col+2));                      % deformazione barra N/S 1 [-]
    valueB(:,3) = time(:,1);                                    % tempo [s]
    valueB(:,4) = eBar*aBar*valueB(:,1);                        % sforzo assiale barra uplift N/S 7 [N]
    valueB(:,5) = eBar*aBar*valueB(:,2);                        % sforzo assiale barra uplift N/S 1 [N]
    valueB(:,6) = eBar*iBar*(valueB(:,1)+valueB(:,2))/lBar;     % momento [Nm]

    if col == 107
        fileUsefulName = ['Barra uplift N7-N1.mat'];
    elseif col == 108
        fileUsefulName = ['Barra uplift S7-S1.mat'];
    else
        disp(['Error!!']);
    end
    save(fileUsefulName, 'valueB', '-ASCII');
end

end

% creo un file per ogni channel che ha come unità di misura "ohm"

%for col = 1:size(datiG,2)
%    if strcmp(transfFactors{col,3},'ohm')
%        value(:,1) = datiG(:,col); 
%        fileUsefulName = ['Useful data of Channel #',num2str(transfFactors{col,1}),'.mat'];
%        save(fileUsefulName, 'value', '-ASCII');
%    end
%end

%value(:,4) = eCol*aCol*(value(:,1)+value(:,2))/2;                            % sforzo assiale [N]
%value(:,5) = eCol*iCol*(value(:,1)+value(:,2))/lCol;                         % momento [Nm]
