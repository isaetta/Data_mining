function fun_interstoreyDrift_abs(markers,coordsAtRest,time,dataIndex,dataDir)

% NB: non sono sicuro di aver calcolato gli angoli correttamente, poichè
% non ho utilizzato il max()

cd(dataDir);
try cd('Displ_file');
catch mkdir('Displ_file');
    cd('Displ_file');
end
try cd('Interstorey_Drift');
catch mkdir('Interstorey_Drift');
    cd('Interstorey_Drift');
end

ncol = length(markers(1,:,1));
marker_detrended = zeros(size(markers));

for ii=1:ncol
    marker_detrended(1:end,ii,1)=detrend(markers(1:end,ii,1)); 
    marker_detrended(1:end,ii,2)=detrend(markers(1:end,ii,2)); 
end

disp(['-----------------------------------------------------------------------------------------------']);
disp([dataDir,' --> questi valori stampati vanno ricontrollati']);
disp(['-----------------------------------------------------------------------------------------------']);
disp(['Angoli massimi di ogni interpiano per le due direzioni X / Y']);
disp(['---']);

%% S-E floor 0
L_se_0 = abs(coordsAtRest(26,3) - coordsAtRest(2,3));

% direction x
angleRad_se_0_x = (marker_detrended(1:end,26,1)-marker_detrended(1:end,2,1)) / L_se_0;
angleGrad_se_0_x = angleRad_se_0_x * 180 / pi;
maxAngle(1,1) = max(angleRad_se_0_x);
maxAngle(2,1) = maxAngle(1,1) * 180 / pi;
disp(['Max angle S-E, floor 0, x: ',num2str(maxAngle(1,1)), ' [rad] ; ',num2str(maxAngle(2,1)),' [grad] -----> Displ: ',num2str(maxAngle(1,1) * L_se_0),' [mm]']);

% direction y
angleRad_se_0_y = (marker_detrended(1:end,26,2)-marker_detrended(1:end,2,2)) / L_se_0;
angleGrad_se_0_y = angleRad_se_0_y * 180 / pi;
maxAngle(1,1) = max(angleRad_se_0_y);
maxAngle(2,1) = maxAngle(1,1) * 180 / pi;
disp(['Max angle S-E, floor 0, y: ',num2str(maxAngle(1,1)), ' [rad] ; ',num2str(maxAngle(2,1)),' [grad] -----> Displ: ',num2str(maxAngle(1,1) * L_se_0),' [mm]']);

%% S-E floor 1
L_se_1 = abs(coordsAtRest(47,3) - coordsAtRest(26,3));

% direction x
angleRad_se_1_x = (marker_detrended(1:end,47,1)-marker_detrended(1:end,26,1)) / L_se_1;
angleGrad_se_1_x = angleRad_se_1_x * 180 / pi;
maxAngle(1,1) = max(angleRad_se_1_x);
maxAngle(2,1) = maxAngle(1,1) * 180 / pi;
disp(['Max angle S-E, floor 1, x: ',num2str(maxAngle(1,1)), ' [rad] ; ',num2str(maxAngle(2,1)),' [grad] -----> Displ: ',num2str(maxAngle(1,1) * L_se_1),' [mm]']);

% direction y
angleRad_se_1_y = (marker_detrended(1:end,47,2)-marker_detrended(1:end,26,2)) / L_se_1;
angleGrad_se_1_y = angleRad_se_1_y * 180 / pi;
maxAngle(1,1) = max(angleRad_se_1_y);
maxAngle(2,1) = maxAngle(1,1) * 180 / pi;
disp(['Max angle S-E, floor 1, y: ',num2str(maxAngle(1,1)), ' [rad] ; ',num2str(maxAngle(2,1)),' [grad] -----> Displ: ',num2str(maxAngle(1,1) * L_se_1),' [mm]']);

%% S-E floor 2
L_se_2 = abs(coordsAtRest(66,3) - coordsAtRest(47,3));

