% Given values
R1 = 5 * 10^3; % Resistance in ohms
R2 = 1.2 * 10^3; % Resistance in ohms
L = 200 * 10^-3; % Inductance in henrys
C = 50 * 10^-9; % Capacitance in farads
a = 7.5; % Amplitude of the voltage source in volts

syms w

% Solving the equation
w_solutions = double(solve((-L*w) / (R2^2 + (L^2)*(w^2)) + C*w == 0, w));

% Filter out the positive real solution
w_correct = w_solutions(w_solutions > 0 & imag(w_solutions) == 0)

% Display the correct solution
fprintf('The correct solution for w is: %.3f rad/s\n', w_correct);

Yeq = 1 / R1 + (R2) / (R2^2 + (w_correct*L)^2)

Zeq = 1 / Yeq

v= a*Zeq / 1000

fprintf('The amplitude of the current is: %.3f A\n', v);
fprintf('The correct solution for w is: %.3f rad/s\n', w_correct);
fprintf('The phase angle of the current is: %.3f degrees\n', rad2deg(angle(v)));
% x = w_correct;
% rho = double(abs(x));
% theta = double(rad2deg(angle(x)));