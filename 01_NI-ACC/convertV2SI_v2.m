clear all
close all
clc

%wipe
plotFlag = 1;       % =1 to plot all channels converted  (row 131)

% transfFactors = 'C:\Users\Samuele\Desktop\01_NON_ISOLATED\instrum_NI.txt';
dataIndex = 'C:\Users\Samuele\Desktop\01_NI_ACC\';      % folder with test txt
cd(dataIndex);

%% .txt FILES
listOfFiles(1,1) = {'03_ACC_8_EC_T1_C_25%_compA'};
listOfFiles(2,1) = {'03_ACC_8_EC_T1_C_25%_compB'};
listOfFiles(3,1) = {'03_ACC_8_EC_T1_C_25%_compC'};
listOfFiles(4,1) = {'03_ACC_8_EC_T1_C_25%_compD'};
listOfFiles(5,1) = {'04_ACC_8_EC_T1_C_37%'};
listOfFiles(6,1) = {'05_ACC_8_EC_T1_C_50%'};
listOfFiles(7,1) = {'06_ACC_8_EC_T1_C_37%_compA'};
listOfFiles(8,1) = {'06_ACC_8_EC_T1_C_37%_compB'};
listOfFiles(9,1) = {'06_ACC_8_EC_T1_C_37%_compC'};
listOfFiles(10,1) = {'07_ACC_8_EC_T1_C_70%'};
listOfFiles(11,1) = {'08_ACC_8_EC_T1_C_37%_compA'};
listOfFiles(12,1) = {'08_ACC_8_EC_T1_C_37%_compB'};
listOfFiles(13,1) = {'08_ACC_8_EC_T1_C_37%_compC'};
listOfFiles(14,1) = {'08_ACC_8_EC_T1_C_37%_compD'};
listOfFiles(15,1) = {'09_ACC_8_EC_T1_C_100%'};
listOfFiles(16,1) = {'10_ACC_8_EC_T1_C_111%'};

disp(['Prima di tutto apri il file removeLine.txt per vedere quali file vanno "ridotti"']);

