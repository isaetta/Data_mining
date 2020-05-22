%% function filter FIR1 o butter
function [bfilt,afilt,filterdesc]=fun_filtroCH2(type,band,hp,lp,SR,FIRslope)
% type: filter type, 1 Butterworth, 2 FIR1
% band: filter band type, 1 Lowpass, 2 Bandpass, 3 Highpass
% hp: highpass frequency
% lp: lowpass frequency
% SR: sampling rate of channels to apply the filter
% FIRslope: slope of the transition phase (FIR1 only) - e.g. 200

if type==1    % Butter
    filterdesc=strvcat('Butterworth Filter:');
    if band==1      % Lowpass Filter
        Wn=lp/(SR/2);
        [N, WN] = buttord(Wn,min(1.3*Wn,0.5+Wn/2), 1, 30,'s');
        [bfilt,afilt] = butter(N,WN);
        filterdesc=strvcat(filterdesc,strcat('Lowpass at:',num2str(lp),' Hz'));
    elseif band==2      % Bandpass Filter
        Wn=[hp lp]/(SR/2);
        [N, WN] = buttord(Wn,[0.7*Wn(1) min(1.3*Wn(2),0.5+Wn(2)/2)], 1, 30,'s');
        [bfilt,afilt] = butter(N,WN);
        filterdesc=strvcat(filterdesc,strcat('Bandpass at: [',num2str([hp lp]),'] Hz'));
    elseif band==3       % Highpass Filter
        Wn=hp/(SR/2);
        [N, WN] = buttord(Wn,0.7*Wn, 1, 30,'s');
        [bfilt,afilt] = butter(N,WN,'high');
        filterdesc=strvcat(filterdesc,strcat('Highpass at:',num2str(hp),' Hz'));
    end
elseif type==2    % FIR1
    filterdesc=strvcat('FIR1 Filter:');
    if band==1      % Lowpass Filter
        Wn=lp/(SR/2);
        bfilt=fir1(FIRslope,Wn);
        afilt=[1];
        filterdesc=strvcat(filterdesc,strcat('Lowpass at:',num2str(lp),' Hz'));
    elseif band==2      % Bandpass Filter
        Wn=[hp lp]/(SR/2);
        bfilt=fir1(FIRslope,Wn);
        afilt=[1];
        filterdesc=strvcat(filterdesc,strcat('Bandpass at: [',num2str([hp lp]),'] Hz'));
    elseif band==3      % Highpass Filter
        Wn=hp/(SR/2);
        bfilt=fir1(FIRslope,Wn,'high');
        afilt=[1];
        filterdesc=strvcat(filterdesc,strcat('Highpass at:',num2str(hp),' Hz'));
    end
end
