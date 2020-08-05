clear all
close all
clc

%wipe
plotFlag = 1;       % =1 to plot all channels converted  (row 131)
g = 9.81;

dataIndex = 'C:\Users\Samuele\Desktop\01_NI_SPETTRO-accelerometri_marker\';      % folder with function
cd(dataIndex);

%% UPLOAD DATI
spettri_mar(1,1) = {'03_ACC_8_EC_T1_C_25%_compD_SI_spettro_M16.txt'};
spettri_mar(2,1) = {'03_ACC_8_EC_T1_C_25%_compD_SI_spettro_M42.txt'};
spettri_mar(3,1) = {'03_ACC_8_EC_T1_C_25%_compD_SI_spettro_M61.txt'};
spettri_mar(4,1) = {'03_ACC_8_EC_T1_C_25%_compD_SI_spettro_M26.txt'};
spettri_mar(5,1) = {'03_ACC_8_EC_T1_C_25%_compD_SI_spettro_M47.txt'};
spettri_mar(6,1) = {'03_ACC_8_EC_T1_C_25%_compD_SI_spettro_M66.txt'};
spettri_mar(1,2) = {'10_ACC_8_EC_T1_C_111%_SI_spettro_M16.txt'};
spettri_mar(2,2) = {'10_ACC_8_EC_T1_C_111%_SI_spettro_M42.txt'};
spettri_mar(3,2) = {'10_ACC_8_EC_T1_C_111%_SI_spettro_M61.txt'};
spettri_mar(4,2) = {'10_ACC_8_EC_T1_C_111%_SI_spettro_M26.txt'};
spettri_mar(5,2) = {'10_ACC_8_EC_T1_C_111%_SI_spettro_M47.txt'};
spettri_mar(6,2) = {'10_ACC_8_EC_T1_C_111%_SI_spettro_M66.txt'};
spettri_acc(1,1) = {'acc_25_compD_A7.txt'};
spettri_acc(2,1) = {'acc_25_compD_A16.txt'};
spettri_acc(3,1) = {'acc_25_compD_A22.txt'};
spettri_acc(4,1) = {'acc_25_compD_A5.txt'};
spettri_acc(5,1) = {'acc_25_compD_A14.txt'};
spettri_acc(6,1) = {'acc_25_compD_A20.txt'};
spettri_acc(1,2) = {'acc_111_A7.txt'};
spettri_acc(2,2) = {'acc_111_A16.txt'};
spettri_acc(3,2) = {'acc_111_A22.txt'};
spettri_acc(4,2) = {'acc_111_A5.txt'};
spettri_acc(5,2) = {'acc_111_A14.txt'};
spettri_acc(6,2) = {'acc_111_A20.txt'};

%% ANALISI del file delle accelrazioni
for colonna=1:2
    for riga=1:length(spettri_mar)
        acc_spettri = string(spettri_acc(riga,colonna));
        acc_spettri = importFileSpectrum(acc_spettri, 1, inf);

        for ii=1:length(acc_spettri)
            acc_spectra(ii,1) = g * acc_spettri{ii,1};
        end

        [value_accSpectra] = fun_spettro_v2_temporanea(acc_spectra,0.0039,4,0,110) ;

        mar_spettri = string(spettri_mar(riga,colonna));
        mar_spettri = importFileSpectrum(mar_spettri, 1, inf);

        for jj=1:length(mar_spettri)
            mar_spectra(jj,1) = mar_spettri{jj,1};
        end

        % PLOT SPETTRO
        fun_spettro_v2(value_accSpectra,mar_spectra,0.039,4,1,110) ;

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