% direction x
angleRad_se_2_x = (marker_detrended(1:end,66,1)-marker_detrended(1:end,47,1)) / L_se_2;
angleGrad_se_2_x = angleRad_se_2_x * 180 / pi;
maxAngle(1,1) = max(angleRad_se_2_x);
maxAngle(2,1) = maxAngle(1,1) * 180 / pi;
disp(['Max angle S-E, floor 2, x: ',num2str(maxAngle(1,1)), ' [rad] ; ',num2str(maxAngle(2,1)),' [grad] -----> Displ: ',num2str(maxAngle(1,1) * L_se_2),' [mm]']);

% direction y
angleRad_se_2_y = (marker_detrended(1:end,66,2)-marker_detrended(1:end,47,2)) / L_se_2;
angleGrad_se_2_y = angleRad_se_2_y * 180 / pi;
maxAngle(1,1) = max(angleRad_se_2_y);
maxAngle(2,1) = maxAngle(1,1) * 180 / pi;
disp(['Max angle S-E, floor 2, y: ',num2str(maxAngle(1,1)), ' [rad] ; ',num2str(maxAngle(2,1)),' [grad] -----> Displ: ',num2str(maxAngle(1,1) * L_se_2),' [mm]']);

%% N-O floor 0
L_no_0 = abs(coordsAtRest(16,3) - coordsAtRest(2,3));

% direction x
angleRad_no_0_x = (marker_detrended(1:end,16,1)-marker_detrended(1:end,2,1)) / L_no_0;
angleGrad_no_0_x = angleRad_no_0_x * 180 / pi;
maxAngle(1,1) = max(angleRad_no_0_x);
maxAngle(2,1) = maxAngle(1,1) * 180 / pi;
disp(['Max angle N-O, floor 0, x: ',num2str(maxAngle(1,1)), ' [rad] ; ',num2str(maxAngle(2,1)),' [grad] -----> Displ: ',num2str(maxAngle(1,1) * L_no_0),' [mm]']);

% direction y
angleRad_no_0_y = (marker_detrended(1:end,16,2)-marker_detrended(1:end,2,2)) / L_no_0;
angleGrad_no_0_y = angleRad_no_0_y * 180 / pi;
maxAngle(1,1) = max(angleRad_no_0_y);
maxAngle(2,1) = maxAngle(1,1) * 180 / pi;
disp(['Max angle N-O, floor 0, y: ',num2str(maxAngle(1,1)), ' [rad] ; ',num2str(maxAngle(2,1)),' [grad] -----> Displ: ',num2str(maxAngle(1,1) * L_no_0),' [mm]']);

%% N-O floor 1
L_no_1 = abs(coordsAtRest(42,3) - coordsAtRest(16,3));

% direction x
angleRad_no_1_x = (marker_detrended(1:end,42,1)-marker_detrended(1:end,16,1)) / L_no_1;
angleGrad_no_1_x = angleRad_no_1_x * 180 / pi;
maxAngle(1,1) = max(angleRad_no_1_x);
maxAngle(2,1) = maxAngle(1,1) * 180 / pi;
disp(['Max angle N-O, floor 1, x: ',num2str(maxAngle(1,1)), ' [rad] ; ',num2str(maxAngle(2,1)),' [grad] -----> Displ: ',num2str(maxAngle(1,1) * L_no_1),' [mm]']);

% direction y
angleRad_no_1_y = (marker_detrended(1:end,42,2)-marker_detrended(1:end,16,2)) / L_no_1;
angleGrad_no_1_y = angleRad_no_1_y * 180 / pi;
maxAngle(1,1) = max(angleRad_no_1_y);
maxAngle(2,1) = maxAngle(1,1) * 180 / pi;
disp(['Max angle N-O, floor 1, y: ',num2str(maxAngle(1,1)), ' [rad] ; ',num2str(maxAngle(2,1)),' [grad] -----> Displ: ',num2str(maxAngle(1,1) * L_no_1),' [mm]']);

