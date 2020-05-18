clear all
close all
clc

% load test file .mat with 3D matrix
% 3D matrix "markers": TIME x N.of MARKERS x DIR. (XYZ)

dataIndex = 'C:\Users\Samuele\Desktop\01_NI-MARKERS\';
dataDir = 'C:\Users\Samuele\Desktop\01_NI-MARKERS\25%_A';
fileName = ['03_ACC_8_EC_T1_C_25%_compA.mat'];

mkdir('25%_A');

load(fileName);

ListOfMarkers = 'C:\Users\Samuele\Desktop\01_NI-MARKERS\markers.txt';
ListOfMarkers = importFileMarkers(ListOfMarkers, 2, inf);
markersNF = markers;
[markers,desc]=fun_applfiltroCH2(2,1,[],30,videoSR,200,markersNF);

%% CREATE TIME VECTOR
time = zeros(length(markers(:,1,1)),1);
for j=1:(length(time)-1)
   time(j+1) = (1/videoSR)*j; 
end

%% RESULTS FLOORS and OTHER PLOTS FOR CHECKS
fun_resultsFloor(markers,time,fileName,coordsAtRest,dataIndex,dataDir);

%% ATTENTO !!!
% quello che hai fatto tu sono gli spostamenti assoluti. Per quanto
% riguarda i relativi devi fare la differenza tra il markers
% (all'interpiano per esempio) e quello sottostante o rispetto alla base
% markers 2, devi farli entrambi.

%% ABSOLUTE DISPLACEMENT
fun_displAbs(markers,time,dataIndex,dataDir)

%% (ABSOLUTE DISPLACEMENT) non sono questi gli assoluti, non abilitare questa voce
% fun_displAbsolute(markers,time,coordsAtRest,dataIndex,dataDir)

%% DEFORMATION ANGLE
fun_angle(markers,coordsAtRest,time,dataIndex,dataDir)

%% INTERSTOREY DRIFT - Absolute
fun_interstoreyDrift_abs(markers,coordsAtRest,time,dataIndex,dataDir)

%% MARKERS
fun_markers(markers,time,ListOfMarkers,dataIndex,dataDir)
