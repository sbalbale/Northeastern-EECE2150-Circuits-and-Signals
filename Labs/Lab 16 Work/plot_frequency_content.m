function plot_frequency_content(signal, sampling_rate, nfft);

    %% plot_frequency_content takes the FFT of an input signal and, using the
    %% supplied sampling rate Fs, plots the magnitude results from 0 to Fs/2
    %%
    %% function plot_frequency_content(signal,sampling_rate, nfft);
    %%
    %%
    %% Input arguments:
    %%
    %%    signal: the signal whose FFT is to be plotted
    %%    sampling_rate: sampling rate to use to determine how to mark the upper limit of
    %%    		     the horizontal axis in the plot
    %%    nfft: (optional): length of the fft
    %%
    %%  if nfft is not supplied it is set to the length of the signal
    %%
    %%  WARNING:  nfft, if supplied,  must be >= length of signal or error is returned

    % get length of signal and set nfft to that value if it is not supplied in
    % input argument string

    siglength = length(signal);

    if nargin < 3
        nfft = siglength;
    end

    % check to make sure nfft >= lenght of signal; if not return ERROR

    if (nfft < siglength)
        disp(['ERROR: length of FFT ' num2str(nfft) ' needs to be at least as long as signal length ' num2str(siglength)])
        return
    end

    % take fft

    fft_signal = fft(signal, nfft);

    % figure out which fft coefficient corresponds to 1/2 in DT per-sample
    % frequency (or pi in radian frequency)

    if (mod(nfft, 2) == 0)
        axislength = (nfft / 2) + 1;
    else
        axislength = (nfft + 1) / 2;
    end

    % figure out factor to convert from DT to CT frequency

    freq_conversion_factor = sampling_rate / nfft;

    % create vector of points for horizontal (frequency) axis

    freq_axis = (linspace(0, sampling_rate / 2, axislength));

    % plot the results
    fft_signal = fft_signal * freq_conversion_factor;
    plot(freq_axis, abs(fft_signal(1:axislength)));

    xlabel('Frequency (Hz)');
    ylabel(' Signal Spectrum');
    return
