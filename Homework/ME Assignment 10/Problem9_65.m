% Given values
R1 = 800;
R2 = 600;
L = 400 * 10^-3;
C = 250 * 10^-9;

amplitude = 75;
theta = 0;

Vg = amplitude * (cosd(theta) + i * sind(theta));
W = 5000;

Zl = i*W*L
Zc = 1/(i*W*C)

(R2+Zl) / (R1+R2+Zl+Zc)

v0 = Vg * (R2+Zl) / (R1+R2+Zl+Zc)


x = v0;
rho = double(abs(x))
theta = double(rad2deg(angle(x)))