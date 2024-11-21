% MATLAB code for Problem 4

% Given signal
Fs = 4000; % Sampling rate in Hz
Ts = 1 / Fs; % Sampling period in seconds

% Frequencies in the original signal
f1 = 1000; % Hz (from 2*cos(2000*pi*t + pi/3))
f2 = 3000; % Hz (from 3*cos(6000*pi*t))
f3 = 1500; % Hz (from 2*cos(3000*pi*t))

% (a) Frequencies in the original signal
original_frequencies = [f1, f3, f2]; % Hz

% (b) Discrete-time signal x[n]
% Compute angular frequencies
omega1 = 2 * pi * f1;
omega2 = 2 * pi * f2;
omega3 = 2 * pi * f3;

% Compute discrete-time frequencies
Omega1 = omega1 * Ts;
Omega2 = omega2 * Ts;
Omega3 = omega3 * Ts;

% Reduce to range [-pi, pi]
Omega1 = mod(Omega1 + pi, 2*pi) - pi;
Omega2 = mod(Omega2 + pi, 2*pi) - pi;
Omega3 = mod(Omega3 + pi, 2*pi) - pi;

% Expression for x[n]
n = 0:100; % Sample indices
x_n = 2*cos(Omega1*n + pi/3) + 3*cos(Omega2*n) + 2*cos(Omega3*n);

% (c) Frequencies in the reconstructed signal xr(t)
% Aliased frequencies calculation
fa1 = f1; % Below Nyquist frequency
fa2 = abs(f2 - Fs); % Aliased frequency for f2
fa3 = f3; % Below Nyquist frequency

reconstructed_frequencies = [fa1, fa3]; % Hz

% Display results
fprintf('Part (a) Original frequencies (Hz): %s\n', num2str(original_frequencies));
fprintf('Part (b) Discrete-time frequencies (rad/sample): %.2f, %.2f, %.2f\n', Omega1, Omega3, Omega2);
fprintf('Part (c) Reconstructed frequencies (Hz): %s\n', num2str(reconstructed_frequencies));