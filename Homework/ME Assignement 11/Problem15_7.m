% Given values
fc = 350;          % Cutoff frequency in Hz
C = 100e-9;        % Capacitance in Farads
Gain = 3;          % Passband gain

% Calculate R1
R1 = 1 / (2 * pi * fc * C);

% Calculate R2
R2 = Gain * R1;

% Convert resistances to kilo-ohms
R1_kohm = R1 / 1e3;
R2_kohm = R2 / 1e3;

% Display results with three significant figures
fprintf('%.3f, %.3f\n', R1_kohm, R2_kohm);