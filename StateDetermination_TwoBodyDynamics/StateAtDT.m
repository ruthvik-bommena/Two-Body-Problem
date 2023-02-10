%% Ruthvik Bommena
% February 9th, 2023
% Function to calculate (r,v) at time t, given (r0,v0) at time t0
% Utilizes function to calculate universal anomaly X from universal Kepler's equation
% dT = abs(t-t0)

function [R,V] = StateAtDT(R0,V0,dT,mu)

r0 = norm(R0);
v0 = norm(V0);

[x,alpha,C,S] = Calculate_UniversalAnomalyX(R0,V0,dT,mu); 

f = 1 - (x^2/r0)*C;
g = dT - (1/sqrt(mu))*x^3*S;

R = f*R0 + g*V0; % Position at time=t0+dT
r = norm(R);

fDot = sqrt(mu)*(alpha*x^3*S - x)/(r*r0);
gDot = 1 - x^2*C/r;

V = fDot*r0 + gDot*v0;  % Velocity at time=t0+dT
v = norm(V);

end