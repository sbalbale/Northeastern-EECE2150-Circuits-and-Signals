% Given values
% Vg1 = 10cos(5000t + 53.13) V
% Vg2 = 2cos(5000t) V
R = 6;
L = 400 * 10^-6;
C = 50 * 10^-6;

amplitude1 = 45;
theta1 = 53.13;
amplitude2 = 9;
theta2 = 0;

Vg1 = amplitude1 * (cosd(theta1) + i * sind(theta1));
Vg2 = amplitude2 * (cosd(theta2) + i * sind(theta2));
W = 5000;

Zl = i*W*L
Zc = 1/(i*W*C)

syms v0
% Applying KVL to the loop
v0 = double(solve(((v0-Vg1) / Zl) + ((v0+Vg2) / Zc) + (v0 / R) == 0,v0))

x = v0;
rho = double(abs(x))
theta = double(rad2deg(angle(x)))