%% SNR-Berechnung am rauschbehafteten Üœbertragungskanal
% Laden der Messdaten
% A...Originalsignals
% B...Empfangssignals
load('Signale_0dB.mat');

%% Berechnung des Korrekturfaktors
alpha = mean(A)/mean(B);

%% Korrektur der Kanaldämpfung

%nicht notwenig
%

%% Berechnung des Differenzsignals
% R...Rauschsignal

R = A-alpha*B;
%figure(1)
%plot(R);
%figure(2);
%plot(A,'g');
%figure(3)
%plot(B,'r');
%figure(4)
%plot(A-B);
%figure(5)
[H,bins] = hist(R,100);
%bar(bins,H);
H2 = H/length(R);

%Mittelwert
mw = mean(bins.*H2);
%Varianz
v = var(bins,H);
%Standartabweichung
s = std(bins,H);

%Gauß-Funktion mit Mittwelwert und Varianz von R zum Überlagern
g = (1/(s*sqrt(2*pi)))*exp(-(1/2).*((bins-mw)./s).^2);
g2=g/sum(g);

%Laplace Verteilung
l = (1/(2*s))*exp(-((abs(bins-mw))/s));
l2 = l/sum(l);


 figure(6)
 
 bar(bins,H2);
hold on
plot(bins,g2,'r');
plot(bins,l2,'g');
title('pdf des Würfelexperiments')
xlabel('Rauschanteil [V]')
ylabel('Wahrscheinlichkeit')
hold off

%% Messung des Rauschens

snr0 = SNR(A,R)




