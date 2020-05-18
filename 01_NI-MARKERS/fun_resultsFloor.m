function fun_resultsFloor(markers,time,fileName,coordsAtRest,dataIndex,dataDir)
%% RESULTS FLOOR
cd(dataDir);
try cd('Results',strcat(fileName(1:end-4)));
catch mkdir('Results',strcat(fileName(1:end-4)));
    cd('Results')
    cd(strcat(fileName(1:end-4)));
end

OffsetMat = zeros(1,length(coordsAtRest));
for i=1:length(OffsetMat)
   OffsetMat(i) = mean(markers(1:100,i,1)); 
end

Floors = zeros(length(markers(:,1,1)),10);

Floors(:,1) = ((markers(:,4,1)-OffsetMat(1,4))+(markers(:,5,1)-OffsetMat(1,5))+(markers(:,6,1)-OffsetMat(1,6)))./3;
Floors(:,2) = ((markers(:,16,1)-OffsetMat(1,16))+(markers(:,17,1)-OffsetMat(1,17))+(markers(:,18,1)-OffsetMat(1,18))+...
    (markers(:,19,1)-OffsetMat(1,19))+(markers(:,20,1)-OffsetMat(1,20)))./5;
Floors(:,3) = markers(:,26,1)-OffsetMat(1,26);
Floors(:,4) = ((markers(:,42,1)-OffsetMat(1,42))+(markers(:,43,1)-OffsetMat(1,43))+(markers(:,44,1)-OffsetMat(1,44))+...
    (markers(:,45,1)-OffsetMat(1,45))+(markers(:,46,1)-OffsetMat(1,46)))./5;
Floors(:,5) = markers(:,47,1)-OffsetMat(1,47);
Floors(:,6) = ((markers(:,61,1)-OffsetMat(1,61))+(markers(:,62,1)-OffsetMat(1,62))+(markers(:,63,1)-OffsetMat(1,63))+...
    (markers(:,64,1)-OffsetMat(1,64))+(markers(:,65,1)-OffsetMat(1,65)))./5;
Floors(:,7) = markers(:,66,1)-OffsetMat(1,66);
Floors(:,8) = (Floors(:,2)+Floors(:,3))./2;
Floors(:,9) = (Floors(:,4)+Floors(:,5))./2;
Floors(:,10) = (Floors(:,6)+Floors(:,7))./2;

Tanks = zeros(length(markers(:,1,1)),4);

Tanks(:,1) = markers(:,39,1)-OffsetMat(1,39);
Tanks(:,2) = markers(:,36,1)-OffsetMat(1,36);
Tanks(:,3) = ((markers(:,50,1)-OffsetMat(1,50))+(markers(:,51,1)-OffsetMat(1,51)))./2;
Tanks(:,4) = markers(:,49,1)-OffsetMat(1,49);

%% PLOT
STdsp = ((markers(:,1,1)-OffsetMat(1,1))+(markers(:,2,1)-OffsetMat(1,2))+(markers(:,3,1)-OffsetMat(1,3)))./3;
fg = figure(), hold all, grid on
scrsz = get(0,'ScreenSize');
set(fg,'position',[0.5*(scrsz(3)-scrsz(3)*0.8) 0.5*(scrsz(4)-scrsz(4)*0.8) scrsz(3)*0.8 scrsz(4)*0.8]);
plot(time, Floors(:,1)-STdsp)
titolo = ['Relative Dsp -- RC slab-ST'];
title(titolo)
xlabel('Time [s]')
ylabel('Rel Dsp [mm]')
savefig(strcat('1-',titolo,'.fig'));
print(fg,strcat('1-',titolo,'.jpg'),'-djpeg');
close(fg);

