% Given parameters for the filter
R = 1e3; % Resistor value in ohms (1 kΩ)
L = 50e-3; % Inductor value in henries (50 mH)
RL = 1.9e3; % Load resistor value in ohms (1.9 kΩ)

% Part A: Transfer Function
% Parallel combination of R and RL
R_parallel = (R * RL) / (R + RL); % Equivalent resistance

% Transfer function H(s) = Vo(s) / Vi(s)
% Impedance of inductor: Z_L = sL
syms s
Z_L = s * L; % Inductor impedance
H = R_parallel / (R_parallel + Z_L); % Transfer function
disp('Part A - Transfer function H(s):');
disp(simplify(H));

H(s) = (0.655 * s) / (s + 0.655 * 20000);

% Part B: Cutoff Angular Frequency
% Cutoff angular frequency wc = 1 / (L / R_parallel)
wc = double(1 / (L / R_parallel));
fprintf('Part B - Cutoff angular frequency (ω_c): %.3f rad/s\n', wc);

% Part C: Cutoff Frequency Loaded Ratio
% Cutoff frequency of the loaded filter
wc_unloaded = R / L; % Cutoff angular frequency of the loaded filter
ratio = wc / wc_unloaded; % Ratio of cutoff frequencies
fprintf('Part C - Cutoff frequency loaded ratio: %.3f\n', ratio);
