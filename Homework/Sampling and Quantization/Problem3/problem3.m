% MATLAB code for Problem 3

% Given parameters
n_bits = 10;           % Number of bits of the A/D converter
V_max = 10;            % Maximum voltage of A/D converter (V)
V_min = -10;           % Minimum voltage of A/D converter (V)
V_range = V_max - V_min; % Voltage range (V)
N_levels = 2^n_bits;   % Number of quantization levels

% Original waveform: x(t) = 2*cos(1000*pi*t) + 3*cos(2000*pi*t)

% Frequencies of the waveform components
f1 = (1000 * pi) / (2 * pi); % Frequency of first term (Hz)
f2 = (2000 * pi) / (2 * pi); % Frequency of second term (Hz)
f_max = max(f1, f2);         % Highest frequency component (Hz)

% Part (a): Minimum allowable sampling rate
fs_min = 2 * f_max;          % Minimum sampling rate (Hz)
fprintf('Part (a): Minimum sampling rate is %.1f Hz\n', fs_min);

% Part (b): Number of quantization levels
fprintf('Part (b): Number of quantization levels is %d\n', N_levels);

% Part (c): Maximum quantization error
delta_V = V_range / N_levels; % Quantization step size (V)
E_max = delta_V / 2;          % Maximum quantization error (V)
fprintf('Part (c): Maximum quantization error is %.6f V\n', E_max);

% Part (d): Number of samples needed for 10 minutes at 4 kHz
fs = 4000;                   % Sampling frequency (Hz)
T_minutes = 10;              % Duration in minutes
T_seconds = T_minutes * 60;  % Duration in seconds
N_samples = fs * T_seconds;  % Total number of samples
fprintf('Part (d): Number of samples needed is %d\n', N_samples);

% Part (e): New waveform x(t) = 8*cos(5000*pi*t) + 3*cos(2000*pi*t)
% New frequencies
f1_new = (5000 * pi) / (2 * pi); % Frequency of first term (Hz)
f2_new = f2;                      % Second term frequency remains the same
f_max_new = max(f1_new, f2_new);  % New highest frequency component (Hz)

% New minimum sampling rate
fs_min_new = 2 * f_max_new;       % New minimum sampling rate (Hz)
fprintf('Part (e): New minimum sampling rate is %.1f Hz\n', fs_min_new);

% Quantization levels and error remain unchanged
fprintf('Part (e): Number of quantization levels remains %d\n', N_levels);
fprintf('Part (e): Maximum quantization error remains %.6f V\n', E_max);