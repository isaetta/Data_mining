function fun_markers(markers,time,ListOfMarkers,dataIndex,dataDir)
%% PLOT MARKERS
cd(dataDir);
try cd('Markers');
catch mkdir('Markers');
    cd('Markers');
end
try cd('Image');
catch mkdir('Image');
    cd('Image');
end

for col = 1:size(markers,2)
            fig = figure(col);
            dim = get(fig, 'Position');
            set(fig,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
            
            % X
            subplot(3,1,1),hold on, grid on
            plot(time,detrend(markers(:,col,1)));
            title(['Marker #',num2str(ListOfMarkers{col,1})])
            ylabel('X [mm]')
            xlabel('Time [s]')
            
            % Y
            subplot(3,1,2),hold on, grid on
            plot(time,detrend(markers(:,col,2)));
            ylabel('Y [mm]')
            xlabel('Time [s]')
            
            % Z
            subplot(3,1,3),hold on, grid on
            plot(time,detrend(markers(:,col,3)));
            ylabel('Z [mm]')
            xlabel('Time [s]')
            
            % plot
            print(fig,strcat('Markers #',num2str(ListOfMarkers{col,1}),'.PNG'),'-dpng');
            try cd('fig_file');
            catch mkdir('fig_file');
                cd('fig_file');
            end
            savefig(strcat('Markers #',num2str(ListOfMarkers{col,1}),'.fig'));
            cd ..
            %pause
            close(fig);
end

cd(dataDir);

%% .MAT FILE
cd(dataDir);
cd('Markers');
try cd('Mat');
catch mkdir('Mat');
    cd('Mat');
end
for col = 1:size(markers,2)
    tempMat(:,1) = time(:,1);
    tempMat(:,2) = detrend(markers(:,1,1));
    tempMat(:,3) = detrend(markers(:,1,2));
    tempMat(:,4) = detrend(markers(:,1,3)); 
    fileMatName = ['Markers #',num2str(ListOfMarkers{col,1}),'.mat'];
    save(fileMatName, 'tempMat', '-ASCII');
end

cd(dataIndex);