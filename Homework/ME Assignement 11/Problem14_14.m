% Given values
R = 40e3; % Resistance in ohms
C = 2.5e-9; % Capacitance in farads
vi_amplitude = 0.6; % Input amplitude in V

% Part A: Cutoff frequency
fc = 1 / (2 * pi * R * C); % Cutoff frequency in Hz
disp(['Part A: Cutoff frequency (fc): ', num2str(fc), ' Hz']);

% Angular cutoff frequency
omega_c = 2 * pi * fc;

% Part B: H(jw) at omega_c
omega = omega_c;
H_omega_c = (1j * omega * R * C) / (1 + 1j * omega * R * C);
magnitude_omega_c = abs(H_omega_c);
phase_omega_c = angle(H_omega_c) * (180/pi); % Convert radians to degrees
disp(['Part B: H(jw) at omega_c = ', num2str(magnitude_omega_c), ' ∠ ', num2str(phase_omega_c), '°']);

% Part C: H(jw) at 0.5 * omega_c
omega = 0.5 * omega_c;
H_half_omega_c = (1j * omega * R * C) / (1 + 1j * omega * R * C);
magnitude_half_omega_c = abs(H_half_omega_c);
phase_half_omega_c = angle(H_half_omega_c) * (180/pi); % Convert radians to degrees
disp(['Part C: H(jw) at 0.5*omega_c = ', num2str(magnitude_half_omega_c), ' ∠ ', num2str(phase_half_omega_c), '°']);

% Part D: H(jw) at 10 * omega_c
omega = 10 * omega_c;
H_ten_omega_c = (1j * omega * R * C) / (1 + 1j * omega * R * C);
magnitude_ten_omega_c = abs(H_ten_omega_c);
phase_ten_omega_c = angle(H_ten_omega_c) * (180/pi); % Convert radians to degrees
disp(['Part D: H(jw) at 10*omega_c = ', num2str(magnitude_ten_omega_c), ' ∠ ', num2str(phase_ten_omega_c), '°']);

% Part E: ω = ωc
omega = omega_c;
H_omega = (1j * omega * R * C) / (1 + 1j * omega * R * C);
Ao = abs(H_omega) * vi_amplitude * 1000; % in mV
phi = angle(H_omega) * (180 / pi); % in degrees
disp(['Part E: Ao = ', num2str(Ao), ' mV, ω = ', num2str(omega), ' rad/s, ϕ = ', num2str(phi), '°']);

% Part F: ω = 0.5 * ωc
omega = 0.5 * omega_c;
H_omega = (1j * omega * R * C) / (1 + 1j * omega * R * C);
Ao = abs(H_omega) * vi_amplitude * 1000; % in mV
phi = angle(H_omega) * (180 / pi); % in degrees
disp(['Part F: Ao = ', num2str(Ao), ' mV, ω = ', num2str(omega), ' rad/s, ϕ = ', num2str(phi), '°']);

% Part G: ω = 10 * ωc
omega = 10 * omega_c;
H_omega = (1j * omega * R * C) / (1 + 1j * omega * R * C);
Ao = abs(H_omega) * vi_amplitude * 1000; % in mV
phi = angle(H_omega) * (180 / pi); % in degrees
disp(['Part G: Ao = ', num2str(Ao), ' mV, ω = ', num2str(omega), ' rad/s, ϕ = ', num2str(phi), '°']);
