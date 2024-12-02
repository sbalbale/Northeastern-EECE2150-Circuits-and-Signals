% % Load the ECG data from the .mat file
% load('ecg_data.mat', 'ecg_data');

% % Check if the data is loaded correctly
% if ~exist('ecg_data', 'var')
%     error('Failed to load ecg_data from ecg_data.mat');
% end

% % Set the acquisition rate and duration
% fs = 1000; % Sampling frequency in Hz
% duration = 10; % Duration in seconds
% num_signals = length(ecg_data);

% % Design a Parks-McClellan low-pass filter
% lp_cutoff = 40; % Low-pass filter cutoff frequency in Hz
% [lp_order, lp_freqs, lp_amps, lp_weights] = firpmord([lp_cutoff lp_cutoff+10], [1 0], [0.01 0.01], fs);
% lp_filter = firpm(lp_order, lp_freqs, lp_amps, lp_weights);

% % Design a 60 Hz notch filter
% notch_freq = 60; % Notch filter frequency in Hz
% notch_bw = 1; % Notch filter bandwidth in Hz
% [notch_b, notch_a] = iirnotch(notch_freq/(fs/2), notch_bw/(fs/2));

% % Plot the raw and filtered ECG signals side by side
% figure(3);
% set(gcf, 'Name', 'ECG Signals', 'NumberTitle', 'off');
% for i = 1:num_signals
%     % Extract the raw ECG signal
%     raw_signal = ecg_data{i}.(ecg_data{i}.Properties.VariableNames{1});
    
%     % Apply the low-pass filter
%     filtered_signal_lp = filter(lp_filter, 1, raw_signal);
    
%     % Apply the notch filter
%     filtered_signal_notch = filter(notch_b, notch_a, filtered_signal_lp);
    
%     % Plot the raw signal
%     subplot(num_signals, 3, (i-1)*3 + 1);
%     plot((0:duration*fs-1)/fs, raw_signal);
%     title(sprintf('ECG Signal %d (Raw)', i));
%     xlabel('Time (s)');
%     ylabel('Voltage (V)');
    
%     % Plot the low-pass filtered signal
%     subplot(num_signals, 3, (i-1)*3 + 2);
%     plot((0:duration*fs-1)/fs, filtered_signal_lp);
%     title(sprintf('ECG Signal %d (Low-pass Filtered)', i));
%     xlabel('Time (s)');
%     ylabel('Voltage (V)');
    
%     % Plot the notch filtered signal
%     subplot(num_signals, 3, (i-1)*3 + 3);
%     plot((0:duration*fs-1)/fs, filtered_signal_notch);
%     title(sprintf('ECG Signal %d (Notch Filtered)', i));
%     xlabel('Time (s)');
%     ylabel('Voltage (V)');
% end

% % Plot the raw ECG signals in a separate figure
% figure(4);
% set(gcf, 'Name', 'Raw ECG Signals', 'NumberTitle', 'off');
% for i = 1:num_signals
%     subplot(num_signals, 1, i);
%     plot((0:duration*fs-1)/fs, ecg_data{i}.(ecg_data{i}.Properties.VariableNames{1}));
%     title(sprintf('ECG Signal %d (Raw)', i));
%     xlabel('Time (s)');
%     ylabel('Voltage (V)');
% end

% % Plot the low-pass filtered ECG signals in a separate figure
% figure(5);
% set(gcf, 'Name', 'Low-pass Filtered ECG Signals', 'NumberTitle', 'off');
% for i = 1:num_signals
%     subplot(num_signals, 1, i);
%     filtered_signal_lp = filter(lp_filter, 1, ecg_data{i}.(ecg_data{i}.Properties.VariableNames{1}));
%     plot((0:duration*fs-1)/fs, filtered_signal_lp);
%     title(sprintf('ECG Signal %d (Low-pass Filtered)', i));
%     xlabel('Time (s)');
%     ylabel('Voltage (V)');
% end

% % Plot the notch filtered ECG signals in a separate figure
% figure(6);
% set(gcf, 'Name', 'Notch Filtered ECG Signals', 'NumberTitle', 'off');
% for i = 1:num_signals
%     subplot(num_signals, 1, i);
%     filtered_signal_notch = filter(notch_b, notch_a, filter(lp_filter, 1, ecg_data{i}.(ecg_data{i}.Properties.VariableNames{1})));
%     plot((0:duration*fs-1)/fs, filtered_signal_notch);
%     title(sprintf('ECG Signal %d (Notch Filtered)', i));
%     xlabel('Time (s)');
%     ylabel('Voltage (V)');
% end

% % Automatically detect the heart rate
% figure(7);
% set(gcf, 'Name', 'Heart Rate Detection', 'NumberTitle', 'off');
% for i = 1:num_signals
%     % Extract the notch filtered ECG signal
%     filtered_signal = filter(notch_b, notch_a, filter(lp_filter, 1, ecg_data{i}.(ecg_data{i}.Properties.VariableNames{1})));
    
%     % Detect R-peaks (simple thresholding method)
%     threshold = 0.5 * max(filtered_signal); % Example threshold
%     [pks, locs] = findpeaks(filtered_signal, 'MinPeakHeight', threshold, 'MinPeakDistance', fs*0.6); % Assuming heart rate > 60 bpm
    
%     % Calculate heart rate
%     heart_rate = length(pks) / (duration / 60); % Beats per minute
    