%% N-O floor 2
L_no_2 = abs(coordsAtRest(61,3) - coordsAtRest(42,3));

% direction x
angleRad_no_2_x = (marker_detrended(1:end,61,1)-marker_detrended(1:end,42,1)) / L_no_2;
angleGrad_no_2_x = angleRad_no_2_x * 180 / pi;
maxAngle(1,1) = max(angleRad_no_2_x);
maxAngle(2,1) = maxAngle(1,1) * 180 / pi;
disp(['Max angle N-O, floor 2, x: ',num2str(maxAngle(1,1)), ' [rad] ; ',num2str(maxAngle(2,1)),' [grad] -----> Displ: ',num2str(maxAngle(1,1) * L_no_2),' [mm]']);

% direction y
angleRad_no_2_y = (marker_detrended(1:end,61,2)-marker_detrended(1:end,42,2)) / L_no_2;
angleGrad_no_2_y = angleRad_no_2_y * 180 / pi;
maxAngle(1,1) = max(angleRad_no_2_y);
maxAngle(2,1) = maxAngle(1,1) * 180 / pi;
disp(['Max angle N-O, floor 2, y: ',num2str(maxAngle(1,1)), ' [rad] ; ',num2str(maxAngle(2,1)),' [grad] -----> Displ: ',num2str(maxAngle(1,1) * L_no_2),' [mm]']);

% disp(['-----------------------------------------------------------------------------------------------']);
% disp(['Angolo massimo tra la base e la sommità per le due direzioni X / Y']);
% disp(['---']);
%% S-E max displ
% L_se = abs(coordsAtRest(66,3) - coordsAtRest(2,3));
% 
% % direction x
% angleRad_se_x = (marker_detrended(1:end,66,1)-marker_detrended(1:end,2,1)) / L_se;
% angleGrad_se_x = angleRad_se_x * 180 / pi;
% maxAngle(1,1) = max(angleRad_se_x);
% maxAngle(2,1) = maxAngle(1,1) * 180 / pi;
% disp(['Max angle S-E, x: ',num2str(maxAngle(1,1)), ' [rad] ; ',num2str(maxAngle(2,1)),' [grad] -----> Displ: ',num2str(maxAngle(1,1) * L_se),' [mm]']);
% 
% % direction y
% angleRad_se_y = (marker_detrended(1:end,66,2)-marker_detrended(1:end,2,2)) / L_se;
% angleGrad_se_y = angleRad_se_y * 180 / pi;
% maxAngle(1,1) = max(angleRad_se_y);
% maxAngle(2,1) = maxAngle(1,1) * 180 / pi;
% disp(['Max angle S-E, y: ',num2str(maxAngle(1,1)), ' [rad] ; ',num2str(maxAngle(2,1)),' [grad] -----> Displ: ',num2str(maxAngle(1,1) * L_se),' [mm]']);

%% N-O max displ
% L_no = abs(coordsAtRest(61,3) - coordsAtRest(2,3));
% 
% % direction x
% angleRad_no_x = (marker_detrended(1:end,61,1)-marker_detrended(1:end,2,1)) / L_no;
% angleGrad_no_x = angleRad_no_x * 180 / pi;
% maxAngle(1,1) = max(angleRad_no_x);
% maxAngle(2,1) = maxAngle(1,1) * 180 / pi;
% disp(['Max angle N-O, x: ',num2str(maxAngle(1,1)), ' [rad] ; ',num2str(maxAngle(2,1)),' [grad] -----> Displ: ',num2str(maxAngle(1,1) * L_no),' [mm]']);
% 
% % direction x
% angleRad_no_y = (marker_detrended(1:end,61,2)-marker_detrended(1:end,2,2)) / L_no;
% angleGrad_no_y = angleRad_no_y * 180 / pi;
% maxAngle(1,1) = max(angleRad_no_y);
% maxAngle(2,1) = maxAngle(1,1) * 180 / pi;
% disp(['Max angle N-O, y: ',num2str(maxAngle(1,1)), ' [rad] ; ',num2str(maxAngle(2,1)),' [grad] -----> Displ: ',num2str(maxAngle(1,1) * L_no),' [mm]']);

