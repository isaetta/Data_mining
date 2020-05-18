function fun_displAbsolute(markers,time,coordsAtRest,dataIndex,dataDir)
%% DISPLACEMENT ABSOLUTE
cd(dataDir);
try cd('Displ_file');
catch mkdir('Displ_file');
    cd('Displ_file');
end
try cd('Absolute');
catch mkdir('Absolute');
    cd('Absolute');
end

% ST - ref
tempAbsST(:,1) = time(:,1);
tempAbsST(:,2) = ( detrend(markers(:,1,1)) + detrend(markers(:,2,1)) + detrend(markers(:,3,1)) ) / 3 + ( coordsAtRest(1,1) + coordsAtRest(2,1) + coordsAtRest(3,1)) / 3; % X
tempAbsST(:,3) = ( detrend(markers(:,1,2)) + detrend(markers(:,2,2)) + detrend(markers(:,3,2)) ) / 3 + ( coordsAtRest(1,2) + coordsAtRest(2,2) + coordsAtRest(3,2)) / 3; % Y
tempAbsST(:,4) = ( detrend(markers(:,1,3)) + detrend(markers(:,2,3)) + detrend(markers(:,3,3)) ) / 3 + ( coordsAtRest(1,3) + coordsAtRest(2,3) + coordsAtRest(3,3)) / 3; % Z
fileAbsST = ['1 - ST ref.mat'];
save(fileAbsST, 'tempAbsST', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempAbsST(:,2));
    title(['1 - ST ref'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempAbsST(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempAbsST(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('1 - ST ref.PNG'),'-dpng');
    savefig(strcat('1 - ST ref.fig'));
    close(fig);

% RC slab
tempAbsRC(:,1) = time(:,1);
tempAbsRC(:,2) = ( detrend(markers(:,4,1)) + detrend(markers(:,5,1)) + detrend(markers(:,6,1)) ) / 3 + ( coordsAtRest(4,1) + coordsAtRest(5,1) + coordsAtRest(6,1)) / 3; % X
tempAbsRC(:,3) = ( detrend(markers(:,4,2)) + detrend(markers(:,5,2)) + detrend(markers(:,6,2)) ) / 3 + ( coordsAtRest(4,2) + coordsAtRest(5,2) + coordsAtRest(6,2)) / 3; % Y
tempAbsRC(:,4) = ( detrend(markers(:,4,3)) + detrend(markers(:,5,3)) + detrend(markers(:,6,3)) ) / 3 + ( coordsAtRest(4,3) + coordsAtRest(5,3) + coordsAtRest(6,3)) / 3; % Z
fileAbsRC = ['2 - RC slab.mat'];
save(fileAbsRC, 'tempAbsRC', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempAbsRC(:,2));
    title(['2 - RC slab'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempAbsRC(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempAbsRC(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('2 - RC slab.PNG'),'-dpng');
    savefig(strcat('2 - RC slab.fig'));
    close(fig);

% Pipe POS 1
tempAbsPipe1(:,1) = time(:,1);
tempAbsPipe1(:,2) = ( detrend(markers(:,7,1)) + detrend(markers(:,8,1)) + detrend(markers(:,9,1)) + detrend(markers(:,27,1)) + detrend(markers(:,29,1)) ) / 5 + ( coordsAtRest(7,1) + coordsAtRest(8,1) + coordsAtRest(9,1) + coordsAtRest(27,1) + coordsAtRest(29,1)) / 5; % X
tempAbsPipe1(:,3) = ( detrend(markers(:,7,2)) + detrend(markers(:,8,2)) + detrend(markers(:,9,2)) + detrend(markers(:,27,2)) + detrend(markers(:,29,2)) ) / 5 + ( coordsAtRest(7,2) + coordsAtRest(8,2) + coordsAtRest(9,2) + coordsAtRest(27,2) + coordsAtRest(29,2)) / 5; % Y
tempAbsPipe1(:,4) = ( detrend(markers(:,7,3)) + detrend(markers(:,8,3)) + detrend(markers(:,9,3)) + detrend(markers(:,27,3)) + detrend(markers(:,29,3)) ) / 5 + ( coordsAtRest(7,3) + coordsAtRest(8,3) + coordsAtRest(9,3) + coordsAtRest(27,3) + coordsAtRest(29,3)) / 5; % Z
fileAbsPipe1 = ['3 - Pipe POS 1.mat'];
save(fileAbsPipe1, 'tempAbsPipe1', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempAbsPipe1(:,2));
    title(['3 - Pipe POS 1'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempAbsPipe1(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempAbsPipe1(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('3 - Pipe POS 1.PNG'),'-dpng');
    savefig(strcat('3 - Pipe POS 1.fig'));
    close(fig);

% Conveyor
tempAbsConveyor(:,1) = time(:,1);
tempAbsConveyor(:,2) = ( detrend(markers(:,10,1)) + detrend(markers(:,11,1)) ) / 2 + ( coordsAtRest(10,1) + coordsAtRest(11,1) ) / 2; % X
tempAbsConveyor(:,3) = ( detrend(markers(:,10,2)) + detrend(markers(:,11,2)) ) / 2 + ( coordsAtRest(10,2) + coordsAtRest(11,2) ) / 2; % Y
tempAbsConveyor(:,4) = ( detrend(markers(:,10,3)) + detrend(markers(:,11,3)) ) / 2 + ( coordsAtRest(10,3) + coordsAtRest(11,3) ) / 2; % Z
fileAbsConveyor = ['4 - Conveyor.mat'];
save(fileAbsConveyor, 'tempAbsConveyor', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempAbsConveyor(:,2));
    title(['4 - Conveyor'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempAbsConveyor(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempAbsConveyor(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('4 - Conveyor.PNG'),'-dpng');
    savefig(strcat('4 - Conveyor.fig'));
    close(fig);

% Pipe POS 2
tempAbsPipe2(:,1) = time(:,1);
tempAbsPipe2(:,2) = ( detrend(markers(:,12,1)) + detrend(markers(:,13,1)) ) / 2 + ( coordsAtRest(12,1) + coordsAtRest(13,1) ) / 2; % X
tempAbsPipe2(:,3) = ( detrend(markers(:,12,2)) + detrend(markers(:,13,2)) ) / 2 + ( coordsAtRest(12,2) + coordsAtRest(13,2) ) / 2; % Y
tempAbsPipe2(:,4) = ( detrend(markers(:,12,3)) + detrend(markers(:,13,3)) ) / 2 + ( coordsAtRest(12,3) + coordsAtRest(13,3) ) / 2; % Z
fileAbsPipe2 = ['5 - Pipe POS 2.mat'];
save(fileAbsPipe2, 'tempAbsPipe2', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempAbsPipe2(:,2));
    title(['5 - Pipe POS 2'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempAbsPipe2(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempAbsPipe2(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('5 - Pipe POS 2.PNG'),'-dpng');
    savefig(strcat('5 - Pipe POS 2.fig'));
    close(fig);

% Pipe POS 5
tempAbsPipe5(:,1) = time(:,1);
tempAbsPipe5(:,2) = detrend(markers(:,14,1)) + coordsAtRest(14,1); % X
tempAbsPipe5(:,3) = detrend(markers(:,14,2)) + coordsAtRest(14,2); % Y
tempAbsPipe5(:,4) = detrend(markers(:,14,3)) + coordsAtRest(14,3); % Z
fileAbsPipe5 = ['6 - Pipe POS 5.mat'];
save(fileAbsPipe5, 'tempAbsPipe5', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempAbsPipe5(:,2));
    title(['6 - Pipe POS 5'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempAbsPipe5(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempAbsPipe5(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('6 - Pipe POS 5.PNG'),'-dpng');
    savefig(strcat('6 - Pipe POS 5.fig'));
    close(fig);

% Pipe POS 3
tempAbsPipe3(:,1) = time(:,1);
tempAbsPipe3(:,2) = detrend(markers(:,15,1)) + coordsAtRest(15,1); % X
tempAbsPipe3(:,3) = detrend(markers(:,15,2)) + coordsAtRest(15,2); % Y
tempAbsPipe3(:,4) = detrend(markers(:,15,3)) + coordsAtRest(15,3); % Z
fileAbsPipe3 = ['7 - Pipe POS 3.mat'];
save(fileAbsPipe3, 'tempAbsPipe3', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempAbsPipe3(:,2));
    title(['7 - Pipe POS 3'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempAbsPipe3(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempAbsPipe3(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('7 - Pipe POS 3.PNG'),'-dpng');
    savefig(strcat('7 - Pipe POS 3.fig'));
    close(fig);

% Floor 1
tempAbsFloor1(:,1) = time(:,1);
tempAbsFloor1(:,2) = ( detrend(markers(:,16,1)) + detrend(markers(:,17,1)) + detrend(markers(:,18,1)) + detrend(markers(:,19,1)) + detrend(markers(:,20,1)) + detrend(markers(:,26,1)) ) / 6 + ( coordsAtRest(16,1) + coordsAtRest(17,1) + coordsAtRest(18,1) + coordsAtRest(19,1) + coordsAtRest(20,1) + coordsAtRest(26,1)) / 6; % X
tempAbsFloor1(:,3) = ( detrend(markers(:,16,2)) + detrend(markers(:,17,2)) + detrend(markers(:,18,2)) + detrend(markers(:,19,2)) + detrend(markers(:,20,2)) + detrend(markers(:,26,2)) ) / 6 + ( coordsAtRest(16,2) + coordsAtRest(17,2) + coordsAtRest(18,2) + coordsAtRest(19,2) + coordsAtRest(20,2) + coordsAtRest(26,2)) / 6; % Y
tempAbsFloor1(:,4) = ( detrend(markers(:,16,3)) + detrend(markers(:,17,3)) + detrend(markers(:,18,3)) + detrend(markers(:,19,3)) + detrend(markers(:,20,3)) + detrend(markers(:,26,3)) ) / 6 + ( coordsAtRest(16,3) + coordsAtRest(17,3) + coordsAtRest(18,3) + coordsAtRest(19,3) + coordsAtRest(20,3) + coordsAtRest(26,3)) / 6; % Z
fileAbsFloor1 = ['8 - Floor 1.mat'];
save(fileAbsFloor1, 'tempAbsFloor1', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempAbsFloor1(:,2));
    title(['8 - Floor 1'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempAbsFloor1(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempAbsFloor1(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('8 - Floor 1.PNG'),'-dpng');
    savefig(strcat('8 - Floor 1.fig'));
    close(fig);

% Internal beam
tempAbsIntBeam(:,1) = time(:,1);
tempAbsIntBeam(:,2) = ( detrend(markers(:,21,1)) + detrend(markers(:,22,1)) + detrend(markers(:,23,1)) + detrend(markers(:,24,1)) + detrend(markers(:,25,1)) ) / 5 + ( coordsAtRest(21,1) + coordsAtRest(22,1) + coordsAtRest(23,1) + coordsAtRest(24,1) + coordsAtRest(25,1)) / 5; % X
tempAbsIntBeam(:,3) = ( detrend(markers(:,21,2)) + detrend(markers(:,22,2)) + detrend(markers(:,23,2)) + detrend(markers(:,24,2)) + detrend(markers(:,25,2)) ) / 5 + ( coordsAtRest(21,2) + coordsAtRest(22,2) + coordsAtRest(23,2) + coordsAtRest(24,2) + coordsAtRest(25,2)) / 5; % Y
tempAbsIntBeam(:,4) = ( detrend(markers(:,21,3)) + detrend(markers(:,22,3)) + detrend(markers(:,23,3)) + detrend(markers(:,24,3)) + detrend(markers(:,25,3)) ) / 5 + ( coordsAtRest(21,3) + coordsAtRest(22,3) + coordsAtRest(23,3) + coordsAtRest(24,3) + coordsAtRest(25,3)) / 5; % Z
fileAbsIntBeam = ['9 - Internal beam.mat'];
save(fileAbsIntBeam, 'tempAbsIntBeam', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempAbsIntBeam(:,2));
    title(['9 - Internal beam'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempAbsIntBeam(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempAbsIntBeam(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('9 - Internal beam.PNG'),'-dpng');
    savefig(strcat('9 - Internal beam.fig'));
    close(fig);

% SDOF12
tempAbsSDOF12(:,1) = time(:,1);
tempAbsSDOF12(:,2) = detrend(markers(:,28,1)) + coordsAtRest(28,1); % X
tempAbsSDOF12(:,3) = detrend(markers(:,28,2)) + coordsAtRest(28,2); % Y
tempAbsSDOF12(:,4) = detrend(markers(:,28,3)) + coordsAtRest(28,3); % Z
fileAbsSDOF12 = ['10 - SDOF12.mat'];
save(fileAbsSDOF12, 'tempAbsSDOF12', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempAbsSDOF12(:,2));
    title(['10 - SDOF12'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempAbsSDOF12(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempAbsSDOF12(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('10 - SDOF12.PNG'),'-dpng');
    savefig(strcat('10 - SDOF12.fig'));
    close(fig);

% Tank 1
tempAbsTank1(:,1) = time(:,1);
tempAbsTank1(:,2) = ( detrend(markers(:,30,1)) + detrend(markers(:,33,1)) + detrend(markers(:,39,1)) ) / 3 + ( coordsAtRest(30,1) + coordsAtRest(33,1) + coordsAtRest(39,1)) / 3; % X
tempAbsTank1(:,3) = ( detrend(markers(:,30,2)) + detrend(markers(:,33,2)) + detrend(markers(:,39,2)) ) / 3 + ( coordsAtRest(30,2) + coordsAtRest(33,2) + coordsAtRest(39,2)) / 3; % Y
tempAbsTank1(:,4) = ( detrend(markers(:,30,3)) + detrend(markers(:,33,3)) + detrend(markers(:,39,3)) ) / 3 + ( coordsAtRest(30,3) + coordsAtRest(33,3) + coordsAtRest(39,3)) / 3; % Z
fileAbsTank1 = ['11 - Tank 1.mat'];
save(fileAbsTank1, 'tempAbsTank1', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempAbsTank1(:,2));
    title(['11 - Tank 1'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempAbsTank1(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempAbsTank1(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('11 - Tank 1.PNG'),'-dpng');
    savefig(strcat('11 - Tank 1.fig'));
    close(fig);

% Tank 2
tempAbsTank2(:,1) = time(:,1);
tempAbsTank2(:,2) = ( detrend(markers(:,31,1)) + detrend(markers(:,32,1)) + detrend(markers(:,36,1)) ) / 3 + ( coordsAtRest(31,1) + coordsAtRest(32,1) + coordsAtRest(36,1)) / 3; % X
tempAbsTank2(:,3) = ( detrend(markers(:,31,2)) + detrend(markers(:,32,2)) + detrend(markers(:,36,2)) ) / 3 + ( coordsAtRest(31,2) + coordsAtRest(32,2) + coordsAtRest(36,2)) / 3; % Y
tempAbsTank2(:,4) = ( detrend(markers(:,31,3)) + detrend(markers(:,32,3)) + detrend(markers(:,36,3)) ) / 3 + ( coordsAtRest(31,3) + coordsAtRest(32,3) + coordsAtRest(36,3)) / 3; % Z
fileAbsTank2 = ['12 - Tank 2.mat'];
save(fileAbsTank2, 'tempAbsTank2', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempAbsTank2(:,2));
    title(['12 - Tank 2'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempAbsTank2(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempAbsTank2(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('12 - Tank 2.PNG'),'-dpng');
    savefig(strcat('12 - Tank 2.fig'));
    close(fig);

% Pipe POS 4
tempAbsPipe4(:,1) = time(:,1);
tempAbsPipe4(:,2) = ( detrend(markers(:,34,1)) + detrend(markers(:,35,1)) + detrend(markers(:,41,1)) ) / 3 + ( coordsAtRest(34,1) + coordsAtRest(35,1) + coordsAtRest(41,1)) / 3; % X
tempAbsPipe4(:,3) = ( detrend(markers(:,34,2)) + detrend(markers(:,35,2)) + detrend(markers(:,41,2)) ) / 3 + ( coordsAtRest(34,2) + coordsAtRest(35,2) + coordsAtRest(41,2)) / 3; % Y
tempAbsPipe4(:,4) = ( detrend(markers(:,34,3)) + detrend(markers(:,35,3)) + detrend(markers(:,41,3)) ) / 3 + ( coordsAtRest(34,3) + coordsAtRest(35,3) + coordsAtRest(41,3)) / 3; % Z
fileAbsPipe4 = ['13 - Pipe POS 4.mat'];
save(fileAbsPipe4, 'tempAbsPipe4', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempAbsPipe4(:,2));
    title(['13 - Pipe POS 4'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempAbsPipe4(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempAbsPipe4(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('13 - Pipe POS 4.PNG'),'-dpng');
    savefig(strcat('13 - Pipe POS 4.fig'));
    close(fig);

% Pipe POS 6
tempAbsPipe6(:,1) = time(:,1);
tempAbsPipe6(:,2) = ( detrend(markers(:,37,1)) + detrend(markers(:,38,1)) + detrend(markers(:,40,1)) ) / 3 + ( coordsAtRest(37,1) + coordsAtRest(38,1) + coordsAtRest(40,1)) / 3; % X
tempAbsPipe6(:,3) = ( detrend(markers(:,37,2)) + detrend(markers(:,38,2)) + detrend(markers(:,40,2)) ) / 3 + ( coordsAtRest(37,2) + coordsAtRest(38,2) + coordsAtRest(40,2)) / 3; % Y
tempAbsPipe6(:,4) = ( detrend(markers(:,37,3)) + detrend(markers(:,38,3)) + detrend(markers(:,40,3)) ) / 3 + ( coordsAtRest(37,3) + coordsAtRest(38,3) + coordsAtRest(40,3)) / 3; % Z
fileAbsPipe6 = ['14 - Pipe POS 6.mat'];
save(fileAbsPipe6, 'tempAbsPipe6', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempAbsPipe6(:,2));
    title(['14 - Pipe POS 6'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempAbsPipe6(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempAbsPipe6(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('14 - Pipe POS 6.PNG'),'-dpng');
    savefig(strcat('14 - Pipe POS 6.fig'));
    close(fig);

% Floor 2
tempAbsFloor2(:,1) = time(:,1);
tempAbsFloor2(:,2) = ( detrend(markers(:,42,1)) + detrend(markers(:,43,1)) + detrend(markers(:,44,1)) + detrend(markers(:,45,1)) + detrend(markers(:,46,1)) + detrend(markers(:,47,1)) ) / 6 + ( coordsAtRest(42,1) + coordsAtRest(43,1) + coordsAtRest(44,1) + coordsAtRest(45,1) + coordsAtRest(46,1) + coordsAtRest(47,1)) / 6; % X
tempAbsFloor2(:,3) = ( detrend(markers(:,42,2)) + detrend(markers(:,43,2)) + detrend(markers(:,44,2)) + detrend(markers(:,45,2)) + detrend(markers(:,46,2)) + detrend(markers(:,47,2)) ) / 6 + ( coordsAtRest(42,2) + coordsAtRest(43,2) + coordsAtRest(44,2) + coordsAtRest(45,2) + coordsAtRest(46,2) + coordsAtRest(47,2)) / 6; % Y
tempAbsFloor2(:,4) = ( detrend(markers(:,42,3)) + detrend(markers(:,43,3)) + detrend(markers(:,44,3)) + detrend(markers(:,45,3)) + detrend(markers(:,46,3)) + detrend(markers(:,47,3)) ) / 6 + ( coordsAtRest(42,3) + coordsAtRest(43,3) + coordsAtRest(44,3) + coordsAtRest(45,3) + coordsAtRest(46,3) + coordsAtRest(47,3)) / 6; % Z
fileAbsFloor2 = ['15 - Floor 2.mat'];
save(fileAbsFloor2, 'tempAbsFloor2', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempAbsFloor2(:,2));
    title(['15 - Floor 2'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempAbsFloor2(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempAbsFloor2(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('15 - Floor 2.PNG'),'-dpng');
    savefig(strcat('15 - Floor 2.fig'));
    close(fig);

% SDOF21
tempAbsSDOF21(:,1) = time(:,1);
tempAbsSDOF21(:,2) = detrend(markers(:,48,1)) + coordsAtRest(48,1); % X
tempAbsSDOF21(:,3) = detrend(markers(:,48,2)) + coordsAtRest(48,2); % Y
tempAbsSDOF21(:,4) = detrend(markers(:,48,3)) + coordsAtRest(48,3); % Z
fileAbsSDOF21 = ['16 - SDOF21.mat'];
save(fileAbsSDOF21, 'tempAbsSDOF21', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempAbsSDOF21(:,2));
    title(['16 - SDOF21'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempAbsSDOF21(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempAbsSDOF21(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('16 - SDOF21.PNG'),'-dpng');
    savefig(strcat('16 - SDOF21.fig'));
    close(fig);

% Tank 3
tempAbsTank3(:,1) = time(:,1);
tempAbsTank3(:,2) = ( detrend(markers(:,50,1)) + detrend(markers(:,51,1)) ) / 2 + ( coordsAtRest(50,1) + coordsAtRest(51,1) ) / 2; % X
tempAbsTank3(:,3) = ( detrend(markers(:,50,2)) + detrend(markers(:,51,2)) ) / 2 + ( coordsAtRest(50,2) + coordsAtRest(51,2) ) / 2; % Y
tempAbsTank3(:,4) = ( detrend(markers(:,50,3)) + detrend(markers(:,51,3)) ) / 2 + ( coordsAtRest(50,3) + coordsAtRest(51,3) ) / 2; % Z
fileAbsTank3 = ['17 - Tank 3.mat'];
save(fileAbsTank3, 'tempAbsTank3', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempAbsTank3(:,2));
    title(['17 - Tank 3'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempAbsTank3(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempAbsTank3(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('17 - Tank 3.PNG'),'-dpng');
    savefig(strcat('17 - Tank 3.fig'));
    close(fig);

% Tank 4
tempAbsTank4(:,1) = time(:,1);
tempAbsTank4(:,2) = ( detrend(markers(:,49,1)) + detrend(markers(:,53,1)) + detrend(markers(:,54,1)) ) / 3 + ( coordsAtRest(49,1) + coordsAtRest(53,1) + coordsAtRest(54,1)) / 3; % X
tempAbsTank4(:,3) = ( detrend(markers(:,49,2)) + detrend(markers(:,53,2)) + detrend(markers(:,54,2)) ) / 3 + ( coordsAtRest(49,2) + coordsAtRest(53,2) + coordsAtRest(54,2)) / 3; % Y
tempAbsTank4(:,4) = ( detrend(markers(:,49,3)) + detrend(markers(:,53,3)) + detrend(markers(:,54,3)) ) / 3 + ( coordsAtRest(49,3) + coordsAtRest(53,3) + coordsAtRest(54,3)) / 3; % Z
fileAbsTank4 = ['18 - Tank 4.mat'];
save(fileAbsTank4, 'tempAbsTank4', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempAbsTank4(:,2));
    title(['18 - Tank 4'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempAbsTank4(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempAbsTank4(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('18 - Tank 4.PNG'),'-dpng');
    savefig(strcat('18 - Tank 4.fig'));
    close(fig);

% Pipe POS 7
tempAbsPipe7(:,1) = time(:,1);
tempAbsPipe7(:,2) = detrend(markers(:,52,1)) + coordsAtRest(52,1); % X
tempAbsPipe7(:,3) = detrend(markers(:,52,2)) + coordsAtRest(52,2); % Y
tempAbsPipe7(:,4) = detrend(markers(:,52,3)) + coordsAtRest(52,3); % Z
fileAbsPipe7 = ['19 - Pipe POS 7.mat'];
save(fileAbsPipe7, 'tempAbsPipe7', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempAbsPipe7(:,2));
    title(['19 - Pipe POS 7'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempAbsPipe7(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempAbsPipe7(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('19 - Pipe POS 7.PNG'),'-dpng');
    savefig(strcat('19 - Pipe POS 7.fig'));
    close(fig);

% Pipe POS 10
tempAbsPipe10(:,1) = time(:,1);
tempAbsPipe10(:,2) = ( detrend(markers(:,55,1)) + detrend(markers(:,56,1)) ) / 2 + ( coordsAtRest(55,1) + coordsAtRest(56,1) ) / 2; % X
tempAbsPipe10(:,3) = ( detrend(markers(:,55,2)) + detrend(markers(:,56,2)) ) / 2 + ( coordsAtRest(55,2) + coordsAtRest(56,2) ) / 2; % Y
tempAbsPipe10(:,4) = ( detrend(markers(:,55,3)) + detrend(markers(:,56,3)) ) / 2 + ( coordsAtRest(55,3) + coordsAtRest(56,3) ) / 2; % Z
fileAbsPipe10 = ['20 - Pipe POS 10.mat'];
save(fileAbsPipe10, 'tempAbsPipe10', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempAbsPipe10(:,2));
    title(['20 - Pipe POS 10'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempAbsPipe10(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempAbsPipe10(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('20 - Pipe POS 10.PNG'),'-dpng');
    savefig(strcat('20 - Pipe POS 10.fig'));
    close(fig);

% Pipe POS 9
tempAbsPipe9(:,1) = time(:,1);
tempAbsPipe9(:,2) = ( detrend(markers(:,57,1)) + detrend(markers(:,58,1)) + detrend(markers(:,59,1)) + detrend(markers(:,60,1)) ) / 4 + ( coordsAtRest(57,1) + coordsAtRest(58,1) + coordsAtRest(59,1) + coordsAtRest(60,1)) / 4; % X
tempAbsPipe9(:,3) = ( detrend(markers(:,57,2)) + detrend(markers(:,58,2)) + detrend(markers(:,59,2)) + detrend(markers(:,60,2)) ) / 4 + ( coordsAtRest(57,2) + coordsAtRest(58,2) + coordsAtRest(59,2) + coordsAtRest(60,2)) / 4; % Y
tempAbsPipe9(:,4) = ( detrend(markers(:,57,3)) + detrend(markers(:,58,3)) + detrend(markers(:,59,3)) + detrend(markers(:,60,3)) ) / 4 + ( coordsAtRest(57,3) + coordsAtRest(58,3) + coordsAtRest(59,3) + coordsAtRest(60,3)) / 4; % Z
fileAbsPipe9 = ['21 - Pipe POS 9.mat'];
save(fileAbsPipe9, 'tempAbsPipe9', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempAbsPipe9(:,2));
    title(['21 - Pipe POS 9'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempAbsPipe9(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempAbsPipe9(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('21 - Pipe POS 9.PNG'),'-dpng');
    savefig(strcat('21 - Pipe POS 9.fig'));
    close(fig);

% Floor 3
tempAbsFloor3(:,1) = time(:,1);
tempAbsFloor3(:,2) = ( detrend(markers(:,61,1)) + detrend(markers(:,62,1)) + detrend(markers(:,63,1)) + detrend(markers(:,64,1)) + detrend(markers(:,65,1)) + detrend(markers(:,66,1)) ) / 6 + ( coordsAtRest(61,1) + coordsAtRest(62,1) + coordsAtRest(63,1) + coordsAtRest(64,1) + coordsAtRest(65,1) + coordsAtRest(66,1)) / 6; % X
tempAbsFloor3(:,3) = ( detrend(markers(:,61,2)) + detrend(markers(:,62,2)) + detrend(markers(:,63,2)) + detrend(markers(:,64,2)) + detrend(markers(:,65,2)) + detrend(markers(:,66,2)) ) / 6 + ( coordsAtRest(61,2) + coordsAtRest(62,2) + coordsAtRest(63,2) + coordsAtRest(64,2) + coordsAtRest(65,2) + coordsAtRest(66,2)) / 6; % Y
tempAbsFloor3(:,4) = ( detrend(markers(:,61,3)) + detrend(markers(:,62,3)) + detrend(markers(:,63,3)) + detrend(markers(:,64,3)) + detrend(markers(:,65,3)) + detrend(markers(:,66,3)) ) / 6 + ( coordsAtRest(61,3) + coordsAtRest(62,3) + coordsAtRest(63,3) + coordsAtRest(64,3) + coordsAtRest(65,3) + coordsAtRest(66,3)) / 6; % Z
fileAbsFloor3 = ['22 - Floor 3.mat'];
save(fileAbsFloor3, 'tempAbsFloor3', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempAbsFloor3(:,2));
    title(['22 - Floor 3'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempAbsFloor3(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempAbsFloor3(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('22 - Floor 3.PNG'),'-dpng');
    savefig(strcat('22 - Floor 3.fig'));
    close(fig);

% SDOF32
tempAbsSDOF32(:,1) = time(:,1);
tempAbsSDOF32(:,2) = detrend(markers(:,67,1)) + coordsAtRest(67,1); % X
tempAbsSDOF32(:,3) = detrend(markers(:,67,2)) + coordsAtRest(67,2); % Y
tempAbsSDOF32(:,4) = detrend(markers(:,67,3)) + coordsAtRest(67,3); % Z
fileAbsSDOF32 = ['23 - SDOF32.mat'];
save(fileAbsSDOF32, 'tempAbsSDOF32', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempAbsSDOF32(:,2));
    title(['23 - SDOF32'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempAbsSDOF32(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempAbsSDOF32(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('23 - SDOF32.PNG'),'-dpng');
    savefig(strcat('23 - SDOF32.fig'));
    close(fig);

% DN80 rack N
tempAbsDN80RackN(:,1) = time(:,1);
tempAbsDN80RackN(:,2) = ( detrend(markers(:,68,1)) + detrend(markers(:,69,1)) + detrend(markers(:,70,1)) + detrend(markers(:,71,1)) ) / 4 + ( coordsAtRest(68,1) + coordsAtRest(69,1) + coordsAtRest(70,1) + coordsAtRest(71,1)) / 4; % X
tempAbsDN80RackN(:,3) = ( detrend(markers(:,68,2)) + detrend(markers(:,69,2)) + detrend(markers(:,70,2)) + detrend(markers(:,71,2)) ) / 4 + ( coordsAtRest(68,2) + coordsAtRest(69,2) + coordsAtRest(70,2) + coordsAtRest(71,2)) / 4; % Y
tempAbsDN80RackN(:,4) = ( detrend(markers(:,68,3)) + detrend(markers(:,69,3)) + detrend(markers(:,70,3)) + detrend(markers(:,71,3)) ) / 4 + ( coordsAtRest(68,3) + coordsAtRest(69,3) + coordsAtRest(70,3) + coordsAtRest(71,3)) / 4; % Z
fileAbsDN80RackN = ['24 - DN80 rack N.mat'];
save(fileAbsDN80RackN, 'tempAbsDN80RackN', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempAbsDN80RackN(:,2));
    title(['24 - DN80 rack N'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempAbsDN80RackN(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempAbsDN80RackN(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('24 - DN80 rack N.PNG'),'-dpng');
    savefig(strcat('24 - DN80 rack N.fig'));
    close(fig);

% Rack N
tempAbsRackN(:,1) = time(:,1);
tempAbsRackN(:,2) = detrend(markers(:,72,1)) + coordsAtRest(72,1); % X
tempAbsRackN(:,3) = detrend(markers(:,72,2)) + coordsAtRest(72,2); % Y
tempAbsRackN(:,4) = detrend(markers(:,72,3)) + coordsAtRest(72,3); % Z
fileAbsRackN = ['25 - Rack N.mat'];
save(fileAbsRackN, 'tempAbsRackN', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempAbsRackN(:,2));
    title(['25 - Rack N'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempAbsRackN(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempAbsRackN(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('25 - Rack N.PNG'),'-dpng');
    savefig(strcat('25 - Rack N.fig'));
    close(fig);

% DN80 rack E
tempAbsDN80RackE(:,1) = time(:,1);
tempAbsDN80RackE(:,2) = ( detrend(markers(:,73,1)) + detrend(markers(:,74,1)) + detrend(markers(:,75,1)) + detrend(markers(:,76,1)) ) / 4 + ( coordsAtRest(73,1) + coordsAtRest(74,1) + coordsAtRest(75,1) + coordsAtRest(76,1)) / 4; % X
tempAbsDN80RackE(:,3) = ( detrend(markers(:,73,2)) + detrend(markers(:,74,2)) + detrend(markers(:,75,2)) + detrend(markers(:,76,2)) ) / 4 + ( coordsAtRest(73,2) + coordsAtRest(74,2) + coordsAtRest(75,2) + coordsAtRest(76,2)) / 4; % Y
tempAbsDN80RackE(:,4) = ( detrend(markers(:,73,3)) + detrend(markers(:,74,3)) + detrend(markers(:,75,3)) + detrend(markers(:,76,3)) ) / 4 + ( coordsAtRest(73,3) + coordsAtRest(74,3) + coordsAtRest(75,3) + coordsAtRest(76,3)) / 4; % Z
fileAbsDN80RackE = ['26 - DN80 rack E.mat'];
save(fileAbsDN80RackE, 'tempAbsDN80RackE', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempAbsDN80RackE(:,2));
    title(['26 - DN80 rack E'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempAbsDN80RackE(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempAbsDN80RackE(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('26 - DN80 rack E.PNG'),'-dpng');
    savefig(strcat('26 - DN80 rack E.fig'));
    close(fig);

% Rack E
tempAbsRackE(:,1) = time(:,1);
tempAbsRackE(:,2) = detrend(markers(:,77,1)) + coordsAtRest(77,1); % X
tempAbsRackE(:,3) = detrend(markers(:,77,2)) + coordsAtRest(77,2); % Y
tempAbsRackE(:,4) = detrend(markers(:,77,3)) + coordsAtRest(77,3); % Z
fileAbsRackE = ['27 - Rack E.mat'];
save(fileAbsRackE, 'tempAbsRackE', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempAbsRackE(:,2));
    title(['27 - Rack E'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempAbsRackE(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempAbsRackE(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('27 - Rack E.PNG'),'-dpng');
    savefig(strcat('27 - Rack E.fig'));
    close(fig);

% Cabinet
tempAbsCabinet(:,1) = time(:,1);
tempAbsCabinet(:,2) = detrend(markers(:,78,1)) + coordsAtRest(78,1); % X
tempAbsCabinet(:,3) = detrend(markers(:,78,2)) + coordsAtRest(78,2); % Y
tempAbsCabinet(:,4) = detrend(markers(:,78,3)) + coordsAtRest(78,3); % Z
fileAbsCabinet = ['28 - Cabinet.mat'];
save(fileAbsCabinet, 'tempAbsCabinet', '-ASCII');
    fig = figure();
    dim = get(fig, 'Position');
    set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    % X
    subplot(3,1,1),hold on, grid on
    plot(time,tempAbsCabinet(:,2));
    title(['28 - Cabinet'])
    ylabel('X [mm]')
    xlabel('Time [s]')
    % Y
    subplot(3,1,2),hold on, grid on
    plot(time,tempAbsCabinet(:,3));
    ylabel('Y [mm]')
    xlabel('Time [s]')
    % Z
    subplot(3,1,3),hold on, grid on
    plot(time,tempAbsCabinet(:,4));
    ylabel('Z [mm]')
    xlabel('Time [s]')
    % plot
    print(fig,strcat('28 - Cabinet.PNG'),'-dpng');
    savefig(strcat('28 - Cabinet.fig'));
    close(fig);
    
cd(dataIndex);