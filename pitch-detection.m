% Load audio file
[y, Fs] = audioread('audio_file.wav');

% Autocorrelation pitch detection
maxlag = round(0.01*Fs); % set maximum lag to 10 ms
R = xcorr(y, maxlag, 'coeff'); % compute autocorrelation
R(maxlag+1:end) = []; % keep only positive lags
[~, I] = max(R); % find peak location
pitch = Fs / I; % calculate fundamental frequency

% Display result
fprintf('Estimated fundamental frequency: %f Hz\n', pitch);
