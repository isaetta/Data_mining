function fun_displAbs(markers,time,dataIndex,dataDir)
%% DISPLACEMENT RELATIVE

% tutte le variabili sono rinominate come "Rel", in realtà sono "Assolute"

cd(dataDir);
try cd('Displ_file');
catch mkdir('Displ_file');
    cd('Displ_file');
end
try cd('Displ_absolute');
catch mkdir('Displ_absolute');
    cd('Displ_absolute');
end

% ST - ref
tempRelST(:,1) = time(:,1);
tempRelST(:,2) = ( detrend(markers(:,1,1)) + detrend(markers(:,2,1)) + detrend(markers(:,3,1)) ) / 3; % X
tempRelST(:,3) = ( detrend(markers(:,1,2)) + detrend(markers(:,2,2)) + detrend(markers(:,3,2)) ) / 3; % Y
tempRelST(:,4) = ( detrend(markers(:,1,3)) + detrend(markers(:,2,3)) + detrend(markers(:,3,3)) ) / 3; % Z
fileRelST = ['1 - ST ref.mat'];
save(fileRelST, 'tempRelST', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempRelST(:,2));
    title(['1 - ST ref'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempRelST(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempRelST(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('1 - ST ref.PNG'),'-dpng');
    savefig(strcat('1 - ST ref.fig'));
    close(fig);

% RC slab
tempRelRC(:,1) = time(:,1);
tempRelRC(:,2) = ( detrend(markers(:,4,1)) + detrend(markers(:,5,1)) + detrend(markers(:,6,1)) ) / 3; % X
tempRelRC(:,3) = ( detrend(markers(:,4,2)) + detrend(markers(:,5,2)) + detrend(markers(:,6,2)) ) / 3; % Y
tempRelRC(:,4) = ( detrend(markers(:,4,3)) + detrend(markers(:,5,3)) + detrend(markers(:,6,3)) ) / 3; % Z
fileRelRC = ['2 - RC slab.mat'];
save(fileRelRC, 'tempRelRC', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempRelRC(:,2));
    title(['2 - RC slab'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempRelRC(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempRelRC(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('2 - RC slab.PNG'),'-dpng');
    savefig(strcat('2 - RC slab.fig'));
    close(fig);

% Pipe POS 1
tempRelPipe1(:,1) = time(:,1);
tempRelPipe1(:,2) = ( detrend(markers(:,7,1)) + detrend(markers(:,8,1)) + detrend(markers(:,9,1)) + detrend(markers(:,27,1)) + detrend(markers(:,29,1)) ) / 5; % X
tempRelPipe1(:,3) = ( detrend(markers(:,7,2)) + detrend(markers(:,8,2)) + detrend(markers(:,9,2)) + detrend(markers(:,27,2)) + detrend(markers(:,29,2)) ) / 5; % Y
tempRelPipe1(:,4) = ( detrend(markers(:,7,3)) + detrend(markers(:,8,3)) + detrend(markers(:,9,3)) + detrend(markers(:,27,3)) + detrend(markers(:,29,3)) ) / 5; % Z
fileRelPipe1 = ['3 - Pipe POS 1.mat'];
save(fileRelPipe1, 'tempRelPipe1', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempRelPipe1(:,2));
    title(['3 - Pipe POS 1'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempRelPipe1(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempRelPipe1(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('3 - Pipe POS 1.PNG'),'-dpng');
    savefig(strcat('3 - Pipe POS 1.fig'));
    close(fig);

% Conveyor
tempRelConveyor(:,1) = time(:,1);
tempRelConveyor(:,2) = ( detrend(markers(:,10,1)) + detrend(markers(:,11,1)) ) / 2; % X
tempRelConveyor(:,3) = ( detrend(markers(:,10,2)) + detrend(markers(:,11,2)) ) / 2; % Y
tempRelConveyor(:,4) = ( detrend(markers(:,10,3)) + detrend(markers(:,11,3)) ) / 2; % Z
fileRelConveyor = ['4 - Conveyor.mat'];
save(fileRelConveyor, 'tempRelConveyor', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempRelConveyor(:,2));
    title(['4 - Conveyor'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempRelConveyor(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempRelConveyor(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('4 - Conveyor.PNG'),'-dpng');
    savefig(strcat('4 - Conveyor.fig'));
    close(fig);

% Pipe POS 2
tempRelPipe2(:,1) = time(:,1);
tempRelPipe2(:,2) = ( detrend(markers(:,12,1)) + detrend(markers(:,13,1)) ) / 2; % X
tempRelPipe2(:,3) = ( detrend(markers(:,12,2)) + detrend(markers(:,13,2)) ) / 2; % Y
tempRelPipe2(:,4) = ( detrend(markers(:,12,3)) + detrend(markers(:,13,3)) ) / 2; % Z
fileRelPipe2 = ['5 - Pipe POS 2.mat'];
save(fileRelPipe2, 'tempRelPipe2', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempRelPipe2(:,2));
    title(['5 - Pipe POS 2'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempRelPipe2(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempRelPipe2(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('5 - Pipe POS 2.PNG'),'-dpng');
    savefig(strcat('5 - Pipe POS 2.fig'));
    close(fig);

% Pipe POS 5
tempRelPipe5(:,1) = time(:,1);
tempRelPipe5(:,2) = detrend(markers(:,14,1)); % X
tempRelPipe5(:,3) = detrend(markers(:,14,2)); % Y
tempRelPipe5(:,4) = detrend(markers(:,14,3)); % Z
fileRelPipe5 = ['6 - Pipe POS 5.mat'];
save(fileRelPipe5, 'tempRelPipe5', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempRelPipe5(:,2));
    title(['6 - Pipe POS 5'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempRelPipe5(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempRelPipe5(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('6 - Pipe POS 5.PNG'),'-dpng');
    savefig(strcat('6 - Pipe POS 5.fig'));
    close(fig);

% Pipe POS 3
tempRelPipe3(:,1) = time(:,1);
tempRelPipe3(:,2) = detrend(markers(:,15,1)); % X
tempRelPipe3(:,3) = detrend(markers(:,15,2)); % Y
tempRelPipe3(:,4) = detrend(markers(:,15,3)); % Z
fileRelPipe3 = ['7 - Pipe POS 3.mat'];
save(fileRelPipe3, 'tempRelPipe3', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempRelPipe3(:,2));
    title(['7 - Pipe POS 3'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempRelPipe3(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempRelPipe3(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('7 - Pipe POS 3.PNG'),'-dpng');
    savefig(strcat('7 - Pipe POS 3.fig'));
    close(fig);
    
% Floor 1
tempRelFloor1(:,1) = time(:,1);
tempRelFloor1(:,2) = ( detrend(markers(:,16,1)) + detrend(markers(:,17,1)) + detrend(markers(:,18,1)) + detrend(markers(:,19,1)) + detrend(markers(:,20,1)) + detrend(markers(:,26,1)) ) / 6; % X
tempRelFloor1(:,3) = ( detrend(markers(:,16,2)) + detrend(markers(:,17,2)) + detrend(markers(:,18,2)) + detrend(markers(:,19,2)) + detrend(markers(:,20,2)) + detrend(markers(:,26,2)) ) / 6; % Y
tempRelFloor1(:,4) = ( detrend(markers(:,16,3)) + detrend(markers(:,17,3)) + detrend(markers(:,18,3)) + detrend(markers(:,19,3)) + detrend(markers(:,20,3)) + detrend(markers(:,26,3)) ) / 6; % Z
fileRelFloor1 = ['8 - Floor 1.mat'];
save(fileRelFloor1, 'tempRelFloor1', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempRelFloor1(:,2));
    title(['8 - Floor 1'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempRelFloor1(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempRelFloor1(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('8 - Floor 1.PNG'),'-dpng');
    savefig(strcat('8 - Floor 1.fig'));
    close(fig);

% Internal beam
tempRelIntBeam(:,1) = time(:,1);
tempRelIntBeam(:,2) = ( detrend(markers(:,21,1)) + detrend(markers(:,22,1)) + detrend(markers(:,23,1)) + detrend(markers(:,24,1)) + detrend(markers(:,25,1)) ) / 5; % X
tempRelIntBeam(:,3) = ( detrend(markers(:,21,2)) + detrend(markers(:,22,2)) + detrend(markers(:,23,2)) + detrend(markers(:,24,2)) + detrend(markers(:,25,2)) ) / 5; % Y
tempRelIntBeam(:,4) = ( detrend(markers(:,21,3)) + detrend(markers(:,22,3)) + detrend(markers(:,23,3)) + detrend(markers(:,24,3)) + detrend(markers(:,25,3)) ) / 5; % Z
fileRelIntBeam = ['9 - Internal beam.mat'];
save(fileRelIntBeam, 'tempRelIntBeam', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempRelIntBeam(:,2));
    title(['9 - Internal beam'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempRelIntBeam(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempRelIntBeam(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('9 - Internal beam.PNG'),'-dpng');
    savefig(strcat('9 - Internal beam.fig'));
    close(fig);

% SDOF12
tempRelSDOF12(:,1) = time(:,1);
tempRelSDOF12(:,2) = detrend(markers(:,28,1)); % X
tempRelSDOF12(:,3) = detrend(markers(:,28,2)); % Y
tempRelSDOF12(:,4) = detrend(markers(:,28,3)); % Z
fileRelSDOF12 = ['10 - SDOF12.mat'];
save(fileRelSDOF12, 'tempRelSDOF12', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempRelSDOF12(:,2));
    title(['10 - SDOF12'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempRelSDOF12(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempRelSDOF12(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('10 - SDOF12.PNG'),'-dpng');
    savefig(strcat('10 - SDOF12.fig'));
    close(fig);

% Tank 1
tempRelTank1(:,1) = time(:,1);
tempRelTank1(:,2) = ( detrend(markers(:,30,1)) + detrend(markers(:,33,1)) + detrend(markers(:,39,1)) ) / 3; % X
tempRelTank1(:,3) = ( detrend(markers(:,30,2)) + detrend(markers(:,33,2)) + detrend(markers(:,39,2)) ) / 3; % Y
tempRelTank1(:,4) = ( detrend(markers(:,30,3)) + detrend(markers(:,33,3)) + detrend(markers(:,39,3)) ) / 3; % Z
fileRelTank1 = ['11 - Tank 1.mat'];
save(fileRelTank1, 'tempRelTank1', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempRelTank1(:,2));
    title(['11 - Tank 1'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempRelTank1(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempRelTank1(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('11 - Tank 1.PNG'),'-dpng');
    savefig(strcat('11 - Tank 1.fig'));
    close(fig);

% Tank 2
tempRelTank2(:,1) = time(:,1);
tempRelTank2(:,2) = ( detrend(markers(:,31,1)) + detrend(markers(:,32,1)) + detrend(markers(:,36,1)) ) / 3; % X
tempRelTank2(:,3) = ( detrend(markers(:,31,2)) + detrend(markers(:,32,2)) + detrend(markers(:,36,2)) ) / 3; % Y
tempRelTank2(:,4) = ( detrend(markers(:,31,3)) + detrend(markers(:,32,3)) + detrend(markers(:,36,3)) ) / 3; % Z
fileRelTank2 = ['12 - Tank 2.mat'];
save(fileRelTank2, 'tempRelTank2', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempRelTank2(:,2));
    title(['12 - Tank 2'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempRelTank2(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempRelTank2(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('12 - Tank 2.PNG'),'-dpng');
    savefig(strcat('12 - Tank 2.fig'));
    close(fig);

% Pipe POS 4
tempRelPipe4(:,1) = time(:,1);
tempRelPipe4(:,2) = ( detrend(markers(:,34,1)) + detrend(markers(:,35,1)) + detrend(markers(:,41,1)) ) / 3; % X
tempRelPipe4(:,3) = ( detrend(markers(:,34,2)) + detrend(markers(:,35,2)) + detrend(markers(:,41,2)) ) / 3; % Y
tempRelPipe4(:,4) = ( detrend(markers(:,34,3)) + detrend(markers(:,35,3)) + detrend(markers(:,41,3)) ) / 3; % Z
fileRelPipe4 = ['13 - Pipe POS 4.mat'];
save(fileRelPipe4, 'tempRelPipe4', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempRelPipe4(:,2));
    title(['13 - Pipe POS 4'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempRelPipe4(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempRelPipe4(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('13 - Pipe POS 4.PNG'),'-dpng');
    savefig(strcat('13 - Pipe POS 4.fig'));
    close(fig);

% Pipe POS 6
tempRelPipe6(:,1) = time(:,1);
tempRelPipe6(:,2) = ( detrend(markers(:,37,1)) + detrend(markers(:,38,1)) + detrend(markers(:,40,1)) ) / 3; % X
tempRelPipe6(:,3) = ( detrend(markers(:,37,2)) + detrend(markers(:,38,2)) + detrend(markers(:,40,2)) ) / 3; % Y
tempRelPipe6(:,4) = ( detrend(markers(:,37,3)) + detrend(markers(:,38,3)) + detrend(markers(:,40,3)) ) / 3; % Z
fileRelPipe6 = ['14 - Pipe POS 6.mat'];
save(fileRelPipe6, 'tempRelPipe6', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempRelPipe6(:,2));
    title(['14 - Pipe POS 6'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempRelPipe6(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempRelPipe6(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('14 - Pipe POS 6.PNG'),'-dpng');
    savefig(strcat('14 - Pipe POS 6.fig'));
    close(fig);

% Floor 2
tempRelFloor2(:,1) = time(:,1);
tempRelFloor2(:,2) = ( detrend(markers(:,42,1)) + detrend(markers(:,43,1)) + detrend(markers(:,44,1)) + detrend(markers(:,45,1)) + detrend(markers(:,46,1)) + detrend(markers(:,47,1)) ) / 6; % X
tempRelFloor2(:,3) = ( detrend(markers(:,42,2)) + detrend(markers(:,43,2)) + detrend(markers(:,44,2)) + detrend(markers(:,45,2)) + detrend(markers(:,46,2)) + detrend(markers(:,47,2)) ) / 6; % Y
tempRelFloor2(:,4) = ( detrend(markers(:,42,3)) + detrend(markers(:,43,3)) + detrend(markers(:,44,3)) + detrend(markers(:,45,3)) + detrend(markers(:,46,3)) + detrend(markers(:,47,3)) ) / 6; % Z
fileRelFloor2 = ['15 - Floor 2.mat'];
save(fileRelFloor2, 'tempRelFloor2', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempRelFloor2(:,2));
    title(['15 - Floor 2'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempRelFloor2(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempRelFloor2(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('15 - Floor 2.PNG'),'-dpng');
    savefig(strcat('15 - Floor 2.fig'));
    close(fig);

% SDOF21
tempRelSDOF21(:,1) = time(:,1);
tempRelSDOF21(:,2) = detrend(markers(:,48,1)); % X
tempRelSDOF21(:,3) = detrend(markers(:,48,2)); % Y
tempRelSDOF21(:,4) = detrend(markers(:,48,3)); % Z
fileRelSDOF21 = ['16 - SDOF21.mat'];
save(fileRelSDOF21, 'tempRelSDOF21', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempRelSDOF21(:,2));
    title(['16 - SDOF21'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempRelSDOF21(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempRelSDOF21(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('16 - SDOF21.PNG'),'-dpng');
    savefig(strcat('16 - SDOF21.fig'));
    close(fig);

% Tank 3
tempRelTank3(:,1) = time(:,1);
tempRelTank3(:,2) = ( detrend(markers(:,50,1)) + detrend(markers(:,51,1)) ) / 2; % X
tempRelTank3(:,3) = ( detrend(markers(:,50,2)) + detrend(markers(:,51,2)) ) / 2; % Y
tempRelTank3(:,4) = ( detrend(markers(:,50,3)) + detrend(markers(:,51,3)) ) / 2; % Z
fileRelTank3 = ['17 - Tank 3.mat'];
save(fileRelTank3, 'tempRelTank3', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempRelTank3(:,2));
    title(['17 - Tank 3'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempRelTank3(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempRelTank3(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('17 - Tank 3.PNG'),'-dpng');
    savefig(strcat('17 - Tank 3.fig'));
    close(fig);

% Tank 4
tempRelTank4(:,1) = time(:,1);
tempRelTank4(:,2) = ( detrend(markers(:,49,1)) + detrend(markers(:,53,1)) + detrend(markers(:,54,1)) ) / 3; % X
tempRelTank4(:,3) = ( detrend(markers(:,49,2)) + detrend(markers(:,53,2)) + detrend(markers(:,54,2)) ) / 3; % Y
tempRelTank4(:,4) = ( detrend(markers(:,49,3)) + detrend(markers(:,53,3)) + detrend(markers(:,54,3)) ) / 3; % Z
fileRelTank4 = ['18 - Tank 4.mat'];
save(fileRelTank4, 'tempRelTank4', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempRelTank4(:,2));
    title(['18 - Tank 4'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempRelTank4(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempRelTank4(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('18 - Tank 4.PNG'),'-dpng');
    savefig(strcat('18 - Tank 4.fig'));
    close(fig);

% Pipe POS 7
tempRelPipe7(:,1) = time(:,1);
tempRelPipe7(:,2) = detrend(markers(:,52,1)); % X
tempRelPipe7(:,3) = detrend(markers(:,52,2)); % Y
tempRelPipe7(:,4) = detrend(markers(:,52,3)); % Z
fileRelPipe7 = ['19 - Pipe POS 7.mat'];
save(fileRelPipe7, 'tempRelPipe7', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempRelPipe7(:,2));
    title(['19 - Pipe POS 7'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempRelPipe7(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempRelPipe7(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('19 - Pipe POS 7.PNG'),'-dpng');
    savefig(strcat('19 - Pipe POS 7.fig'));
    close(fig);

% Pipe POS 10
tempRelPipe10(:,1) = time(:,1);
tempRelPipe10(:,2) = ( detrend(markers(:,55,1)) + detrend(markers(:,56,1)) ) / 2; % X
tempRelPipe10(:,3) = ( detrend(markers(:,55,2)) + detrend(markers(:,56,2)) ) / 2; % Y
tempRelPipe10(:,4) = ( detrend(markers(:,55,3)) + detrend(markers(:,56,3)) ) / 2; % Z
fileRelPipe10 = ['20 - Pipe POS 10.mat'];
save(fileRelPipe10, 'tempRelPipe10', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempRelPipe10(:,2));
    title(['20 - Pipe POS 10'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempRelPipe10(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempRelPipe10(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('20 - Pipe POS 10.PNG'),'-dpng');
    savefig(strcat('20 - Pipe POS 10.fig'));
    close(fig);

% Pipe POS 9
tempRelPipe9(:,1) = time(:,1);
tempRelPipe9(:,2) = ( detrend(markers(:,57,1)) + detrend(markers(:,58,1)) + detrend(markers(:,59,1)) + detrend(markers(:,60,1)) ) / 4; % X
tempRelPipe9(:,3) = ( detrend(markers(:,57,2)) + detrend(markers(:,58,2)) + detrend(markers(:,59,2)) + detrend(markers(:,60,2)) ) / 4; % Y
tempRelPipe9(:,4) = ( detrend(markers(:,57,3)) + detrend(markers(:,58,3)) + detrend(markers(:,59,3)) + detrend(markers(:,60,3)) ) / 4; % Z
fileRelPipe9 = ['21 - Pipe POS 9.mat'];
save(fileRelPipe9, 'tempRelPipe9', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempRelPipe9(:,2));
    title(['21 - Pipe POS 9'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempRelPipe9(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempRelPipe9(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('21 - Pipe POS 9.PNG'),'-dpng');
    savefig(strcat('21 - Pipe POS 9.fig'));
    close(fig);

% Floor 3
tempRelFloor3(:,1) = time(:,1);
tempRelFloor3(:,2) = ( detrend(markers(:,61,1)) + detrend(markers(:,62,1)) + detrend(markers(:,63,1)) + detrend(markers(:,64,1)) + detrend(markers(:,65,1)) + detrend(markers(:,66,1)) ) / 6; % X
tempRelFloor3(:,3) = ( detrend(markers(:,61,2)) + detrend(markers(:,62,2)) + detrend(markers(:,63,2)) + detrend(markers(:,64,2)) + detrend(markers(:,65,2)) + detrend(markers(:,66,2)) ) / 6; % Y
tempRelFloor3(:,4) = ( detrend(markers(:,61,3)) + detrend(markers(:,62,3)) + detrend(markers(:,63,3)) + detrend(markers(:,64,3)) + detrend(markers(:,65,3)) + detrend(markers(:,66,3)) ) / 6; % Z
fileRelFloor3 = ['22 - Floor 3.mat'];
save(fileRelFloor3, 'tempRelFloor3', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempRelFloor3(:,2));
    title(['22 - Floor 3'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempRelFloor3(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempRelFloor3(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('22 - Floor 3.PNG'),'-dpng');
    savefig(strcat('22 - Floor 3.fig'));
    close(fig);

% SDOF32
tempRelSDOF32(:,1) = time(:,1);
tempRelSDOF32(:,2) = detrend(markers(:,67,1)); % X
tempRelSDOF32(:,3) = detrend(markers(:,67,2)); % Y
tempRelSDOF32(:,4) = detrend(markers(:,67,3)); % Z
fileRelSDOF32 = ['23 - SDOF32.mat'];
save(fileRelSDOF32, 'tempRelSDOF32', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempRelSDOF32(:,2));
    title(['23 - SDOF32'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempRelSDOF32(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempRelSDOF32(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('23 - SDOF32.PNG'),'-dpng');
    savefig(strcat('23 - SDOF32.fig'));
    close(fig);

% DN80 rack N
tempRelDN80RackN(:,1) = time(:,1);
tempRelDN80RackN(:,2) = ( detrend(markers(:,68,1)) + detrend(markers(:,69,1)) + detrend(markers(:,70,1)) + detrend(markers(:,71,1)) ) / 4; % X
tempRelDN80RackN(:,3) = ( detrend(markers(:,68,2)) + detrend(markers(:,69,2)) + detrend(markers(:,70,2)) + detrend(markers(:,71,2)) ) / 4; % Y
tempRelDN80RackN(:,4) = ( detrend(markers(:,68,3)) + detrend(markers(:,69,3)) + detrend(markers(:,70,3)) + detrend(markers(:,71,3)) ) / 4; % Z
fileRelDN80RackN = ['24 - DN80 rack N.mat'];
save(fileRelDN80RackN, 'tempRelDN80RackN', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempRelDN80RackN(:,2));
    title(['24 - DN80 rack N'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempRelDN80RackN(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempRelDN80RackN(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('24 - DN80 rack N.PNG'),'-dpng');
    savefig(strcat('24 - DN80 rack N.fig'));
    close(fig);

% Rack N
tempRelRackN(:,1) = time(:,1);
tempRelRackN(:,2) = detrend(markers(:,72,1)); % X
tempRelRackN(:,3) = detrend(markers(:,72,2)); % Y
tempRelRackN(:,4) = detrend(markers(:,72,3)); % Z
fileRelRackN = ['25 - Rack N.mat'];
save(fileRelRackN, 'tempRelRackN', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempRelRackN(:,2));
    title(['25 - Rack N'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempRelRackN(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempRelRackN(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('25 - Rack N.PNG'),'-dpng');
    savefig(strcat('25 - Rack N.fig'));
    close(fig);

% DN80 rack E
tempRelDN80RackE(:,1) = time(:,1);
tempRelDN80RackE(:,2) = ( detrend(markers(:,73,1)) + detrend(markers(:,74,1)) + detrend(markers(:,75,1)) + detrend(markers(:,76,1)) ) / 4; % X
tempRelDN80RackE(:,3) = ( detrend(markers(:,73,2)) + detrend(markers(:,74,2)) + detrend(markers(:,75,2)) + detrend(markers(:,76,2)) ) / 4; % Y
tempRelDN80RackE(:,4) = ( detrend(markers(:,73,3)) + detrend(markers(:,74,3)) + detrend(markers(:,75,3)) + detrend(markers(:,76,3)) ) / 4; % Z
fileRelDN80RackE = ['26 - DN80 rack E.mat'];
save(fileRelDN80RackE, 'tempRelDN80RackE', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempRelDN80RackE(:,2));
    title(['26 - DN80 rack E'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempRelDN80RackE(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempRelDN80RackE(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('26 - DN80 rack E.PNG'),'-dpng');
    savefig(strcat('26 - DN80 rack E.fig'));
    close(fig);

% Rack E
tempRelRackE(:,1) = time(:,1);
tempRelRackE(:,2) = detrend(markers(:,77,1)); % X
tempRelRackE(:,3) = detrend(markers(:,77,2)); % Y
tempRelRackE(:,4) = detrend(markers(:,77,3)); % Z
fileRelRackE = ['27 - Rack E.mat'];
save(fileRelRackE, 'tempRelRackE', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempRelRackE(:,2));
    title(['27 - Rack E'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempRelRackE(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempRelRackE(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('27 - Rack E.PNG'),'-dpng');
    savefig(strcat('27 - Rack E.fig'));
    close(fig);

% Cabinet
tempRelCabinet(:,1) = time(:,1);
tempRelCabinet(:,2) = detrend(markers(:,78,1)); % X
tempRelCabinet(:,3) = detrend(markers(:,78,2)); % Y
tempRelCabinet(:,4) = detrend(markers(:,78,3)); % Z
fileRelCabinet = ['28 - Cabinet.mat'];
save(fileRelCabinet, 'tempRelCabinet', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempRelCabinet(:,2));
    title(['28 - Cabinet'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempRelCabinet(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempRelCabinet(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('28 - Cabinet.PNG'),'-dpng');
    savefig(strcat('28 - Cabinet.fig'));
    close(fig);

cd(dataDir);

%% DISPLACEMENT FLOORS
cd('Displ_file');
try cd('Displ_floor');
catch mkdir('Displ_floor');
    cd('Displ_floor');
end

    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    label_xy = [0 3.1 6.2 9.3];
    label_xx = [0 max(abs(tempRelFloor1(:,2))) max(abs(tempRelFloor2(:,2))) max(abs(tempRelFloor3(:,2)))];
    subplot(1,3,1),hold on, grid on
    plot(label_xx,label_xy,'-o');
    title(['X'])
    ylabel('Floor Height [m]')
    xlabel('Max displ [mm]')
    % Y
    label_yy = [0 3.1 6.2 9.3];
    label_yx = [0 max(abs(tempRelFloor1(:,3))) max(abs(tempRelFloor2(:,3))) max(abs(tempRelFloor3(:,3)))];
    subplot(1,3,2),hold on, grid on
    plot(label_yx,label_yy,'-o');
    title(['Y'])
    ylabel('Floor Height [m]')
    xlabel('Max displ [mm]')
    % Z
    label_zy = [0 3.1 6.2 9.3];
    label_zx = [0 max(abs(tempRelFloor1(:,4))) max(abs(tempRelFloor2(:,4))) max(abs(tempRelFloor3(:,4)))];
    subplot(1,3,3),hold on, grid on
    plot(label_zx,label_zy,'-o');
    title(['Z'])
    ylabel('Floor Height [m]')
    xlabel('Max displ [mm]')
    
    % plot
    print(fig,strcat('Floor Absolute.PNG'),'-dpng');
    savefig(strcat('Floor Absolute.fig'));
    close(fig);
    
cd(dataIndex);