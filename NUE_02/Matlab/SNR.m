%% Funktion zur Bestimmung des SNRs
function result = SNR(U,N)
% U... Signalvektor
% N... Rauschvektor

%% Berechnung der Energien

E_U = sum(U.*U)
E_N = sum(N.*N)

%% Berechung des SNRs

result = 10*log10(E_U/E_N);
