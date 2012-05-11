%% SNR-Berechnung am rauschbehafteten √úbertragungskanal
% Laden der Messdaten
% A...Originalsignals
% B...Empfangssignals
load('Signale.mat');

%% Berechnung des Korrekturfaktors
alpha = mean(A)/mean(B);

%% Korrektur der Kanald√§mpfung

%nicht notwenig
%

%% Berechnung des Differenzsignals
% R...Rauschsignal

R = A-alpha*B;
figure(1)
plot(R);
%figure(2);
%plot(A,'g');
%figure(3)
%plot(B,'r');
%figure(4)
%plot(A-B);
figure(5)
[H,bins] = hist(R,100);
bar(bins,H);

mw = mean(bins);                   %Mittelwert von R
v = var(bins);                        %Varianz von R
f = 1/(sqrt(v*2*pi))*exp(-(1/2).*((bins-mw)/(sqrt(v))).^2);
%Gauﬂ-Funktion mit Mittwelwert und Varianz von R zum ‹berlagern

figure(6)
H2 = H/length(R);
bar(bins,H2);
hold on
plot(bins,f,'r')
hold off

%% Messung des Rauschens

snr0 = SNR(A,R);




