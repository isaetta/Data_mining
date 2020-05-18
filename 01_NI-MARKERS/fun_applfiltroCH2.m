function [filtx,filterdesc]=fun_applfiltroCH2(type,band,hp,lp,SR,FIRslope,x2filt)
%%% function filter FIR1 o butter
% calculate filter coefficient and apply filtr to signal x2filt
% type: filter type, 1 Butterworth, 2 FIR1 (impulse)
% band: filter band type, 1 Lowpass, 2 Bandpass, 3 Highpass
% hp: highpass frequency
% lp: lowpass frequency
% SR: sampling rate of channels to apply the filter
% FIRslope: slope of the transition phase (FIR1 only) - e.g. 200

[bfilt,afilt,filterdesc]=fun_filtroCH2(type,band,hp,lp,SR,FIRslope);

% plot filt
lengthx2filt=length(x2filt);
[Hf,frf]=freqz(bfilt,afilt,lengthx2filt,SR);

figure
    plot(frf,abs(Hf)),hold on,grid on
    title(strcat('Lowpass Filter at Hz: ',num2str(lp)),'fontweight','bold');
    xlim([0 2.5*lp])
    ylim([0 2])
    xlabel('frequency [Hz]')
    ylabel('Amplitude Response')
close;

filtx=filtfilt(bfilt,afilt,x2filt);
