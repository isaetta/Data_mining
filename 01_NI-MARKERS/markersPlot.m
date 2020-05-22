clear all
close all
clc

% load test file .mat with 3D matrix
% 3D matrix "markers": TIME x N.of MARKERS x DIR. (XYZ)

% NOTA
% Non posso far partire fun_resultsFloor e fun_displAbs perchè le
% dimensioni della matrice3D dei markers non ha le stesse dimensioni per
% ogni fileMat. Siccome in quelle due funzioni il codice è impostato "in
% quel modo", non posso farle partire altrimenti avrei errori.

dataIndex = 'C:\Users\Samuele\Desktop\01_NI-MARKERS\';

cd(dataIndex);
ListOfMarkers = 'C:\Users\Samuele\Desktop\01_NI-MARKERS\markers.txt';
ListOfMarkers = importFileMarkers(ListOfMarkers, 2, inf);

%% .txt ANALYSIS
% Quì richiamo i file .txt che voglio analizzare
fileMat(1,1) = {'03_ACC_8_EC_T1_C_25%_compA'};
fileMat(2,1) = {'03_ACC_8_EC_T1_C_25%_compB'};
fileMat(3,1) = {'03_ACC_8_EC_T1_C_25%_compC'};
fileMat(4,1) = {'03_ACC_8_EC_T1_C_25%_compD'};
fileMat(5,1) = {'04_ACC_8_EC_T1_C_37%'};
fileMat(6,1) = {'05_ACC_8_EC_T1_C_50%'};
fileMat(7,1) = {'06_ACC_8_EC_T1_C_37%_compA'};
fileMat(8,1) = {'06_ACC_8_EC_T1_C_37%_compB'};
fileMat(9,1) = {'06_ACC_8_EC_T1_C_37%_compC'};
fileMat(10,1) = {'07_ACC_8_EC_T1_C_70%'};
fileMat(11,1) = {'08_ACC_8_EC_T1_C_37%_compA'};
fileMat(12,1) = {'08_ACC_8_EC_T1_C_37%_compB'};
fileMat(13,1) = {'08_ACC_8_EC_T1_C_37%_compC'};
fileMat(14,1) = {'08_ACC_8_EC_T1_C_37%_compD'};
fileMat(15,1) = {'09_ACC_8_EC_T1_C_100%'};
fileMat(16,1) = {'10_ACC_8_EC_T1_C_111%'};

%% MATRIX
% Inizializzo la matrice a 0 e ne assegno la dimensione 
[numMarkers,markersName] = fun_createVector_listMarkers();
vMarkers(1,length(markersName)) = 0;

%% START ANALYSIS
for ii=1:length(fileMat)
    mkdir(string(fileMat(ii,1)));
    dataDir = string(strcat('C:\Users\Samuele\Desktop\01_NI-MARKERS\Results\',fileMat(ii,1)));

    fileName = string(strcat(fileMat(ii,1),'.mat'));
    load(fileName);
    
    markersNF = markers;
    [markers,desc] = fun_applfiltroCH2(2,1,[],30,videoSR,200,markersNF);

    %% CREATE TIME VECTOR
    time = zeros(length(markers(:,1,1)),1);
    for j=1:(length(time)-1)
       time(j+1) = (1/videoSR)*j; 
    end
    
    disp(['Results file: ',fileName]);

    %% RESULTS FLOORS and OTHER PLOTS FOR CHECKS
    % fun_resultsFloor(markers,time,fileName,coordsAtRest,dataIndex,dataDir);

    %% ABSOLUTE DISPLACEMENT
    % Quì ho problemi con le dimensioni dei markers che non è sempre 78
    % fun_displAbs(markers,time,dataIndex,dataDir)

    %% (ABSOLUTE DISPLACEMENT) non sono questi gli assoluti, non abilitare questa voce
    % fun_displAbsolute(markers,time,coordsAtRest,dataIndex,dataDir)

    %% DEFORMATION ANGLE
    % fun_angle(markers,coordsAtRest,time,dataIndex,dataDir)

    %% INTERSTOREY DRIFT - Absolute
    % fun_interstoreyDrift_abs(markers,coordsAtRest,time,dataIndex,dataDir)

    %% CREATE VECTOR
    % Riempio ogni riga della matrice vMarkers (ii) con i valori massimi di ogni markers
    [vectMarkers] = fun_createVector(markers,dataIndex);
    markersVector(ii,:) = vectMarkers;
    
    %% MARKERS
    % fun_markers(markers,time,ListOfMarkers,dataIndex,dataDir)
end
