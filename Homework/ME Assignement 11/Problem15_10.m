% Given variables
syms s R1 R2 C1 C2

% Part A: Transfer Function H(s)
Zin = R1 / (1 + s*R1*C1);
Zf = R2 / (1 + s*R2*C2);
H_s = -Zf / Zin;
H_s = simplify(H_s);
fprintf('Part A: H(s) = %s\n', H_s);

% Part B: Gain as ω → 0
H_j0 = limit(H_s, s, 0);
fprintf('Part B: H(j0) = %s\n', H_j0);

% Part C: Gain as ω → ∞
H_jinf = limit(H_s, s, inf);
fprintf('Part C: H(j∞) = %s\n', H_jinf);