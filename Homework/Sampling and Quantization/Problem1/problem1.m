% MATLAB code for Problem 1

% Given parameters
n = 3;                    % Number of bits
V_fs = 20;                % Full-scale range from -10V to +10V
F_s = 8000;               % Sampling frequency in Hz
f_signal = 1000;          % Signal frequency in Hz (since omega = 2000*pi)
T_s = 1 / F_s;            % Sampling interval

% a. Determine the resolution of the A/D
delta = V_fs / (2^n);     % Resolution
fprintf('Part (a) Resolution of the A/D: %.2f V\n', delta);

% b. Determine the maximum quantization error
E_max = delta / 2;
fprintf('Part (b) Maximum quantization error: %.2f V\n', E_max);

% c. Compute and sketch the quantization levels
levels = (-2^(n-1):2^(n-1)-1) * delta + delta/2;
fprintf('Part (c) Quantization levels:\n');
disp(levels');

% Plot quantization levels
figure('Name', 'Part (c) Quantization Levels');
stem(levels, zeros(size(levels)), 'filled');
title('Quantization Levels');
xlabel('Voltage (V)');
ylabel('Level');
grid on;

% d. Expression for the sampled discrete-time signal and discrete-time frequency Omega
n_samples = 0:15;                                % Sample indices
x_n = 5 * sin(2 * pi * f_signal * n_samples * T_s);
Omega = 2 * pi * f_signal * T_s;                 % Discrete-time frequency
fprintf('Part (d) Discrete-time frequency Omega: %.2fπ radians/sample\n', Omega/pi);

% e. Minimum sampling frequency
F_s_min = 2 * f_signal;                          % Nyquist rate
fprintf('Part (e) Minimum sampling frequency: %.0f Hz\n', F_s_min);

% f. Sketch samples and quantized signal over one cycle of the input signal
t = n_samples * T_s;                             % Time vector for one cycle
x_t = 5 * sin(2 * pi * f_signal * t);            % Original signal

% Quantize the signal
x_quant = delta * floor(x_t / delta + 0.5);

% Plot original samples and quantized signal
figure('Name', 'Part (f) Original Samples and Quantized Signal');
stairs(t, x_quant, 'r', 'LineWidth', 2);         % Quantized signal
hold on;
stem(t, x_t, 'b', 'filled');                     % Original samples
title('Original Samples and Quantized Signal');
xlabel('Time (s)');
ylabel('Amplitude (V)');
legend('Quantized Signal', 'Original Samples');
grid on;