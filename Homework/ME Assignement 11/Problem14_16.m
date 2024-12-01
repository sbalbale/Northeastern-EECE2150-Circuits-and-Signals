% Given values for Part A
C = 30e-9; % Capacitance in farads (30 nF)
fc = 900; % Desired cutoff frequency in Hz

% Part A: Calculate the resistance value for the desired cutoff frequency
R = 1 / (2 * pi * fc * C); % Resistance in ohms
R_kOhms = R / 1e3; % Convert to kilohms
disp(['Part A: R = ', num2str(R_kOhms), ' kΩ']);

% Part B: Loaded filter cutoff frequency
R_parallel = 68e3; % Load resistance in ohms (68 kΩ)
R_effective = 1 / (1/R + 1/R_parallel); % Parallel combination of R and R_parallel
fc_loaded = 1 / (2 * pi * R_effective * C); % New cutoff frequency
disp(['Part B: Loaded cutoff frequency (fc): ', num2str(fc_loaded), ' Hz']);