%     % Plot the filtered signal with detected peaks
%     subplot(num_signals, 1, i);
%     plot((0:duration*fs-1)/fs, filtered_signal);
%     hold on;
%     plot(locs/fs, pks, 'ro');
%     hold off;
%     title(sprintf('ECG Signal %d (Heart Rate: %.2f bpm)', i, heart_rate));
%     xlabel('Time (s)');
%     ylabel('Voltage (V)');
% end

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

% Design a Parks-McClellan low-pass filter
lp_cutoff = 40; % Low-pass filter cutoff frequency in Hz
[lp_order, lp_freqs, lp_amps, lp_weights] = firpmord([lp_cutoff lp_cutoff+10], [1 0], [0.01 0.01], fs);
lp_filter = firpm(lp_order, lp_freqs, lp_amps, lp_weights);

% Design a 60 Hz notch filter
notch_freq = 60; % Notch filter frequency in Hz
notch_bw = 1; % Notch filter bandwidth in Hz
[notch_b, notch_a] = iirnotch(notch_freq/(fs/2), notch_bw/(fs/2));

% Plot the raw and filtered ECG signals side by side
figure(3);
set(gcf, 'Name', 'Figure 3: ECG Signals', 'NumberTitle', 'off');
for i = 1:num_signals
    % Extract the raw ECG signal
    raw_signal = ecg_data{i}.(ecg_data{i}.Properties.VariableNames{1});
    
    % Apply the low-pass filter
    filtered_signal_lp = filter(lp_filter, 1, raw_signal);
    
    % Apply the notch filter
    filtered_signal_notch = filter(notch_b, notch_a, filtered_signal_lp);
    
    % Plot the raw signal
    subplot(num_signals, 3, (i-1)*3 + 1);
    plot((0:duration*fs-1)/fs, raw_signal);
    title(sprintf('ECG Signal %d (Raw)', i));
    xlabel('Time (s)');
    ylabel('Voltage (V)');
    
    % Plot the low-pass filtered signal
    subplot(num_signals, 3, (i-1)*3 + 2);
    plot((0:duration*fs-1)/fs, filtered_signal_lp);
    title(sprintf('ECG Signal %d (Low-pass Filtered)', i));
    xlabel('Time (s)');
    ylabel('Voltage (V)');
    
    % Plot the notch filtered signal
    subplot(num_signals, 3, (i-1)*3 + 3);
    plot((0:duration*fs-1)/fs, filtered_signal_notch);
    title(sprintf('ECG Signal %d (Notch Filtered)', i));
    xlabel('Time (s)');
    ylabel('Voltage (V)');
end

% Plot the raw ECG signals in a separate figure
figure(4);
set(gcf, 'Name', 'Figure 4: Raw ECG Signals', 'NumberTitle', 'off');
for i = 1:num_signals
    subplot(num_signals, 1, i);
    plot((0:duration*fs-1)/fs, ecg_data{i}.(ecg_data{i}.Properties.VariableNames{1}));
    title(sprintf('ECG Signal %d (Raw)', i));
    xlabel('Time (s)');
    ylabel('Voltage (V)');
end

% Plot the low-pass filtered ECG signals in a separate figure
figure(5);
set(gcf, 'Name', 'Figure 5: Low-pass Filtered ECG Signals', 'NumberTitle', 'off');
for i = 1:num_signals
    subplot(num_signals, 1, i);
    filtered_signal_lp = filter(lp_filter, 1, ecg_data{i}.(ecg_data{i}.Properties.VariableNames{1}));
    plot((0:duration*fs-1)/fs, filtered_signal_lp);
    title(sprintf('ECG Signal %d (Low-pass Filtered)', i));
    xlabel('Time (s)');
    ylabel('Voltage (V)');
end

% Plot the notch filtered ECG signals in a separate figure
figure(6);
set(gcf, 'Name', 'Figure 6: Notch Filtered ECG Signals', 'NumberTitle', 'off');
for i = 1:num_signals
    subplot(num_signals, 1, i);
    filtered_signal_notch = filter(notch_b, notch_a, filter(lp_filter, 1, ecg_data{i}.(ecg_data{i}.Properties.VariableNames{1})));
    plot((0:duration*fs-1)/fs, filtered_signal_notch);
    title(sprintf('ECG Signal %d (Notch Filtered)', i));
    xlabel('Time (s)');
    ylabel('Voltage (V)');
end

% Automatically detect the heart rate
figure(7);
set(gcf, 'Name', 'Figure 7: Heart Rate Detection', 'NumberTitle', 'off');
for i = 1:num_signals
    % Extract the notch filtered ECG signal
    filtered_signal = filter(notch_b, notch_a, filter(lp_filter, 1, ecg_data{i}.(ecg_data{i}.Properties.VariableNames{1})));
    
    % Detect R-peaks (simple thresholding method)
    threshold = 0.5 * max(filtered_signal); % Example threshold
    [pks, locs] = findpeaks(filtered_signal, 'MinPeakHeight', threshold, 'MinPeakDistance', fs*0.6); % Assuming heart rate > 60 bpm
    
    % Calculate heart rate
    heart_rate = length(pks) / (duration / 60); % Beats per minute
    
    % Plot the filtered signal with detected peaks
    subplot(num_signals, 1, i);
    plot((0:duration*fs-1)/fs, filtered_signal);
    hold on;
    plot(locs/fs, pks, 'ro');
    hold off;
    title(sprintf('ECG Signal %d (Heart Rate: %.2f bpm)', i, heart_rate));
    xlabel('Time (s)');
    ylabel('Voltage (V)');
end