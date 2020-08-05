clear all
close all
clc

%wipe
plotFlag = 1;       % =1 to plot all channels converted  (row 131)
g = 9.81;

dataIndex = 'C:\Users\Samuele\Desktop\01_NI_SPETTRO\';      % folder with function
cd(dataIndex);

%% UPLOAD DATI
% Questi sono i valori che ricavo dal file excel dal SAP, al quale ho dato in input i valori del file acc
spettri_sap(1,1) = {'SAP_25%_compD_SI_spettro_M16.txt'};
% spettri_sap(2,1) = {'SAP_25%_compD_SI_spettro_M42.txt'};
% spettri_sap(3,1) = {'SAP_25%_compD_SI_spettro_M61.txt'};
% spettri_sap(4,1) = {'SAP_25%_compD_SI_spettro_M26.txt'};
% spettri_sap(5,1) = {'SAP_25%_compD_SI_spettro_M47.txt'};
% spettri_sap(6,1) = {'SAP_25%_compD_SI_spettro_M66.txt'};
% spettri_sap(7,1) = {'SAP_25%_compD_SI_spettro_T1.txt'};
% spettri_sap(8,1) = {'SAP_25%_compD_SI_spettro_T2.txt'};
% spettri_sap(1,2) = {'SAP_111%_SI_spettro_M16.txt'};
% spettri_sap(2,2) = {'SAP_111%_SI_spettro_M42.txt'};
% spettri_sap(3,2) = {'SAP_111%_SI_spettro_M61.txt'};
% spettri_sap(4,2) = {'SAP_111%_SI_spettro_M26.txt'};
% spettri_sap(5,2) = {'SAP_111%_SI_spettro_M47.txt'};
% spettri_sap(6,2) = {'SAP_111%_SI_spettro_M66.txt'};
% spettri_sap(7,2) = {'SAP_111%_SI_spettro_T1.txt'};
% spettri_sap(8,2) = {'SAP_111%_SI_spettro_T2.txt'};

% questi sono i valori dei Markers di Pavia, che poi andrò ad integrare per ottenere le accelerazioni
load("MarkerData.mat");
spettri_mar = detrend(MarkerData.X1(:,16));
% spettri_mar(2,1) = {'MARKER_25%_compD_SI_spettro_M42.txt'};
% spettri_mar(3,1) = {'MARKER_25%_compD_SI_spettro_M61.txt'};
% spettri_mar(4,1) = {'MARKER_25%_compD_SI_spettro_M26.txt'};
% spettri_mar(5,1) = {'MARKER_25%_compD_SI_spettro_M47.txt'};
% spettri_mar(6,1) = {'MARKER_25%_compD_SI_spettro_M66.txt'};
% spettri_mar(7,1) = {'MARKER_25%_compD_SI_spettro_T1.txt'};
% spettri_mar(8,1) = {'MARKER_25%_compD_SI_spettro_T2.txt'};
% spettri_mar(1,2) = {'MARKER_111%_SI_spettro_M16.txt'};
% spettri_mar(2,2) = {'MARKER_111%_SI_spettro_M42.txt'};
% spettri_mar(3,2) = {'MARKER_111%_SI_spettro_M61.txt'};
% spettri_mar(4,2) = {'MARKER_111%_SI_spettro_M26.txt'};
% spettri_mar(5,2) = {'MARKER_111%_SI_spettro_M47.txt'};
% spettri_mar(6,2) = {'MARKER_111%_SI_spettro_M66.txt'};
% spettri_mar(7,2) = {'MARKER_111%_SI_spettro_T1.txt'};
% spettri_mar(8,2) = {'MARKER_111%_SI_spettro_T2.txt'};

%% ANALISI del file delle accelrazioni
for colonna=1:1
    for riga=1:length(spettri_sap)
        % Derivo due volte i valori dei marker di Pavia
        [valori_derivati] = fun_derivata(spettri_mar);
        
        [valori_marSpectra] = fun_spettro_v2_temporanea(valori_derivati,0.005,4,0,110);

        sap_spettri = string(spettri_sap(riga,colonna));
        sap_spettri = importFileSpectrum(sap_spettri, 1, inf);

        for jj=1:length(sap_spettri)
            sap_spectra(jj,1) = sap_spettri{jj,1};
        end

        % PLOT SPETTRO
        fun_spettro_v2(valori_marSpectra,sap_spectra,0.039,4,1,110) ;

        % MAX TAGLIO
        % [tagliMassimi] = fun_taglioMax(spectra);
        % matriceTagliTank(riga,colonna) = tagliMassimi;
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
