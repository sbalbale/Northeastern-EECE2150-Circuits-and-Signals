% Given values
fc = 500; % Cutoff frequency in Hz
gain = 10; % Passband gain
vi_amplitude = 0.6; % Input signal amplitude in V

% Part A: Minimum Vcc to ensure linear operation
vout_peak = vi_amplitude * gain; % Peak output voltage
Vcc_min = vout_peak; % Vcc must be at least equal to peak output
disp(['Part A: Vcc_min = ', num2str(Vcc_min), ' V']);

% Angular cutoff frequency
omega_c = 2 * pi * fc; % in rad/s

% Define transfer function magnitude and phase
H_mag = @(omega) gain ./ sqrt(1 + (omega / omega_c).^2);
H_phase = @(omega) -atan(omega / omega_c) * (180 / pi); % Phase in degrees

% Part B: At omega = omega_c
omega = omega_c; % Angular frequency
magnitude = H_mag(omega);
A = magnitude * vi_amplitude; % Output amplitude
phi = H_phase(omega); % Phase in degrees
disp(['Part B: A = ', num2str(A), ' V, ω = ', num2str(omega), ' rad/s, ϕ = ', num2str(phi), '°']);

% Part C: At omega = 0.1 * omega_c
omega = 0.1 * omega_c; % Angular frequency
magnitude = H_mag(omega);
A = magnitude * vi_amplitude; % Output amplitude
phi = H_phase(omega); % Phase in degrees
disp(['Part C: A = ', num2str(A), ' V, ω = ', num2str(omega), ' rad/s, ϕ = ', num2str(phi), '°']);

% Part D: At omega = 10 * omega_c
omega = 10 * omega_c; % Angular frequency
magnitude = H_mag(omega);
A = magnitude * vi_amplitude; % Output amplitude
phi = H_phase(omega); % Phase in degrees
disp(['Part D: A = ', num2str(A), ' V, ω = ', num2str(omega), ' rad/s, ϕ = ', num2str(phi), '°']);
