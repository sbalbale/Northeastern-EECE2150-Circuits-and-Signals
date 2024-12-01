% Parameters of the RC low-pass filter
R = 20e3; % Resistance in ohms (20 kOhms)
C = 4e-9; % Capacitance in farads (4 nF)

% Part A: Find the cutoff frequency
fc = 1 / (2 * pi * R * C); % Cutoff frequency in Hz
fprintf('Part A: Cutoff frequency (fc): %.3f Hz\n', fc);

% Define angular frequency (omega)
wc = 2 * pi * fc; % Cutoff angular frequency (rad/s)

% Part B: Calculate H(jw) at wc
H_wc = 1 / (1 + 1j); % Magnitude and angle at wc
magnitude_H_wc = abs(H_wc); % Magnitude
angle_H_wc = angle(H_wc) * (180/pi); % Phase in degrees
fprintf('Part B: H(jwc): Magnitude = %.3f, Phase = %.3f degrees\n', magnitude_H_wc, angle_H_wc);

% Part C: Calculate H(jw) at 0.3wc
omega_0_3wc = 0.3 * wc;
H_0_3wc = 1 / (1 + 1j * omega_0_3wc / wc);
magnitude_H_0_3wc = abs(H_0_3wc); % Magnitude
angle_H_0_3wc = angle(H_0_3wc) * (180/pi); % Phase in degrees
fprintf('Part C: H(j0.3wc): Magnitude = %.3f, Phase = %.3f degrees\n', magnitude_H_0_3wc, angle_H_0_3wc);

% Part D: Calculate H(jw) at 10wc
omega_10wc = 10 * wc;
H_10wc = 1 / (1 + 1j * omega_10wc / wc);
magnitude_H_10wc = abs(H_10wc); % Magnitude
angle_H_10wc = angle(H_10wc) * (180/pi); % Phase in degrees
fprintf('Part D: H(j10wc): Magnitude = %.3f, Phase = %.3f degrees\n', magnitude_H_10wc, angle_H_10wc);

% Given input voltage parameters
Vi = 480; % Peak voltage in millivolts

% Part E: Steady-state expression for vo when ω = ωc
omega_E = wc; % Angular frequency equals the cutoff angular frequency
H_E = 1 / (1 + 1j * omega_E / wc); % Transfer function at ω = ωc
Ao_E = abs(H_E) * Vi; % Output amplitude in mV
phi_E = angle(H_E) * (180/pi); % Phase angle in degrees

% Display results for Part E
fprintf('Part E: Ao, ω, φ = %.3f mV, %.3f rad/s, %.3f degrees\n', Ao_E, omega_E, phi_E);

% Part F: Steady-state expression for vo when ω = 0.3ωc
omega_F = 0.3 * wc; % Angular frequency equals 0.3 of the cutoff angular frequency
H_F = 1 / (1 + 1j * omega_F / wc); % Transfer function at ω = 0.3ωc
Ao_F = abs(H_F) * Vi; % Output amplitude in mV
phi_F = angle(H_F) * (180/pi); % Phase angle in degrees

% Display results for Part F
fprintf('Part F: Ao, ω, φ = %.3f mV, %.3f rad/s, %.3f degrees\n', Ao_F, omega_F, phi_F);

% Part G: Steady-state expression for vo when ω = 10ωc
omega_G = 10 * wc; % Angular frequency equals 10 times the cutoff angular frequency
H_G = 1 / (1 + 1j * omega_G / wc); % Transfer function at ω = 10ωc
Ao_G = abs(H_G) * Vi; % Output amplitude in mV
phi_G = angle(H_G) * (180/pi); % Phase angle in degrees

% Display results for Part G
fprintf('Part G: Ao, ω, φ = %.3f mV, %.3f rad/s, %.3f degrees\n', Ao_G, omega_G, phi_G);
