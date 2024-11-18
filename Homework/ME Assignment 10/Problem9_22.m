syms R L C
w=700; 

% For finding R and L
XL=w*L;
Z= R*XL*1i/(R+XL*1i);
eq1= (R*XL^2)/(R^2+XL^2)==20;
eq2= (R^2*XL)/(R^2+XL^2)==40;
sol=solve(eq1,eq2)
Z = subs(Z,[L,R],[sol.L,sol.R]) %Verification
XL=700*sol.L

% For finding R and C
XC=1/(w*C);
Z= R*XC*(-1i)/(R-XC*1i);
eq1= (R*XC^2)/(R^2+XC^2)==20;
eq2= (R^2*XC)/(R^2+XC^2)==40;
sol=solve(eq1,eq2)
Z = subs(Z,[C,R],[sol.C,sol.R]) %Verification
XC=1/(w*sol.C)