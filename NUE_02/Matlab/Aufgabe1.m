%% 100000-facher Wurf mit einem WÃ¼rfel
N = 1000;
y = 0;
x = floor(rand(10000,N)*(6-1E-99)+1);
y=sum(x,2);
%x2 = floor(rand(100000,1)*(6-1E-99)+1);
% x ist ein Vektor der Dimension 100000x1.
% Jedes Element von x steht fÃ¼r das Ergebis eines WÃ¼rfelwurfs.
% Addition von beiden Vektoren

%% Berechnung des Histogramms 


[H,bins] = hist(y,100);
% bins ... Mittelwert des jeweiligen Bins
% H ... Anzahl der Treffer je Bin

%% Bestimmung der Verteilungsdichtefunktion (pdf) aus dem Histogramm

H2 = H/10000;

%Mittelwert
mw = mean(bins*H2);
%Varianz
v = var(bins,H);
%Standartabweichung
s = std(bins,H);

%Gauß-Funktion mit Mittwelwert und Varianz von R zum Überlagern
g = (1/(s*sqrt(2*pi)))*exp(-(1/2).*((bins-mw)./s).^2);
g2=g/sum(g);


figure(2);clf(2);
bar(bins,H2);
hold on
plot(bins,g2,'r');
title('pdf des Würfelexperiments')
xlabel('Augenzahl')
ylabel('Wahrscheinlichkeit')
hold off


%% Darstellung der pdf
% figure(1);
% title('pdf des Würfelexperiments')
% xlabel('Augenzahl')
% bar(bins,H);
