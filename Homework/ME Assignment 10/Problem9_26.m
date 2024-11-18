
v0 = 240;
R = 80;
C = 2.5 * 10^-6;
L = 48 / 1000;
%ig = 350*cos(5000*t);
Ig = 350 / 1000;
w = 5000;

Xc = -1i / (w*C)

Xl = w*L*1i

Ic = (Ig * (R + Xl)) / (v0 + Xc + R +Xl)

V0 = v0 * Ic




x = V0
rho=abs(x)
theta=rad2deg(angle(x))

rho, w, theta