function [filtered_signal] = FilterBandpass(original_signal)
Fs = 173.61;                                                  % Sampling Frequency (Hz)
Fn = Fs/2;                                                  % Nyquist Frequency (Hz)
Wp = [0.53   40]/Fn;                                    % Passband Frequency (Normalised)
Ws = [0.5   80]/Fn;                                         % Stopband Frequency (Normalised)
% Wp = [0.4   30]/Fn;                                    % Passband Frequency (Normalised)
% Ws = [0.3   40]/Fn;                                         % Stopband Frequency (Normalised)
Rp =   1;                                                   % Passband Ripple (dB)
Rs = 150;                                                   % Stopband Ripple (dB)
[n,Ws] = cheb2ord(Wp,Ws,Rp,Rs);                             % Filter Order
[z,p,k] = cheby2(n,Rs,Ws);                                  % Filter Design
[sosbp,gbp] = zp2sos(z,p,k);                                % Convert To Second-Order-Section For Stability
%figure(3);
%freqz(sosbp, 2^16, Fs);                                      % Filter Bode Plot
filtered_signal = filtfilt(sosbp, gbp, original_signal);
end