for ii=1:length(listOfFiles)
    disp(['---']);
    transfFactors = 'C:\Users\Samuele\Desktop\01_NI_ACC\instrum_NI.txt';
    fileName = string(strcat(listOfFiles(ii,1),'.txt'));
    
    mkdir(string(listOfFiles(ii,1)));
    dataDir = string(strcat('C:\Users\Samuele\Desktop\01_NI_ACC\',listOfFiles(ii,1)));

    if ischar(transfFactors) % transformation factors from file
        cd('C:\Users\Samuele\Desktop\01_NI_ACC\')      % folder with transf. factors file
        transfFactors = importFileStrum(transfFactors, 2, inf);
        % the content of the file is imported in a cell array.
        % 1 - channel number;
        % 2 - trasformation factor;
        % 3 - conversion units
        % 4 - range
        % 5 - free description

    else
        temp = transfFactors(:);
        transfFactors = cell(size(temp,1),5);
        transfFactors{:,1} = [1:size(temp,1)]';         %%% [] to {}
        transfFactors{:,2} = temp;
        for i = 1:size(temp,1)
            transfFactors{i,5} = ['Ch.',int2str(i)];
        end
    end

    %% Load file
    cd(dataIndex);

    disp(['File name: ',fileName]);
%     NofRUN = input('Number of run: FIRST (1) NOT FIRST [] -> ');
%     if NofRUN == 1
%     removeLines(fileName, 1)      % to remove header
%     else
%     end

    datiVnf = load(fileName);
    f = 1/(datiVnf(2,1)-datiVnf(1,1));
    [datiV,desc]=fun_applfiltroCH2(2,1,[],30,f,200,datiVnf);

    if plotFlag == 1
    try cd('ckStrum');
    catch mkdir('ckStrum');
        cd('ckStrum');
    end
    else
    end

    %% Trasformazioni
    % Time
    time = datiV(:,1);
    time = time-time(1);
    datiV(:,1) = [];        % remove time column

    % find Alimentation columns
    alCol = [];
    for c = 1:size(transfFactors,1)
        if strcmp(transfFactors(c,3),'Alim.')
            alCol = [alCol, c];
        end
    end

    % divide the transducer columns in Volt with corrisponding alimentation
    for col = alCol
        datiV(datiV(:,col)==0,col) = 1e-8;  % no 0 in alimentation
        temp = find(transfFactors{col,5}==' ',1,'first');
        whichChannels = transfFactors{col,5}(temp:end);
        for ch = str2num(whichChannels)
            datiV(:,ch) = datiV(:,ch) ./ datiV(:,col);
        end
    end

    if isempty(alCol)
        alCol = numel(transfFactors(:,1))*20; % it's necessary that it is not empty, put a random number
    end

    % initialize the variable that will contain the data in eng.units
    % from datiV already removed time column
    datiG = zeros(size(datiV));

    % CREATE A NEW FOLDER TO UPLOAD IMAGES
    cd(dataDir);
    try cd('image_file');
    catch mkdir('image_file');
        cd('image_file');
    end

    for col = 1:size(datiG,2)
        %if max(alCol==col) == 0 % if it is not a alimentation column
            polarita = sign(transfFactors{col,2});
            if polarita == 0
                polarita = 1;
            end
            tf = abs(transfFactors{col,2});
            if strcmp(transfFactors{col,3},'mV/g')
                y_labelCh(col,1) = "Acceleration [m/s^2]";
                tf = 1/(tf /1e3 /9.81); % (m/s^2)/V - no [g] but [m/s^2]
                datiG(:,col) = polarita *... % change polarity (if needed)
                    tf*... % transformation factor
                    datiV(:,col); % recorded electrical output
            elseif strcmp(transfFactors{col,3},'mm/V')
                y_labelCh(col,1) = "Displacement [mm]";
                tf = tf; % if in mm/V, the transformation factor is ok
                datiG(:,col) = polarita *... % change polarity (if needed)
                    tf*... % transformation factor
                    datiV(:,col); % recorded electrical output
            elseif strcmp(transfFactors{col,3},'1/m')
                y_labelCh(col,1) = "Don't know...";
                tf = 1e3/tf; % when the sensibility of dsp transducers is in mV/mm/V --> 1/m
                datiG(:,col) = polarita *... % change polarity (if needed)
                    tf*... % transformation factor
                    datiV(:,col); % recorded electrical output
            elseif strcmp(transfFactors{col,3},'ohm')
                y_labelCh(col,1) = "Strain [-]";
                tf = tf; % strain gauges
                datiG(:,col) = polarita *... % change polarity (if needed)
                    (-4)*datiV(:,col)./(2.1*(1+2*datiV(:,col))) *(1+(tf-120)/120);
            elseif strcmp(transfFactors{col,3},'unit/V')
                y_labelCh(col,1) = " ";
                tf = tf; % Read out ST
                datiG(:,col) = polarita *... % change polarity (if needed)
                    tf*... % transformation factor
                    datiV(:,col); % recorded electrical output
            elseif strcmp(transfFactors{col,3},'null')
                y_labelCh(col,1) = " ";
                tf = tf; % channel without transformation
                datiG(:,col) = polarita *... % change polarity (if needed)
                    tf*... % transformation factor
                    datiV(:,col); % recorded electrical output
            elseif strcmp(transfFactors{col,3},'bar/V')
                y_labelCh(col,1) = "Don't know...";
                tf = tf; % pressure sensors
                datiG(:,col) = polarita *... % change polarity (if needed)
                    tf*... % transformation factor
                    datiV(:,col)-2; % recorded electrical output
            else
                y_labelCh(col,1) = " ";
                disp(['Transformation not defined for channel ',int2str(col)]);
            end

            % to plot all channel: change plotFlag=1 (row 2)
    %         if plotFlag
    %             fg = figure(col);
    %             dim = get(fg, 'Position');
    %             set(fg,'position',[dim(1)  dim(2) dim(3)*2 dim(4)]);
    %             
    %             %find max value
    %             [datiG_max, index] = max(datiG(:,col)-mean(datiG(1:100,col)));
    %             time_max = time(index);
    %             
    %             %find min value
    %             [datiG_min, index] = min(datiG(:,col)-mean(datiG(1:100,col)));
    %             time_min = time(index);
    %             
    %             %position of points text
    %             xt_max = [datiG_max datiG_min];
    %             yt = [time_max time_min];
    %             str_points = {{'   ',num2str(datiG_max)},{'   ',num2str(datiG_min)}};
    %             
    %             subplot(2,1,[1,2]),hold on, grid on
    %             plot(time,datiG(:,col)-mean(datiG(1:100,col)));
    %             plot(time_max,datiG_max,'r*');
    %             plot(time_min,datiG_min,'r*');
    %             text([time_max time_min],[datiG_max datiG_min],str_points)
    %             title(['Channel #',num2str(transfFactors{col,1}),' - ',transfFactors{col,5}])
    %             ylabel(y_labelCh(col,1))
    %             xlabel('Time [s]')
    %             
    %             %range line
    %             if datiG_max > transfFactors{col,4}
    %                 yline(transfFactors{col,4},'-.r');
    %                 disp(['Range exceeded for channel +',int2str(transfFactors{col,1})]);
    %             end
    %             if datiG_min < -transfFactors{col,4}
    %                 yline(-transfFactors{col,4},'-.r');
    %                 disp(['Range exceeded for channel -',int2str(transfFactors{col,1})]);
    %             end
    %             
    %             %subplot(2,1,2),hold on, grid on
    %             %plot(time,datiV(:,col));
    %             %title(transfFactors{col,5})
    %             %ylabel('Electr. Output (/feeding)')
    %             
    %             %print(fg,strcat(['Channel #',num2str(transfFactors{col,1}),' - ',transfFactors{col,5}],'.PNG'),'-dpng');
    %             
    %             print(fg,strcat('Channel #',num2str(transfFactors{col,1}),'.PNG'),'-dpng');
    %             try cd('fig_file');
    %             catch mkdir('fig_file');
    %                 cd('fig_file');
    %             end
    %             savefig(strcat('Channel #',num2str(transfFactors{col,1}),'.fig'));
    %             cd ..
    %             %pause
    %             close(fg);
    %         end
        %end
    end

    cd(dataIndex);

    %% Create .mat file

    % si aggiorna ad ogni esecuzione del ciclo for
    % cd(dataDir);
    % try cd('mat_file');
    % catch mkdir('mat_file');
    %     cd('mat_file');
    % end
    % for col = 1:size(datiG,2)
    %     tempMat(:,1) = detrend(datiG(:,col)); 
    %     tempMat(:,2) = time(:,1);
    %     fileMatName = ['Channel #',num2str(transfFactors{col,1}),'.mat'];
    %     save(fileMatName, 'tempMat', '-ASCII');
    % end
    cd(dataIndex);

    %% Saving CONV files

    % if NofRUN == 1
    % cd(dataDir);
    % try cd('conv_file');
    % catch mkdir('conv_file');
    %     cd('conv_file');
    % end
    % fileName = [fileName(1:end-4),'_SI.txt'];
    % save(fileName, 'datiG', '-ASCII');
    % cd(oldDir);
    % else
    % end

    %return
    cd(dataIndex);

    %% STRAIN GAUGES

    % fun_strainGauges(datiG,time)
    cd(dataIndex);

    %% ACCELERAZIONI MEDIE AI PIANI
    [tagliMassimi] = fun_accFloor(datiG);
    matriceTagliMassimi(ii,:) = tagliMassimi;
    
    cd(dataIndex)

    %% PLOT

    % cd(dataDir);
    % try cd('plot_Test',strcat(fileName(1:end-4)));
    % catch mkdir('plot_Test',strcat(fileName(1:end-4)));
    %     cd('plot_Test')
    %     cd(strcat(fileName(1:end-4)));
    % end
    % 
    % for j=1:3
    %     
    %     if j==1
    %         fg = figure(), hold all, grid on    % 1
    %         scrsz = get(0,'ScreenSize');
    %         set(fg,'position',[0.5*(scrsz(3)-scrsz(3)*0.8) 0.5*(scrsz(4)-scrsz(4)*0.8) scrsz(3)*0.8 scrsz(4)*0.8]);
    %         group=[64:71];
    %         titolo = 'Dsp base columns';
    %         title(titolo)
    %         legenda=cell(size(group));
    %         for i = 1:numel(group)
    %             gcf; hold all, grid on
    %             offset = mean(datiG(1:100,group(i)));
    %             linea(i) = plot(time, datiG(:,group(i))-offset);
    %             legenda{i} = ['Ch.',int2str(group(i)),' - ',transfFactors{group(i),5}];
    %             legend(linea([1:i]),legenda{[1:i]}, 'Location', 'EastOutside')
    %         end
    %         xlabel('Time [s]')
    %         ylabel('Dsp [mm]');
    %         print(fg,strcat('1-',titolo,'.jpg'),'-djpeg');
    %         savefig(strcat('1-',titolo,'.fig'));
    %         
    %     elseif j==2
    %         fg = figure(), hold all, grid on    % 2
    %         scrsz = get(0,'ScreenSize');
    %         set(fg,'position',[0.5*(scrsz(3)-scrsz(3)*0.8) 0.5*(scrsz(4)-scrsz(4)*0.8) scrsz(3)*0.8 scrsz(4)*0.8]);
    %         group=[107:110];
    %         titolo = 'Force Uplift bars';
    %         title(titolo)
    %         legenda=cell(size(group));
    %         for i = 1:numel(group)
    %             gcf; hold all, grid on
    %             offset = mean(datiG(1:100,group(i)));
    %             linea(i) = plot(time, (datiG(:,group(i))-offset)*205000*520/1000);
    %             range = 100;
    %             limit = range+zeros(length(time),1);
    %             plot(time, limit,'r','linewidth',2)
    %             plot(time, -limit,'r','linewidth',2)
    %             legenda{i} = ['Ch.',int2str(group(i)),' - ',transfFactors{group(i),5}];
    %             legend(linea([1:i]),legenda{[1:i]}, 'Location', 'EastOutside')
    %         end
    %         xlabel('Time [s]')
    %         ylabel('F [kN]');
    %         print(fg,strcat('2-',titolo,'.jpg'),'-djpeg');
    %         savefig(strcat('2-',titolo,'.fig'));
    %         
    %     else
    %         fg = figure(), hold all, grid on    % 3
    %         scrsz = get(0,'ScreenSize');
    %         set(fg,'position',[0.5*(scrsz(3)-scrsz(3)*0.8) 0.5*(scrsz(4)-scrsz(4)*0.8) scrsz(3)*0.8 scrsz(4)*0.8]);
    %         group=[99:106];
    %         titolo = 'Stress base columns';
    %         title(titolo)
    %         legenda=cell(size(group));
    %         for i = 1:numel(group)
    %             gcf; hold all, grid on
    %             offset = mean(datiG(1:100,group(i)));
    %             linea(i) = plot(time, (datiG(:,group(i))-offset)*205000);
    %             range = 250;
    %             limit = range+zeros(length(time),1);
    %             plot(time, limit,'r','linewidth',2)
    %             plot(time, -limit,'r','linewidth',2)
    %             legenda{i} = ['Ch.',int2str(group(i)),' - ',transfFactors{group(i),5}];
    %             legend(linea([1:i]),legenda{[1:i]}, 'Location', 'EastOutside')
    %         end
    %         xlabel('Time [s]')
    %         ylim([-range-50 range+50])
    %         ylabel('Stress [MPa]');
    %         print(fg,strcat('3-',titolo,'.jpg'),'-djpeg');
    %         savefig(strcat('3-',titolo,'.fig'));
    %         
    %     end
    % end
    % 
    % for gg = 1:7
    %     fg = figure(), hold all, grid on
    %     scrsz = get(0,'ScreenSize');
    %     set(fg,'position',[0.5*(scrsz(3)-scrsz(3)*0.8) 0.5*(scrsz(4)-scrsz(4)*0.8) scrsz(3)*0.8 scrsz(4)*0.8]);
    %     switch gg
    %         case 1,                 % 4
    %             group1=[1,2,4];
    %             titolo1 = 'Acc. ST-RC slab - X';
    %             group2=[3,5];
    %             titolo2 = 'Acc. ST-RC slab - Y';
    %             titolo = '4-Acc. ST-RC slab';
    %             ylab = ['Acc [m/s^2]'];
    %         case 2,                 % 5
    %             group1=[7,23,34];
    %             titolo1 = 'Acc. Frame col.SE - X';
    %             group2=[8,24,35];
    %             titolo2 = 'Acc. Frame col.SE - Y';
    %             ylab = ['Acc [m/s^2]'];
    %             titolo = '5-Acc. Frame col.SE';
    %         case 3,                 % 6
    %             group1=[9,25,55];
    %             titolo1 = 'Acc. Frame col.NE - X';
    %             group2=[10,26,37];
    %             titolo2 = 'Acc. Frame col.NE - Y';
    %             ylab = ['Acc [m/s^2]'];
    %             titolo = '6-Acc. Frame col.NE';
    %         case 4,                 % 7
    %             group1=[11,27,38];
    %             titolo1 = 'Acc. Frame col.NW - X';
    %             group2=[12,28,39];
    %             titolo2 = 'Acc. Frame col.NW - Y';
    %             ylab = ['Acc [m/s^2]'];
    %             titolo = '7-Acc. Frame col.NW';
    %         case 5,                 % 8
    %             group1=[29,27];
    %             titolo1 = 'Acc. Tank 3 - X';
    %             group2=[30,28];
    %             titolo2 = 'Acc. Tank 3 - Y';
    %             ylab = ['Acc [m/s^2]'];
    %             titolo = '8-Acc. Tank 3';
    %         case 6,                 % 9
    %             group1=[31,23];
    %             titolo1 = 'Acc. Tank 4 - X';
    %             group2=[32,24];
    %             titolo2 = 'Acc. Tank 4 - Y';
    %             ylab = ['Acc [m/s^2]'];
    %             titolo = '9-Acc. Tank 4';
    %         case 7,                 % 10
    %             group1=[58,59,60,61];
    %             titolo1 = 'DSP RC slab - XY';
    %             group2=[62,63];
    %             titolo2 = 'DSP RC slab - Z';
    %             ylab = ['Dsp. [mm]'];
    %             titolo = '10-DSP RC slab';
    %     end
    %     subplot(2,1,1)
    %     legenda1=cell(size(group1));
    %     title(titolo1)
    %     xlabel('Time [s]')
    %     ylabel(num2str(ylab(1:end)))
    %     for i = 1:numel(group1)
    %         gcf; hold all, grid on
    %         offset = mean(datiG(1:100,group1(i)));
    %         linea1(i) = plot(time, datiG(:,group1(i))-offset);
    %         legenda1{i} = ['Ch.',int2str(group1(i)),' - ',transfFactors{group1(i),5}];
    %         legend(linea1([1:i]),legenda1{[1:i]}, 'Location', 'EastOutside')
    %     end
    %     
    %     subplot(2,1,2)
    %     legenda2=cell(size(group2));
    %     title(titolo2)
    %     xlabel('Time [s]')
    %     ylabel(num2str(ylab(1:end)))
    %     for i = 1:numel(group2)
    %         gcf; hold all, grid on
    %         offset = mean(datiG(1:100,group2(i)));
    %         linea2(i) = plot(time, datiG(:,group2(i))-offset);
    %         legenda2{i} = ['Ch.',int2str(group2(i)),' - ',transfFactors{group2(i),5}];
    %         legend(linea2([1:i]),legenda2{[1:i]}, 'Location', 'EastOutside')
    %     end
    %     
    %     print(gg,strcat(titolo,'.jpg'),'-djpeg');
    %      savefig(strcat(titolo,'.fig'));
    % end
    % 
    % 
    % fg = figure(), hold all, grid on    % 11
    % scrsz = get(0,'ScreenSize');
    % set(fg,'position',[0.5*(scrsz(3)-scrsz(3)*0.8) 0.5*(scrsz(4)-scrsz(4)*0.8) scrsz(3)*0.8 scrsz(4)*0.8]);
    % group1=[78:80];
    % group2=[81:83];
    % group3=[84:86];
    % group4=[87:89];
    % titolo = '11-Transducers flanges pipes';
    % title(titolo)
    % 
    % subplot(2,2,1)
    % legenda1=cell(size(group1));
    % for i = 1:numel(group1)
    %     gcf; hold all, grid on
    %     offset = mean(datiG(1:100,group1(i)));
    %     linea1(i) = plot(time, datiG(:,group1(i))-offset);
    %     legenda1{i} = ['Ch.',int2str(group1(i)),' - ',transfFactors{group1(i),5}];
    %     legend(linea1([1:i]),legenda1{[1:i]}, 'Location', 'NorthOutside')
    % end
    % xlabel('Time [s]')
    % ylabel('Dsp [mm]');
    % 
    % subplot(2,2,2)
    % legenda2=cell(size(group2));
    % for i = 1:numel(group2)
    %     gcf; hold all, grid on
    %     offset = mean(datiG(1:100,group2(i)));
    %     linea2(i) = plot(time, datiG(:,group2(i))-offset);
    %     legenda2{i} = ['Ch.',int2str(group2(i)),' - ',transfFactors{group2(i),5}];
    %     legend(linea2([1:i]),legenda2{[1:i]}, 'Location', 'NorthOutside')
    % end
    % xlabel('Time [s]')
    % ylabel('Dsp [mm]');
    % 
    % subplot(2,2,3)
    % legenda2=cell(size(group3));
    % for i = 1:numel(group3)
    %     gcf; hold all, grid on
    %     offset = mean(datiG(1:100,group3(i)));
    %     linea3(i) = plot(time, datiG(:,group3(i))-offset);
    %     legenda3{i} = ['Ch.',int2str(group3(i)),' - ',transfFactors{group3(i),5}];
    %     legend(linea3([1:i]),legenda3{[1:i]}, 'Location', 'NorthOutside')
    % end
    % xlabel('Time [s]')
    % ylabel('Dsp [mm]');
    % 
    % subplot(2,2,4)
    % legenda2=cell(size(group4));
    % for i = 1:numel(group4)
    %     gcf; hold all, grid on
    %     offset = mean(datiG(1:100,group4(i)));
    %     linea4(i) = plot(time, datiG(:,group4(i))-offset);
    %     legenda4{i} = ['Ch.',int2str(group4(i)),' - ',transfFactors{group4(i),5}];
    %     legend(linea4([1:i]),legenda4{[1:i]}, 'Location', 'NorthOutside')
    % end
    % xlabel('Time [s]')
    % ylabel('Dsp [mm]');
    % print(fg,strcat(titolo,'.jpg'),'-djpeg');
    % savefig(strcat(titolo,'.fig'));
    % 
    % 
    % for g = 1:5
    %     fg = figure(), hold all, grid on
    %     scrsz = get(0,'ScreenSize');
    %     set(fg,'position',[0.5*(scrsz(3)-scrsz(3)*0.8) 0.5*(scrsz(4)-scrsz(4)*0.8) scrsz(3)*0.8 scrsz(4)*0.8]);
    %     switch g
    %         case 1,                 % 12
    %             group1=[15,13];
    %             titolo1 = 'Acc. Tank 1 - X';
    %             group2=[16];
    %             titolo2 = 'Acc. Tank 1 - Y';
    %             group3=[14];
    %             titolo3 = 'Acc. L-profile base Tank1 - Z';
    %             titolo = '12-Acc. Tank 1';
    %             ylab = ['Acc [m/s^2]'];
    %         case 2,                 % 13
    %             group1=[20,18];
    %             titolo1 = 'Acc. Tank 2 - X';
    %             group2=[21];
    %             titolo2 = 'Acc. Tank 2 - Y';
    %             group3=[19];
    %             titolo3 = 'Acc. L-profile base Tank2 - Z';
    %             titolo = '13-Acc. Tank 2';
    %             ylab = ['Acc [m/s^2]'];
    %         case 3,                 % 14
    %             group1=[54,41,42];
    %             titolo1 = 'Acc. DN80 in Xdir and Rack E - X';
    %             group2=[43];
    %             titolo2 = 'Acc. DN80 in Xdir - Y';
    %             group3=[44];
    %             titolo3 = 'Acc. DN80 in Xdir - Z';
    %             titolo = '14-Acc. Pipe 3rd floor in Xdir';
    %             ylab = ['Acc [m/s^2]'];
    %         case 4,                 % 15
    %             group1=[45,48,51];
    %             titolo1 = 'Acc. DN80 in Ydir and RackN - X';
    %             group2=[46,49,52];
    %             titolo2 = 'Acc. DN80 in Ydir and RackN - Y';
    %             group3=[47,50,53];
    %             titolo3 = 'Acc. DN80 in Ydir and RackN- Z';
    %             titolo = '15-Acc. Pipe 3rd floor  in Ydir';
    %             ylab = ['Acc [m/s^2]'];
    %         case 5,                 % 16
    %             group1=[74,75];
    %             titolo1 = 'Dsp. DN80-collar - X';
    %             group2=[76];
    %             titolo2 = 'Dsp. collar-rackN - Y';
    %             group3=[77];
    %             titolo3 = 'Rel.Dsp. rackN - XZ';
    %             titolo = '16-Dsp. Pipe 3rd floor';
    %             ylab = ['Dsp [mm]'];
    %     end
    %     
    %     subplot(3,1,1)
    %     legenda1=cell(size(group1));
    %     title(titolo1)
    %     xlabel('Time [s]')
    %     ylabel(num2str(ylab(1:end)))
    %     for i = 1:numel(group1)
    %         gcf; hold all, grid on
    %         offset = mean(datiG(1:100,group1(i)));
    %         linea1(i) = plot(time, datiG(:,group1(i))-offset);
    %         legenda1{i} = ['Ch.',int2str(group1(i)),' - ',transfFactors{group1(i),5}];
    %         legend(linea1([1:i]),legenda1{[1:i]}, 'Location', 'EastOutside')
    %     end
    %     
    %     subplot(3,1,2)
    %     legenda2=cell(size(group2));
    %     title(titolo2)
    %     xlabel('Time [s]')
    %     ylabel(num2str(ylab(1:end)))
    %     for i = 1:numel(group2)
    %         gcf; hold all, grid on
    %         offset = mean(datiG(1:100,group2(i)));
    %         linea2(i) = plot(time, datiG(:,group2(i))-offset);
    %         legenda2{i} = ['Ch.',int2str(group2(i)),' - ',transfFactors{group2(i),5}];
    %         legend(linea2([1:i]),legenda2{[1:i]}, 'Location', 'EastOutside')
    %     end
    %     
    %     subplot(3,1,3)
    %     legenda3=cell(size(group3));
    %     title(titolo3)
    %     xlabel('Time [s]')
    %     ylabel(num2str(ylab(1:end)))
    %     for i = 1:numel(group3)
    %         gcf; hold all, grid on
    %         offset = mean(datiG(1:100,group3(i)));
    %         linea3(i) = plot(time, datiG(:,group3(i))-offset);
    %         legenda3{i} = ['Ch.',int2str(group3(i)),' - ',transfFactors{group3(i),5}];
    %         legend(linea3([1:i]),legenda3{[1:i]}, 'Location', 'EastOutside')
    %     end
    %     
    %     print(g,strcat(titolo,'.jpg'),'-djpeg');
    %     savefig(strcat(titolo,'.fig'));
    % end
    % 
    % %% Useful calculations
    % 
    % ConfigTest = input('Configuration Test: ISO (1) NI (2) -> ');
    % if ConfigTest ==2
    %     mANG = 3.74;    % ton
    % else
    %     mANG = 0;    % ton
    % end
    % mediaRC = (datiG(:,2) + datiG(:,4)) ./2;
    % mST = 42;   % ton
    % mRC = 23;   % ton
    % mPlates = 0.95; % ton
    % F_RO = datiG(:,90)-mean(datiG(1:100,90));
    % F_RC = (mRC+mPlates) * (mediaRC-mean(mediaRC(1:100)));
    % F_ST = (mST+mANG) * (datiG(:,1)-mean(datiG(1:100,1)));
    % Vbase = F_RO - F_ST - F_RC;
    % VbaseLIM = [max(Vbase) min(Vbase)];
    % save('VbaseLim.mat','VbaseLIM')
    % % save('VbaseLim.txt', 'VbaseLIM', '-ASCII');
    % 
    % fg = figure(), hold all, grid on                 % 17
    % scrsz = get(0,'ScreenSize');
    % set(fg,'position',[0.5*(scrsz(3)-scrsz(3)*0.8) 0.5*(scrsz(4)-scrsz(4)*0.8) scrsz(3)*0.8 scrsz(4)*0.8]);
    % plot(time, Vbase)
    % titolo = 'BaseShear';
    % title(titolo)
    % xlabel('Time [s]')
    % ylabel('V [kN]');
    % savefig(strcat('17-',fileName(1:end-4),'-',titolo,'.fig'));
    % 
    % % Save min and max values for each channel
    % 
    % ChLim = zeros(2,c);
    % for w = 1:c
    %     ChLim(1,w) = max(datiG(:,w)-mean(datiG(1:100,w)));
    %     ChLim(2,w) = min(datiG(:,w)-mean(datiG(1:100,w)));
    % end
    % 
    % for ww = 1:length(alCol)    
    %     ChLim(1,alCol(ww)) = mean(datiV(:,alCol(ww)));
    %     ChLim(2,alCol(ww)) = 0;
    % end
    % 
    % save('ChLim.mat','ChLim')
    % % save('ChLim.txt', 'ChLim', '-ASCII');
    % 
    % %% Single plot
    % 
    % ChPlot = input('Channel to plot: ');
    % OffsetCh = input('Offset to apply: ');
    % 
    % if isempty(OffsetCh)
    %     OffsettToRemove = mean(datiG(1:100,ChPlot));
    % else
    %     OffsettToRemove = OffsetCh;
    % end
    % fg = figure(), hold all, grid on
    % scrsz = get(0,'ScreenSize');
    % set(fg,'position',[0.5*(scrsz(3)-scrsz(3)*0.8) 0.5*(scrsz(4)-scrsz(4)*0.8) scrsz(3)*0.8 scrsz(4)*0.8]);
    % plot(time, datiG(:,ChPlot)-OffsettToRemove)
    % titolo = ['Ch-',int2str(transfFactors{ChPlot,1})];
    % title(titolo)
    % legenda = [transfFactors{ChPlot,5}];
    % legend(legenda)
    % xlabel('Time [s]')
    % if transfFactors{ChPlot,3}=='mV/g'
    %    ylab = ('Acc [m/s^2]');
    % elseif transfFactors{ChPlot,3}=='mm/V'
    %    ylab = ('Dsp [mm]');
    % elseif transfFactors{ChPlot,3}=='ohm'
    %    ylab = ('Strain [-]');
    % end
    % ylabel(num2str(ylab))
    % 
    % 
    % % with offset of random1-1
    % % fg = figure(), hold all, grid on
    % % scrsz = get(0,'ScreenSize');
    % % set(fg,'position',[0.5*(scrsz(3)-scrsz(3)*0.8) 0.5*(scrsz(4)-scrsz(4)*0.8) scrsz(3)*0.8 scrsz(4)*0.8]);
    % % mediaRC = (datiG(:,2) + datiG(:,4)) ./2;
    % % plot(time, datiG(:,1)-24.3524)
    % % plot(time, (mediaRC-24.3982))
    % % titolo = 'Acc. ST-RC slab Xdir';
    % % title(titolo)
    % % legend(transfFactors{1,5},'mean A2-A4 Rc slab','Location', 'EastOutside')
    % % xlabel('Time [s]')
    % % ylabel('Acc [m/s^2]');
    % % print(fg,strcat(fileName(1:end-4),'-',titolo,'.jpg'),'-djpeg');
    % % savefig(strcat(fileName(1:end-4),'-',titolo,'.fig'));
    % 
    % % to compare A2 and A4 with mean
    % % fg = figure(), hold all, grid on
    % % scrsz = get(0,'ScreenSize');
    % % set(fg,'position',[0.5*(scrsz(3)-scrsz(3)*0.8) 0.5*(scrsz(4)-scrsz(4)*0.8) scrsz(3)*0.8 scrsz(4)*0.8]);
    % % mediaRC = (datiG(:,2) + datiG(:,4)) ./2;
    % % plot(time, datiG(:,2)-mean(datiG(1:100,2)))
    % % plot(time, datiG(:,4)-mean(datiG(1:100,4)))
    % % plot(time, mediaRC-mean(mediaRC(1:100)))
    % % titolo = 'Acc. RC slab compared';
    % % title(titolo)
    % % legend(transfFactors{2,5},transfFactors{4,5},'mean A2-A4','Location', 'EastOutside')
    % % xlabel('Time [s]')
    % % ylabel('Acc [m/s^2]');
    % % print(fg,strcat(fileName(1:end-4),'-',titolo,'.jpg'),'-djpeg');
    % % savefig(strcat(fileName(1:end-4),'-',titolo,'.fig'));
    % 

clearvars -except plotFlag ii matriceTagliMassimi dataIndex listOfFiles

end

cd(dataIndex);
%% CREO MATRICE TAGLI MASSIMI
matriceTMax.V32 = matriceTagliMassimi(:,1);
matriceTMax.V23 = matriceTagliMassimi(:,2);
matriceTMax.V12 = matriceTagliMassimi(:,3);
matriceTMax.V01 = matriceTagliMassimi(:,4);
matriceTMax.V30 = matriceTagliMassimi(:,5);
matriceTMax.Vs1 = matriceTagliMassimi(:,6);
matriceTMax.Vs2 = matriceTagliMassimi(:,7);
    
save('varTagliMassimi.mat','matriceTMax');
save('matriceTagliMassimi.mat','matriceTagliMassimi');