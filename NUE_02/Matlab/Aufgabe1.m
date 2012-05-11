%% 100000-facher Wurf mit einem Würfel
N = 1000;
y = 0;
x = floor(rand(10000,N)*(6-1E-99)+1);
y=sum(x,2);
%x2 = floor(rand(100000,1)*(6-1E-99)+1);
% x ist ein Vektor der Dimension 100000x1.
% Jedes Element von x steht für das Ergebis eines Würfelwurfs.
% Addition von beiden Vektoren

%% Berechnung des Histogramms 


[H,bins] = hist(y,100);
% bins ... Mittelwert des jeweiligen Bins
% H ... Anzahl der Treffer je Bin

%% Bestimmung der Verteilungsdichtefunktion (pdf) aus dem Histogramm

H2 = H/10000;

mw = mean(bins);                   %Mittelwert
v = var(bins);                     %varianz   
f = 1/(sqrt(v*2*pi)).*exp(-(1/2).*((bins-mw)/sqrt(v)).^2);
%Gau�-Funktion mit Mittwelwert und Varianz von R zum �berlagern


figure(2);clf(2);
bar(bins,H2);
hold on
plot(bins,f,'r');
title('pdf des W�rfelexperiments')
xlabel('Augenzahl')


%% Darstellung der pdf
% figure(1);
% title('pdf des Würfelexperiments')
% xlabel('Augenzahl')
% bar(bins,H);
