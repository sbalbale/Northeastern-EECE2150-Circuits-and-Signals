% Load the ECG data from the .mat file
load('ecg_data.mat', 'ecg_data');

% Check if the data is loaded correctly
if ~exist('ecg_data', 'var')
    error('Failed to load ecg_data from ecg_data.mat');
end

% Set the acquisition rate and duration
fs = 1000; % Sampling frequency in Hz
duration = 10; % Duration in seconds
num_signals = length(ecg_data);

% Plot the raw voltage data
figure('Name', 'Raw ECG Signals');

for i = 1:num_signals
    subplot(num_signals, 1, i);
    plot((0:duration * fs - 1) / fs, ecg_data{i}.(ecg_data{i}.Properties.VariableNames{1}));
    title(sprintf('ECG Signal %d (Raw Voltage)', i));
    xlabel('Time (s)');
    ylabel('Voltage (V)');
end

% Define the gain of the analog system
gain = 1000; % Example gain value

% Plot the scaled voltage data
figure('Name', 'Scaled ECG Signals');

for i = 1:num_signals
    subplot(num_signals, 1, i);
    plot((0:duration * fs - 1) / fs, ecg_data{i}.(ecg_data{i}.Properties.VariableNames{1}) / gain);
    title(sprintf('ECG Signal %d (Scaled Voltage)', i));
    xlabel('Time (s)');
    ylabel('Voltage at Electrodes (V)');
end
