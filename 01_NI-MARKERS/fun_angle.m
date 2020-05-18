function fun_angle(markers,coordsAtRest,time,dataIndex,dataDir)

% voglio calcolare l'angolo che la trave secondaria (dove è posizionato il
% markers M25) forma, a causa del sisma, con la trave primaria (dove è
% posizionato il markers M26) per vedere se la fessura su tale nodo è stata
% causata per flessione o per torsione

cd(dataDir);
try cd('Displ_file');
catch mkdir('Displ_file');
    cd('Displ_file');
end
try cd('Def_Angle');
catch mkdir('Def_Angle');
    cd('Def_Angle');
end

ncol = length(markers(1,:,1));
marker_detrended = zeros(size(markers));

for ii=1:ncol
    marker_detrended(1:end,ii)=detrend(markers(1:end,ii)); 
end

nodoi=26;
nodoj=25;

L = abs(coordsAtRest(nodoi,2) - coordsAtRest(nodoj,2));
angleRad = (marker_detrended(1:end,nodoi,1)-marker_detrended(1:end,nodoj,1)) / L;
angleGrad = angleRad * 180 / pi;

%% Save max value
maxAngle(1,1) = max(angleRad);
maxAngle(2,1) = maxAngle(1,1) * 180 / pi;
fileMaxRelAngle = ['Max Angle.mat'];
save(fileMaxRelAngle, 'maxAngle', '-ASCII');

fileRelAngle = ['Deformation Angle.mat'];
save(fileRelAngle, 'angleGrad', '-ASCII');

%% Plot time-angles
fig = figure();
dim = get(fig, 'Position');
set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);

subplot(1,1,1),hold on, grid on
plot(time,angleGrad);
% title(['Deformation angles'])
ylabel('Angle [°]')
xlabel('Time [s]')

print(fig,strcat('Deformation angles.PNG'),'-dpng');
savefig(strcat('Deformation angles.fig'));
close(fig);

cd(dataIndex);