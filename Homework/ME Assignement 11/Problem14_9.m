% Given parameters
fc = 700; % Cutoff frequency in Hz
C_val = 40e-9; % Capacitance in Farads (40 nF)

% Part A: Calculate the angular cutoff frequency
wc = 2 * pi * fc; % Angular frequency in rad/s
fprintf('Part A: Cutoff angular frequency (ω_c): %.3f rad/s\n', wc);

% Part B: Calculate the resistor value
R_val = 1 / (wc * C_val); % Using the formula R = 1 / (ω_c * C)
fprintf('Part B: Resistor value (R): %.3f ohms\n', R_val);

% Part C: Transfer function of the RC low-pass filter
syms s R C
H = 1 / (1 + R * C * s); % Transfer function H(s)
disp('Part C: Transfer function H(s):');
disp(H);

% Part D: Transfer function of the loaded filter
R_th = (R*R)/(R+R); % Thevenin equivalent resistance
Gain = R/(R+R); % DC Voltage Gain
H_loaded = Gain / (1 + R_th * C * s); % Transfer function of the loaded filter
disp('Part D: Transfer function of the loaded filter H_loaded(s):');
disp(H_loaded);

% Part E: Cutoff frequency of the loaded filter
wc_loaded = 1 / (R * C / 2); % Cutoff angular frequency of the loaded filter
wc_loaded_numeric = double(subs(wc_loaded, [R, C], [R_val, C_val])); % Substitute values and convert to numeric
fprintf('Part E: Cutoff angular frequency of the loaded filter (ω_c_loaded): %.3f rad/s\n', wc_loaded_numeric);

% Part F: Gain in the passband of the loaded filter
H_loaded_0 = subs(H_loaded, s, 0); % Evaluate H_loaded(s) at s = 0
H_loaded_0_numeric = double(subs(H_loaded_0, [R, C], [R_val, C_val])); % Substitute values and convert to numeric
fprintf('Part F: Gain in the passband of the loaded filter (H(0)): %.3f\n', H_loaded_0_numeric);