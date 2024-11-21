% MATLAB code for Problem 2

% Given values
V_signal_peak = 0.2;       % Peak value of the sensor signal in volts (±0.2 V)
V_FS = 10;                 % Full-scale range of the A/D converter in volts (±5 V)
f_max = 4e3;               % Highest frequency component in Hz (4 kHz)
E_max_percent = 0.1;       % Maximum quantization error in percent (0.1%)

% Part (a): Minimum number of bits required by the A/D
E_max = (E_max_percent / 100) * V_signal_peak;  % Max acceptable quantization error in volts
delta_V = 2 * E_max;                            % Quantization step size
n_bits = ceil(log2(V_FS / delta_V));            % Minimum number of bits required
fprintf('Part (a) Minimum number of bits required (without amplification): %d bits\n', n_bits);

% Part (b): Minimum sampling frequency
f_s_min = 2 * f_max;                            % According to Nyquist criterion
fprintf('Part (b) Minimum sampling frequency required: %.0f Hz\n', f_s_min);

% Part (c): Gain factor and minimum number of bits after amplification
V_signal_peak_amp = 5;                          % Desired peak amplitude after amplification in volts (±5 V)
Gain = V_signal_peak_amp / V_signal_peak;       % Amplifier gain factor
E_max_amp = (E_max_percent / 100) * V_signal_peak_amp;  % Max quantization error after amplification
delta_V_amp = 2 * E_max_amp;                    % New quantization step size
n_bits_amp = ceil(log2(V_FS / delta_V_amp));    % Minimum number of bits after amplification
fprintf('Part (c) Amplifier gain factor required: %.2f\n', Gain);
fprintf('         Minimum number of bits required (with amplification): %d bits\n', n_bits_amp);