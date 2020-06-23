clear all
close all
clc

%wipe
plotFlag = 1;       % =1 to plot all channels converted  (row 131)

dataIndex = 'C:\Users\Samuele\Desktop\01_NI_SPETTRO\';      % folder with function
cd(dataIndex);

load('acc_25_compD');

%% UPLOAD DATI
% Questi sono i valori che ricavo dal file excel dal SAP, al quale ho dato in input i valori del file acc
spettri_mat(1,1) = {'03_ACC_8_EC_T1_C_25%_compD_SI_spettro_M16.txt'};
spettri_mat(1,2) = {'03_ACC_8_EC_T1_C_25%_compD_SI_spettro_M42.txt'};
spettri_mat(1,3) = {'03_ACC_8_EC_T1_C_25%_compD_SI_spettro_M61.txt'};
spettri_mat(1,4) = {'03_ACC_8_EC_T1_C_25%_compD_SI_spettro_M26.txt'};
spettri_mat(1,5) = {'03_ACC_8_EC_T1_C_25%_compD_SI_spettro_M47.txt'};
spettri_mat(1,6) = {'03_ACC_8_EC_T1_C_25%_compD_SI_spettro_M66.txt'};

%% ANALISI del file FloorSpectra
vettore=[16 42 61  26  47  66];

dt=acc_25_compD(2,1)-acc_25_compD(1,1);
cont=1;

for i=vettore
    spectra=fun_spettro_v2(acc_25_compD(:,i),spectra,dt,4,0,110) ;
    recorded_spectra.T(cont)=spectra(:,1);
    recorded_spectra.Sd(cont)=spectra(:,2);
    recorded_spectra.Sv(cont)=spectra(:,3);
    recorded_spectra.Sa(cont)=spectra(:,4);
    cont=cont+1;
end

for riga=1:length(floor_spettri_mat)
    floor_spettri = string(floor_spettri_mat(riga,1));
    floor_spettri = importFileSpectrum(floor_spettri, 1, inf);

    for ii=1:length(floor_spettri)
        floor_spectra(ii,1) = floor_spettri{ii,1};
    end

    % PLOT SPETTRO
    [valueFloorSpectra] = fun_spettro_v2_floor(floor_spectra,0.039,4,1,110) ;
end

%% ANALISI dei file SAP
for colonna=1:2
    for riga=1:length(spettri_mat)
        spettri = string(spettri_mat(riga,colonna));
        spettri = importFileSpectrum(spettri, 1, inf);

        for ii=1:length(spettri)
            spectra(ii,1) = spettri{ii,1};
        end

        % PLOT SPETTRO
        fun_spettro_v2(valueFloorSpectra,spectra,0.039,4,1,110) ;

        % MAX TAGLIO
        [tagliMassimi] = fun_taglioMax(spectra);
        matriceTagliTank(riga,colonna) = tagliMassimi;
    end
end

%% SAVE FILE
% valoriTagliTank.Tank1.ACC_8_EC_T1_C_25_compD_SI_spettro_Tank1 = matriceTagliTank(1,1);
% valoriTagliTank.Tank2.ACC_8_EC_T1_C_25_compD_SI_spettro_Tank2 = matriceTagliTank(1,2);
% valoriTagliTank.Tank1.ACC_8_EC_T1_C_37_SI_spettro_Tank1 = matriceTagliTank(2,1);
% valoriTagliTank.Tank2.ACC_8_EC_T1_C_37_SI_spettro_Tank2 = matriceTagliTank(2,2);
% valoriTagliTank.Tank1.ACC_8_EC_T1_C_50_SI_spettro_Tank1 = matriceTagliTank(3,1);
% valoriTagliTank.Tank2.ACC_8_EC_T1_C_50_SI_spettro_Tank2 = matriceTagliTank(3,2);
% valoriTagliTank.Tank1.ACC_8_EC_T1_C_37_compC_SI_spettro_Tank1 = matriceTagliTank(4,1);
% valoriTagliTank.Tank2.ACC_8_EC_T1_C_37_compC_SI_spettro_Tank2 = matriceTagliTank(4,2);
% valoriTagliTank.Tank1.ACC_8_EC_T1_C_70_SI_spettro_Tank1 = matriceTagliTank(5,1);
% valoriTagliTank.Tank2.ACC_8_EC_T1_C_70_SI_spettro_Tank2 = matriceTagliTank(5,2);
% valoriTagliTank.Tank1.ACC_8_EC_T1_C_37_compD_SI_spettro_Tank1 = matriceTagliTank(6,1);
% valoriTagliTank.Tank2.ACC_8_EC_T1_C_37_compD_SI_spettro_Tank2 = matriceTagliTank(6,2);
% valoriTagliTank.Tank1.ACC_8_EC_T1_C_100_SI_spettro_Tank1 = matriceTagliTank(7,1);
% valoriTagliTank.Tank2.ACC_8_EC_T1_C_100_SI_spettro_Tank2 = matriceTagliTank(7,2);
% valoriTagliTank.Tank1.ACC_8_EC_T1_C_111_SI_spettro_Tank1 = matriceTagliTank(8,1);
% valoriTagliTank.Tank2.ACC_8_EC_T1_C_111_SI_spettro_Tank2 = matriceTagliTank(8,2);
% 
% save('varTagliTanks.mat','valoriTagliTank');
% save('matTagliTanks.mat','matriceTagliTank');      % matTagliMassimi = [Input.txt X Tank]

%% AGGIORNAMENTO
% Devo sistemare i plot perchè sono strani, me li stampa tutti uguali
