function [R,V] = StateAtDT(R0,V0,dT,mu)
%%  < File Description >
%    Author:        Ruthvik Bommena
%    File Name:     StateAtDT.m
%    Compiler:      MATLAB R2022b
%    Date:          10 February, 2023
%    Affiliation:   Department of Aerospace Engineering, University of Illinois Urbana-Champaign.
%    Description:   Function to calculate (r,v) at time t, given (r0,v0) at time t0
%    Inputs:        Initial state vectors 'R0' and 'V0', change in time, 'dT', gravitational parameter 'mu'
%    References:    Ch 3. Orbital Mechanics for Engineering Students, 2013, Howard Curtis.

r0 = norm(R0);
v0 = norm(V0);

[x,alpha,C,S] = Calculate_UniversalAnomalyX(R0,V0,dT,mu); 

f = 1 - (x^2/r0)*C;
g = dT - (1/sqrt(mu))*x^3*S;

R = f*R0 + g*V0; % Position at time=t0+dT
r = norm(R);

fDot = sqrt(mu)*(alpha*x^3*S - x)/(r*r0);
gDot = 1 - x^2*C/r;

V = fDot*R0 + gDot*V0;  % Velocity at time=t0+dT
v = norm(V);

end