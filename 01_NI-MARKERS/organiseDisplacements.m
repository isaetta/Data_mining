function [floorDispl, videoSR] = organiseDisplacements(FileName, resultsDir, labelCoord)

plotFlag = 0;

if nargin == 0
    FileName{1} = '02_ACC_8_EC_T1_C_29%_compB.c3d';
    resultsDir = cd;
end

%% Loading coordinates of the markers (expected values)
% The number of the line is the number of the marker, i.e. the label
% This, in the final versione, will be loaded from an expternal file
if nargin < 3
    label = defaultLabelCoord();
else
    label = labelCoord;
end

%% Extracting markers displacement TH from c3d GPEM files
% Just load if already processed
try load(strcat(FileName{1}(1:end-3),'mat'))
catch
% Extracting if not already processed
[markers, videoSR] = labelAndReconstruct(FileName, resultsDir, label, plotFlag);
end

% close all
% for m = 1:size(markers,2)
%     figure(m)
%     for d = 1:3
%         subplot(3,1,d), hold all, grid on
%         plot(markers(:,m,d));
%     end
% end

%% Filteting signals
type = 2; % filter type, 1 Butterworth, 2 FIR1
band = 1; % filter band type, 1 Lowpass, 2 Bandpass, 3 Highpass
hp = 0;   % highpass frequency [Hz]
lp = 30;  % lowpass frequency [Hz]
SR_data = videoSR; % sampling rate of channels to apply the filter [Hz]
for d = 1:3
    markers(:,:,d) = fun_applfiltroCH(type,band,hp,lp,SR_data,markers(:,:,d));
end

% for m = 1:size(markers,2)
%     figure(m)
%     for d = 1:3
%         subplot(3,1,d), hold all, grid on
%         plot(markers(:,m,d));
%     end
% end

%% Organising displacement in a proper structure to be use by FPP_STTest

% Define floor levels
quotePiani = sort(label(:,3)); 
quotePiani = [0
            550
            3440
            6580
            9690];
        
quotePiani(quotePiani< 0) = []; %non salvo gli spostamenti di punti sotto la tavola
quotePiani(diff(quotePiani)==0) = []; %elimino le ripetizioni

% n° of floors
nPiani = numel(quotePiani);


for f = 1:nPiani
    markerPiano{f} = find(label(:,3) == quotePiani(f));
    erase = [];
    for i = 1:numel(markerPiano{f})
        if max(isnan(reshape(markers(1,markerPiano{f}(i),:),3,1)))==1
            erase = [erase, i];
        end
    end
    if ~isempty(erase)
        markerPiano{f}(erase) = [];
    end
    for d = 1:3
        offset = median(markers(1:100,markerPiano{f},d));
        floorDispl{f}{d} = markers(:,markerPiano{f},d) -offset(ones(size(markers,1),1),:);
    end
end


end

function label= defaultLabelCoord()

label = [-1	307	0
0	0	0
297	0	0
-890	-79	558
503	-93	558
1900	-103	555
-230	-246	837
-226	-250	1161
-219	-247	1601
-869	-2269	1761
1881	-2281	1758
-57	-1691	3005
1069	-3278	3006
210	-4546	3156
1813	-4498	3163
-1345	-505	3447
-351	-517	3442
532	-522	3443
1370	-526	3441
2362	-521	3445
-683	-2477	3480
504	-1591	3478
506	-2473	3479
508	-3354	3482
1693	-2479	3478
2475	-4238	3524
-208	-240	3887
1542	-613	4038
-208	-238	4192
-16	-884	4221
1229	-2807	4496
1216	-2802	5067
23	-893	5103
-33	151	5219
246	154	5214
1226	-2798	5509
1751	-2182	5779
1428	-2318	5874
-1	-882	6011
1744	-1904	6223
456	-1274	6410
-1348	-501	6596
-363	-526	6579
493	-527	6577
1365	-525	6576
2373	-510	6595
2486	-4229	6615
-481	-603	6852
1767	-2087	6965
-793	-930	7368
857	-931	7385
1590	-1274	7365
2183	-2196	7367
2174	-3830	7382
1758	-2399	8042
1771	-2395	9104
-1045	-2687	9226
-854	-1451	9293
138	-1441	9300
1149	-1428	9295
-1336	-484	9693
-348	-510	9689
503	-514	9688
1393	-515	9687
2370	-495	9689
2498	-4229	9733
-960	-597	10379
256	31	10499
429	32	10497
616	28	10496
790	23	10500
986	-596	10675
3003	-2239	10688
3007	-2409	10691
3011	-2562	10690
3011	-2743	10687
2110	-2019	10862];

end