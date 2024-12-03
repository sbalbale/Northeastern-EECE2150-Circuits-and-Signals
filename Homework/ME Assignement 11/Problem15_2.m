% Problem 15.2 Solution using v_in(t) = 0.6 cos(ωt)

% Given values
V_in_amplitude = 0.6;    % Input voltage amplitude in volts
gain = 10;               % Passband gain
f_c = 500;               % Cutoff frequency in Hz
omega_c = 2 * pi * f_c;  % Cutoff angular frequency in rad/s

% Part A: Minimum Vcc to keep the op-amp in the linear region
V_out_max = gain * V_in_amplitude;  % Maximum output voltage
Vcc_min = V_out_max;                % Minimum Vcc
fprintf('Part A: Minimum Vcc = %.3f V\n', Vcc_min);

% Frequencies for Parts B, C, and D
omega_values = [omega_c, 0.1 * omega_c, 10 * omega_c];
A_values = zeros(1, 3);
phi_values = zeros(1, 3);

for i = 1:length(omega_values)
    omega = omega_values(i);
    % Magnitude of the transfer function
    H_mag = gain / sqrt(1 + (omega / omega_c)^2);
    % Phase shift of the filter
    phi_filter = -atan(omega / omega_c) * (180 / pi);
    % Total phase shift considering inverting op-amp
    phi_total = phi_filter - 180;
    % Adjust phase angle to be within -180° to 180°
    if phi_total <= -180
        phi_total = phi_total + 360;
    end
    % Output amplitude
    A = H_mag * V_in_amplitude;
    % Store the results
    A_values(i) = A;
    phi_values(i) = phi_total;
end

% Part B Results
fprintf('\nPart B Results:\n');
fprintf('A = %.3f V\n', A_values(1));
fprintf('ω = %.3f rad/s\n', omega_values(1));
fprintf('ϕ = %.2f degrees\n', phi_values(1));

% Part C Results
fprintf('\nPart C Results:\n');
fprintf('A = %.3f V\n', A_values(2));
fprintf('ω = %.3f rad/s\n', omega_values(2));
fprintf('ϕ = %.2f degrees\n', phi_values(2));

% Part D Results
fprintf('\nPart D Results:\n');
fprintf('A = %.3f V\n', A_values(3));
fprintf('ω = %.3f rad/s\n', omega_values(3));
fprintf('ϕ = %.2f degrees\n', phi_values(3));