%% MAIN - DATA MINING
% Code for identifyng possible correlations inside acquired data

%% GLOBAL ENVIRONMENT
global g mainFolder dataFolder funFolder Fs
g = 9.816; 
Fs = 256; %[Hz]
% to change locally
mainFolder = 'D:\Dati\GoogleDrive_Uni_DD\GIT\Project_SPIF\Data_mining';
dataFolder = fullfile(mainFolder,'\00_Data\01_Seismic');
funFolder = fullfile(mainFolder,'\01_ML\function');
%% RUN of DATA
% a) SEISMIC
% b) RANDOM

%% FUNCTIONS
% Output = array [Nx1] that contains max value for each N-run of test 
% 
% i)    Spostamenti sommità serbatoio:
%       - verticali ;  - orizzontali
% ii)   Spostamenti ID sommità serbatoio - base serbatoio:
%       - verticali;   - orizzontali
% iii)  Taglio al piano
% iv)   Taglio base serbatoio (ridistribuzione forza taglio)
% v)    Spettro accelerazione al piano
% vi)   Spettro spostamento al piano
% vii)  PGA segnale
% viii) Sa(T1) - Sa(T2) - Sa(T3)
% ix)   Sd(T1) - Sd(T2) - Sd(T3)

%% SCATTER of DATA COLLECT

