%periodisches bipolars Rechtecksignal
%Amplitude: 2V
A = 2;
%Dauer des Signals: 1.0s
T_ges = 1.0;
%Abtastfrequenz: 1MHz
f_T = 1E6;
%Frequenz des Signals: 100Hz
f = 50;
%DutyCycle: 0 < alpha < 1
alpha = 0.1;
%Berechnung des Rechtecksignals
%y = rechteck(A,alpha,f,f_T,T_ges);
%y = dreieck(A,alpha,f,f_T,T_ges);
y = cosinus(A,alpha,f,f_T,T_ges);
%Berechnung des Spektrums
y_DFT = fft(y);
%y_DFT = fftshift(y_DFT);
N = length(y);
%Betragsspektrum
y_DFT_abs = 10*LOG10(abs(y_DFT)/N);
%Phasenspektrum
y_DFT_phase = unwrap(angle(y_DFT)/N);
%Zeitachse
t = T_ges*(0:(N-1))/(N-1);
%Frequenzachse
f_DFT = f_T*(0:(N-1))/(N-1);
%neues Fenster zur Darstellung
figure(1);
%Darstellung des Zeitsignals
subplot(3,1,1);
plot(t,y);
AXIS([0 0.1 -2.2 2.2])
title('Zeitsignal');
xlabel('t/s');
ylabel('u/V');
%Darstellung des Amplitudenspektrums
subplot(3,1,2);
plot(f_DFT, y_DFT_abs,'.-');
AXIS([0 4E3 0 1.5])
ylim ([-30 5])
title('Amplitudenspektrum');
xlabel('f/Hz');
ylabel('A(f)[dB]');    
%Darstellung des Phasenspektrums
subplot(3,1,3);
plot(f_DFT, y_DFT_phase);
AXIS([0 4E3 0 0.4E-5])
title('Phasenspektrum');
xlabel('f/Hz');
ylabel('phi(f)');
