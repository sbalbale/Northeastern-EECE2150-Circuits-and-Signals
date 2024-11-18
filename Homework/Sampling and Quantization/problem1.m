% Consider a 3-bit analog to digital convertor A/D with a full-scale range of ±10𝑉. An input signal in the
% form 𝑥(𝑡) = 5 sin(2000𝜋𝑡) is acquired by the A/D using a sampling rate 𝐹𝑠 = 8𝑘𝐻𝑧.
% a. Determine the resolution of the 𝐴/𝐷.
% b. Determine the maximum quantization error for the given input signal.
% c. Compute and sketch the quantization levels of the given A/D.
% d. Write an expression for the sampled discrete time signal 𝑥[𝑛] = 𝑥(𝑛𝑇𝑠) where 𝑇𝑠 is the sampling
% interval, 𝑇𝑠 = 1
% 𝐹𝑠
% . Determine the discrete time frequency, Ω.
% e. What is the minimum sampling frequency that can be used to sample 𝑥(𝑡)?
% f. Now assume the given input signal is acquired by the A/D using a sampling frequency, 𝐹𝑠 = 8𝑘𝐻𝑧.
% Sketch the samples and quantized signal over one cycle of the input signal, assuming each sample is
% held constant at the corresponding quantization level, during the sampling interval.

% Problem 1 Solution

% Given parameters
n = 3;                    % Number of bits
V_fs = 20;                % Full-scale range from -10V to +10V
F_s = 8000;               % Sampling frequency in Hz
f_signal = 1000;          % Signal frequency in Hz (since omega = 2000*pi)
T_s = 1 / F_s;            % Sampling interval

% a. Determine the resolution of the A/D
delta = V_fs / (2^n);     % Resolution
fprintf('a) Resolution of the A/D: %.2f V\n', delta);

% b. Determine the maximum quantization error
E_max = delta / 2;
fprintf('b) Maximum quantization error: %.2f V\n', E_max);

% c. Compute and sketch the quantization levels
levels = (-2^(n-1):2^(n-1)-1) * delta + delta/2;
fprintf('c) Quantization levels:\n');
disp(levels');

% Plot quantization levels
figure;
stem(levels, zeros(size(levels)), 'filled');
title('Quantization Levels');
xlabel('Voltage (V)');
ylabel('Level');
grid on;

% d. Expression for the sampled discrete-time signal and discrete-time frequency Omega
n_samples = 0:15;                                % Sample indices
x_n = 5 * sin(2 * pi * f_signal * n_samples * T_s);
Omega = 2 * pi * f_signal * T_s;                 % Discrete-time frequency
fprintf('d) Discrete-time frequency Omega: %.2fπ radians/sample\n', Omega/pi);

% e. Minimum sampling frequency
F_s_min = 2 * f_signal;                          % Nyquist rate
fprintf('e) Minimum sampling frequency: %.0f Hz\n', F_s_min);

% f. Sketch samples and quantized signal over one cycle of the input signal
t = n_samples * T_s;                             % Time vector for one cycle
x_t = 5 * sin(2 * pi * f_signal * t);            % Original signal

% Quantize the signal
x_quant = delta * floor(x_t / delta + 0.5);

% Plot original samples and quantized signal
figure;
stairs(t, x_quant, 'r', 'LineWidth', 2);         % Quantized signal
hold on;
stem(t, x_t, 'b', 'filled');                     % Original samples
title('Original Samples and Quantized Signal');
xlabel('Time (s)');
ylabel('Amplitude (V)');
legend('Quantized Signal', 'Original Samples');
grid on;