% Given values
R = 2 * 10^3; % Resistance in ohms
L = 500 * 10^-3; % Inductance in henrys
C = 31.25 * 10^-9; % Capacitance in farads
a = 28; % Amplitude of the voltage source in volts
w = 8000; % Angular frequency in radians per second

syms v0

Zc = 1/(1i*w*C); % Impedance of the capacitor in ohms
Zl = 1i*w*L; % Impedance of the inductor in ohms

% Applying KVL to the loop
% v0 = vg_amplitude * exp(1i * 0) + Zc * i0 + Zl * i0
% ((v0 - a ) / Zc) + (v0 / R) + (v0 / Zl) = 0 % Equation 1

% Solving the equation
v0 = solve(((v0 - a ) / Zc) + (v0 / R) + (v0 / Zl) == 0,v0)

x = v0
rho=double(abs(x))
theta=double(rad2deg(angle(x)))