fg = figure(), hold all, grid on
scrsz = get(0,'ScreenSize');
set(fg,'position',[0.5*(scrsz(3)-scrsz(3)*0.8) 0.5*(scrsz(4)-scrsz(4)*0.8) scrsz(3)*0.8 scrsz(4)*0.8]);
plot(time, Floors(:,1))
plot(time, Floors(:,8))
plot(time, Floors(:,9))
plot(time, Floors(:,10))
titolo = ['Absolute Dsp -- Frame and RC slab'];
title(titolo)
legend('Rc slab','Floor 1','Floor 2','Floor3')
xlabel('Time [s]')
ylabel('Abs Dsp [mm]')
savefig(strcat('2-',titolo,'.fig'));
print(fg,strcat('2-',titolo,'.jpg'),'-djpeg');
close(fg);

fg = figure(), hold all, grid on
scrsz = get(0,'ScreenSize');
set(fg,'position',[0.5*(scrsz(3)-scrsz(3)*0.8) 0.5*(scrsz(4)-scrsz(4)*0.8) scrsz(3)*0.8 scrsz(4)*0.8]);
plot(time, Floors(:,8)-Floors(:,1))
plot(time, Floors(:,9)-Floors(:,1))
plot(time, Floors(:,10)-Floors(:,1))
titolo = ['Relative Dsp -- Frame-Rc slab'];
title(titolo)
legend('Floor 1','Floor 2','Floor3')
xlabel('Time [s]')
ylabel('Rel Dsp [mm]')
savefig(strcat('3-',titolo,'.fig'));
print(fg,strcat('3-',titolo,'.jpg'),'-djpeg');
close(fg);

fg = figure(), hold all, grid on
scrsz = get(0,'ScreenSize');
set(fg,'position',[0.5*(scrsz(3)-scrsz(3)*0.8) 0.5*(scrsz(4)-scrsz(4)*0.8) scrsz(3)*0.8 scrsz(4)*0.8]);
plot(time, Floors(:,8)-Floors(:,1))
plot(time, Floors(:,9)-Floors(:,2))
plot(time, Floors(:,10)-Floors(:,4))
titolo = ['Drift Floors'];
title(titolo)
legend('Drift Floor 1','Drift Floor 2','Drift Floor3')
xlabel('Time [s]')
ylabel('Drift [mm]')
savefig(strcat('3.2-',titolo,'.fig'));
print(fg,strcat('3.2-',titolo,'.jpg'),'-djpeg');
close(fg);

maxDriftFloors = zeros(2,3);
maxDriftFloors(:,1) = [max(Floors(:,8)-Floors(:,1));min(Floors(:,8)-Floors(:,1))];
maxDriftFloors(:,2) = [max(Floors(:,9)-Floors(:,2));min(Floors(:,9)-Floors(:,2))];
maxDriftFloors(:,3) = [max(Floors(:,10)-Floors(:,4));min(Floors(:,10)-Floors(:,4))];
save('maxDriftFloors.mat','maxDriftFloors')


fg = figure(), hold all, grid on
scrsz = get(0,'ScreenSize');
set(fg,'position',[0.5*(scrsz(3)-scrsz(3)*0.8) 0.5*(scrsz(4)-scrsz(4)*0.8) scrsz(3)*0.8 scrsz(4)*0.8]);
plot(time, Tanks(:,1)-Floors(:,8))
plot(time, Tanks(:,2)-Floors(:,8))
titolo = ['Relative Dsp -- Vert.Tanks-Floor 1'];
title(titolo)
legend('Tank 1 - top','Tank 2 - top')
xlabel('Time [s]')
ylabel('Rel Dsp [mm]')
savefig(strcat('4-',titolo,'.fig'));
print(fg,strcat('4-',titolo,'.jpg'),'-djpeg');
close(fg);

