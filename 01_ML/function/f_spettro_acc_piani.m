% nameAccFile = '03_ACC_8_EC_T1_C_25%_compD_SI';
function [outFloorSpectra] = f_spettro_acc_piani(nameAccFile)
% FLOOR SPECTRAL ACCELERATION
% Input: seismic recording at floor level
% Output: max Sa of floor level
%% Global definitions
global dataFolder funFolder Fs 

% Load data recorded (without detrend)
cd(dataFolder)
load('instrumISO.mat'); % #nr sensor - #trans factor - #units - #range -#descr
legenda = instrumISO; clearvars instrumISO;
load('legenda_order.mat'); legenda_order = unnamed; clearvars unnamed;
load(strcat(nameAccFile,'.mat'));
acc_stories = datiG; clearvars datiG;
cd(funFolder)

% Select data of interest and assign label to recognize them
level_1.base.ch = [7,9,11,13,18]; 
level_1.top.ch = [15,20,22]; 

% Initialize
level_1.base.acc = zeros(size(acc_stories,1),numel(level_1.base.ch));
level_1.base.label = string(zeros(1,numel(level_1.base.ch)));
for nitem = 1:numel(level_1.base.ch)
rpos = find(legenda_order == level_1.base.ch(nitem));
index = legenda{rpos,1};
level_1.base.acc(:,nitem) = detrend(acc_stories(:,index));
level_1.base.label(1,nitem) = string(legenda{rpos,5});
end

level_1.base.meanAcc = mean(level_1.base.acc,2); %mean along rows

dt = 1/Fs;
t = [0:dt:(numel(level_1.base.meanAcc)-1)*dt]';
disp_in = 0; vel_in = 0; acc = level_1.base.meanAcc;


outFloorSpectra = f_acc_spectra(t,acc,disp_in,vel_in); 

end

