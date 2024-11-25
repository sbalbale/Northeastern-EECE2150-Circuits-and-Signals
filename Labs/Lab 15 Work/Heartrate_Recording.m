% Initialize the NI USB-6001 device
daqreset;
d = daq("ni")
addinput(d, "Dev1", "ai0", "Voltage")

% Set the acquisition rate and duration
fs = 1000 % Sampling frequency in Hz
duration = 10 % Duration in seconds
d.Rate = fs

% Acquire 5 ECG signals
num_signals = 5;
ecg_data = cell(1, num_signals);
for i = 1:num_signals
    fprintf('Acquiring ECG signal %d...\n', i);
    ecg_data{i} = read(d, seconds(duration));
end

% Save the data
save('ecg_data.mat', 'ecg_data');

% Plot the raw voltage data
figure('Name', 'Raw ECG Signals');
for i = 1:num_signals
    subplot(num_signals, 1, i);
    plot((0:duration*fs-1)/fs, ecg_data{i}.Voltage);
    title(sprintf('ECG Signal %d (Raw Voltage)', i));
    xlabel('Time (s)');
    ylabel('Voltage (V)');
end

% Define the gain of the analog system
gain = 1000 % Example gain value

% Plot the scaled voltage data
figure('Name', 'Scaled ECG Signals');
for i = 1:num_signals
    subplot(num_signals, 1, i);
    plot((0:duration*fs-1)/fs, ecg_data{i}.Voltage / gain);
    title(sprintf('ECG Signal %d (Scaled Voltage)', i));
    xlabel('Time (s)');
    ylabel('Voltage at Electrodes (V)');
end