%% Plot time-angles
% figTemp = figure();
% dim = get(figTemp, 'Position');
% set(figTemp,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
% 
% subplot(1,1,1),hold on, grid on
% plot(time,angleGrad_se_0_x); % <------------ modifica qui
% title(['Max deformation angles'])
% ylabel('Angle [°]')
% xlabel('Time [s]')
% 
% print(figTemp,strcat('Deformation angles - test.PNG'),'-dpng');
% savefig(strcat('Deformation angles -test.fig'));
% close(figTemp);

%% Plot displacement column S-E e N-O - ABSOLUTE
% Stampo spostamento di ogni interpiano in coordinate assolute
fig = figure();
dim = get(fig, 'Position');
set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % column S-E - X
    label_se_y = [0 L_se_0/1000 (L_se_0+L_se_1)/1000 (L_se_0+L_se_1+L_se_2)/1000];
    label_se_x = [max(abs(marker_detrended(:,2,1))) max(abs(marker_detrended(:,26,1))) max(abs(marker_detrended(:,47,1))) max(abs(marker_detrended(:,66,1)))];
    subplot(2,2,1),hold on, grid on
    plot(label_se_x,label_se_y,'-o');
    title(['Column S-E - Dir. X'])
    ylabel('Floor Height [m]')
    xlabel('Max Displ [mm]')
    
    % column S-E - Y
    label_se_x = [max(abs(marker_detrended(:,2,2))) max(abs(marker_detrended(:,26,2))) max(abs(marker_detrended(:,47,2))) max(abs(marker_detrended(:,66,2)))];
    subplot(2,2,2),hold on, grid on
    plot(label_se_x,label_se_y,'-o');
    title(['Column S-E - Dir. Y'])
    ylabel('Floor Height [m]')
    xlabel('Max Displ [mm]')
    
    % column N-O - X
    label_no_y = [0 L_no_0/1000 (L_no_0+L_no_1)/1000 (L_no_0+L_no_1+L_no_2)/1000];
    label_no_x = [max(abs(marker_detrended(:,2,1))) max(abs(marker_detrended(:,16,1))) max(abs(marker_detrended(:,42,1))) max(abs(marker_detrended(:,61,1)))];
    subplot(2,2,3),hold on, grid on
    plot(label_no_x,label_no_y,'-o');
    title(['Column N-O - Dir. X'])
    ylabel('Floor Height [m]')
    xlabel('Max Displ [mm]')
    
    % column N-O - Y
    label_no_x = [max(abs(marker_detrended(:,2,2))) max(abs(marker_detrended(:,16,2))) max(abs(marker_detrended(:,42,2))) max(abs(marker_detrended(:,61,2)))];
    subplot(2,2,4),hold on, grid on
    plot(label_no_x,label_no_y,'-o');
    title(['Column N-O - Dir. Y'])
    ylabel('Floor Height [m]')
    xlabel('Max Displ [mm]')
    
print(fig,strcat('Displacement Column Absolute.PNG'),'-dpng');
savefig(strcat('Displacement Column Absolute.fig'));
close(fig);

%% Plot displacement column S-E e N-O - RELATIVE
% Stampo spostamento di ogni interpiano in coordinate relative
fig = figure();
dim = get(fig, 'Position');
set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % column S-E - X
    label_se_y = [0 L_se_0/1000 (L_se_0+L_se_1)/1000 (L_se_0+L_se_1+L_se_2)/1000];
    label_se_x = [0 max(abs(marker_detrended(:,26,1)-marker_detrended(:,2,1))) max(abs(marker_detrended(:,47,1)-marker_detrended(:,26,1))) max(abs(marker_detrended(:,66,1)-marker_detrended(:,47,1)))];
    subplot(2,2,1),hold on, grid on
    plot(label_se_x,label_se_y,'-o');
    title(['Column S-E - Dir. X'])
    ylabel('Floor Height [m]')
    xlabel('Max Displ [mm]')
    
    % column S-E - Y
    label_se_x = [0 max(abs(marker_detrended(:,26,2)-marker_detrended(:,2,2))) max(abs(marker_detrended(:,47,2)-marker_detrended(:,26,2))) max(abs(marker_detrended(:,66,2)-marker_detrended(:,47,2)))];
    subplot(2,2,2),hold on, grid on
    plot(label_se_x,label_se_y,'-o');
    title(['Column S-E - Dir. Y'])
    ylabel('Floor Height [m]')
    xlabel('Max Displ [mm]')
    
    % column N-O - X
    label_no_y = [0 L_no_0/1000 (L_no_0+L_no_1)/1000 (L_no_0+L_no_1+L_no_2)/1000];
    label_no_x = [0 max(abs(marker_detrended(:,16,1)-marker_detrended(:,2,1))) max(abs(marker_detrended(:,42,1)-marker_detrended(:,16,1))) max(abs(marker_detrended(:,61,1)-marker_detrended(:,42,1)))];
    subplot(2,2,3),hold on, grid on
    plot(label_no_x,label_no_y,'-o');
    title(['Column N-O - Dir. X'])
    ylabel('Floor Height [m]')
    xlabel('Max Displ [mm]')
    
    % column N-O - Y
    label_no_x = [0 max(abs(marker_detrended(:,16,2)-marker_detrended(:,2,2))) max(abs(marker_detrended(:,42,2)-marker_detrended(:,16,2))) max(abs(marker_detrended(:,61,2)-marker_detrended(:,42,2)))];
    subplot(2,2,4),hold on, grid on
    plot(label_no_x,label_no_y,'-o');
    title(['Column N-O - Dir. Y'])
    ylabel('Floor Height [m]')
    xlabel('Max Displ [mm]')
    
print(fig,strcat('Displacement Column Relative.PNG'),'-dpng');
savefig(strcat('Displacement Column Relative.fig'));
close(fig);

%% Plot displacement column S-E e N-O - STRUCTURE RELATIVE
% Stampo spostamento di tutta la struttura in coordinate relative
fig = figure();
dim = get(fig, 'Position');
set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % column S-E - X
    label_se_y = [0 (L_se_0+L_se_1+L_se_2)/1000];
    label_se_x = [0 max(abs(marker_detrended(:,66,1)-marker_detrended(:,2,1)))];
    subplot(2,2,1),hold on, grid on
    plot(label_se_x,label_se_y,'-o');
    title(['Column S-E - Dir. X'])
    ylabel('Floor Height [m]')
    xlabel('Max Displ [mm]')
    
    % column S-E - Y
    label_se_x = [0 max(abs(marker_detrended(:,66,2)-marker_detrended(:,2,2)))];
    subplot(2,2,2),hold on, grid on
    plot(label_se_x,label_se_y,'-o');
    title(['Column S-E - Dir. Y'])
    ylabel('Floor Height [m]')
    xlabel('Max Displ [mm]')
    
    % column N-O - X
    label_no_y = [0 (L_no_0+L_no_1+L_no_2)/1000];
    label_no_x = [0 max(abs(marker_detrended(:,61,1)-marker_detrended(:,2,1)))];
    subplot(2,2,3),hold on, grid on
    plot(label_no_x,label_no_y,'-o');
    title(['Column N-O - Dir. X'])
    ylabel('Floor Height [m]')
    xlabel('Max Displ [mm]')
    
    % column N-O - Y
    label_no_x = [0 max(abs(marker_detrended(:,61,2)-marker_detrended(:,2,2)))];
    subplot(2,2,4),hold on, grid on
    plot(label_no_x,label_no_y,'-o');
    title(['Column N-O - Dir. Y'])
    ylabel('Floor Height [m]')
    xlabel('Max Displ [mm]')
    
print(fig,strcat('Displacement Structure Relative.PNG'),'-dpng');
savefig(strcat('Displacement Structure Relative.fig'));
close(fig);

%% Plot tanks - RELATIVE
% Stampo spostamento dei serbatoi in coordinate relative
fig = figure();
dim = get(fig, 'Position');
set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
% TANK 1
    % column S-E - X
    label_t1_y = [0 (abs(coordsAtRest(39,3) - coordsAtRest(19,3)))/1000];
    label_t1_x = [0 max(abs(marker_detrended(:,39,1)-marker_detrended(:,19,1)))];
    subplot(4,2,1),hold on, grid on
    plot(label_t1_x,label_t1_y,'-o');
    title(['Tank 1 - Dir. X'])
    ylabel('Height [m]')
    xlabel('Max Displ [mm]')
    
    % column S-E - Y
    label_t1_x = [0 max(abs(marker_detrended(:,39,2)-marker_detrended(:,19,2)))];
    subplot(4,2,2),hold on, grid on
    plot(label_t1_x,label_t1_y,'-o');
    title(['Tank 1 - Dir. Y'])
    ylabel('Height [m]')
    xlabel('Max Displ [mm]')

% TANK 2
    % column S-E - X
    label_t1_y = [0 (abs(coordsAtRest(36,3) - coordsAtRest(19,3)))/1000];
    label_t1_x = [0 max(abs(marker_detrended(:,36,1)-marker_detrended(:,19,1)))];
    subplot(4,2,3),hold on, grid on
    plot(label_t1_x,label_t1_y,'-o');
    title(['Tank 2 - Dir. X'])
    ylabel('Height [m]')
    xlabel('Max Displ [mm]')
    
    % column S-E - Y
    label_t1_x = [0 max(abs(marker_detrended(:,36,2)-marker_detrended(:,19,2)))];
    subplot(4,2,4),hold on, grid on
    plot(label_t1_x,label_t1_y,'-o');
    title(['Tank 2 - Dir. Y'])
    ylabel('Height [m]')
    xlabel('Max Displ [mm]')
    
% TANK 3
    % column S-E - X
    label_t1_y = [0 (abs(coordsAtRest(51,3) - coordsAtRest(44,3)))/1000];
    label_t1_x = [0 max(abs(marker_detrended(:,51,1)-marker_detrended(:,44,1)))];
    subplot(4,2,5),hold on, grid on
    plot(label_t1_x,label_t1_y,'-o');
    title(['Tank 3 - Dir. X'])
    ylabel('Height [m]')
    xlabel('Max Displ [mm]')
    
    % column S-E - Y
    label_t1_x = [0 max(abs(marker_detrended(:,51,2)-marker_detrended(:,44,2)))];
    subplot(4,2,6),hold on, grid on
    plot(label_t1_x,label_t1_y,'-o');
    title(['Tank 3 - Dir. Y'])
    ylabel('Height [m]')
    xlabel('Max Displ [mm]')
    
% TANK 4
    % column S-E - X
    label_t1_y = [0 (abs(coordsAtRest(54,3) - coordsAtRest(47,3)))/1000];
    label_t1_x = [0 max(abs(marker_detrended(:,54,1)-marker_detrended(:,47,1)))];
    subplot(4,2,7),hold on, grid on
    plot(label_t1_x,label_t1_y,'-o');
    title(['Tank 4 - Dir. X'])
    ylabel('Height [m]')
    xlabel('Max Displ [mm]')
    
    % column S-E - Y
    label_t1_x = [0 max(abs(marker_detrended(:,54,2)-marker_detrended(:,47,2)))];
    subplot(4,2,8),hold on, grid on
    plot(label_t1_x,label_t1_y,'-o');
    title(['Tank 4 - Dir. Y'])
    ylabel('Height [m]')
    xlabel('Max Displ [mm]')
    
print(fig,strcat('Displacement Tanks.PNG'),'-dpng');
savefig(strcat('Displacement Tanks.fig'));
close(fig);

cd(dataIndex);