fg = figure(), hold all, grid on
scrsz = get(0,'ScreenSize');
set(fg,'position',[0.5*(scrsz(3)-scrsz(3)*0.8) 0.5*(scrsz(4)-scrsz(4)*0.8) scrsz(3)*0.8 scrsz(4)*0.8]);
plot(time, Tanks(:,3)-Floors(:,9))
plot(time, Tanks(:,4)-Floors(:,9))
titolo = ['Relative Dsp -- Horiz.Tanks-Floor 2'];
title(titolo)
legend('Tank 3','Tank 4')
xlabel('Time [s]')
ylabel('Rel Dsp [mm]')
savefig(strcat('5-',titolo,'.fig'));
print(fg,strcat('5-',titolo,'.jpg'),'-djpeg');
close(fg);

%% OTHER PLOTS FOR CHECKS
% figure,hold all,grid on     % confronto platea
% plot(markers(:,4,1)-OffsetMat(1,4))
% plot(markers(:,5,1)-OffsetMat(1,5))
% plot(markers(:,6,1)-OffsetMat(1,6))
% plot(Floors(:,1),'--r')
% 
% figure,hold all,grid on     % confronto marker P1
% plot(time,markers(:,16,1)-OffsetMat(1,16))
% plot(time,markers(:,17,1)-OffsetMat(1,17))
% plot(time,markers(:,18,1)-OffsetMat(1,18))
% plot(time,markers(:,19,1)-OffsetMat(1,19))
% plot(time,markers(:,20,1)-OffsetMat(1,20))
% plot(time,markers(:,26,1)-OffsetMat(1,26),'--r')
% dim=zeros(1,5);
% legendaN=cell(size(dim));
% for k = 1:5
% legendaN{1,k} = [ListOfMarkers{k+15,2}];
% end
% legend(legendaN{1:5},ListOfMarkers{26,2})
% title('Markers Floor 1')
% xlabel('Time [s]')
% ylabel('Abs Dsp [mm]')
% 
% 
% figure,hold all,grid on     % confronto P1
% plot(markers(:,16,1)-OffsetMat(1,16))
% plot(Floors(:,2),'--r')
% plot(Floors(:,3))
% 
% figure,hold all,grid on     % confronto tank 4
% plot(markers(:,49,1)-OffsetMat(1,49))
% plot(markers(:,54,1)-OffsetMat(1,54),'--r')
% 
% fg = figure(), hold all, grid on     % confronto markers su tank 1
% scrsz = get(0,'ScreenSize');
% set(fg,'position',[0.5*(scrsz(3)-scrsz(3)*0.8) 0.5*(scrsz(4)-scrsz(4)*0.8) scrsz(3)*0.8 scrsz(4)*0.8]);
% plot(time,(markers(:,39,1)-OffsetMat(1,39))-Floors(:,8))
% plot(time,(markers(:,33,1)-OffsetMat(1,33))-Floors(:,8))
% plot(time,(markers(:,30,1)-OffsetMat(1,30))-Floors(:,8))
% legend(ListOfMarkers{39,2},ListOfMarkers{33,2},ListOfMarkers{30,2})
% title('Dsp relative -- Tank 1-P1')
% xlabel('Time [s]')
% ylabel('Rel Dsp [mm]')
% 
% fg = figure(), hold all, grid on     % confronto markers su tank 2
% scrsz = get(0,'ScreenSize');
% set(fg,'position',[0.5*(scrsz(3)-scrsz(3)*0.8) 0.5*(scrsz(4)-scrsz(4)*0.8) scrsz(3)*0.8 scrsz(4)*0.8]);
% plot(time,(markers(:,36,1)-OffsetMat(1,36))-Floors(:,9))
% plot(time,(markers(:,32,1)-OffsetMat(1,32))-Floors(:,9))
% plot(time,(markers(:,31,1)-OffsetMat(1,31))-Floors(:,9))
% legend(ListOfMarkers{36,2},ListOfMarkers{32,2},ListOfMarkers{31,2})
% title('Dsp relative -- Tank 2-P1')
% xlabel('Time [s]')
% ylabel('Rel Dsp [mm]')

cd(dataIndex);