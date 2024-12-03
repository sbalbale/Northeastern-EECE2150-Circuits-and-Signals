% Given values
fc = 2.5e3;        % Cutoff frequency in Hz
C = 4e-9;          % Capacitance in Farads

% Calculate R2
R2 = 1 / (2 * pi * fc * C);  % Resistance in Ohms

% Convert passband gain from dB to linear scale
Gain_dB = 10;
Gain = 10^(Gain_dB / 20);

% Calculate R1
R1 = R2 / Gain;

% Convert resistances to kilo-ohms
R1_kohm = R1 / 1e3;
R2_kohm = R2 / 1e3;

% Display results with three significant figures
fprintf('%.3f, %.3f\n', R1_kohm, R2_kohm);