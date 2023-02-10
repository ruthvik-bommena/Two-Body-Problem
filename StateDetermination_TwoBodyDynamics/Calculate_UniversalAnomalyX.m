%% Ruthvik Bommena
% February 9th, 2023
% Function to calculate universal anomaly X from universal Kepler's equation

function [x,alpha,C,S] = Calculate_UniversalAnomalyX(R0,V0,dT,mu)

r0 = norm(R0);
v0 = norm(V0);
vr0 =  dot(R0,V0)/r0; % radial velocity

% hyperbolas a<0, parabolas a = inf, ellipses a>0
a = ((r0*mu)/(2*mu - v0^2*r0));

[x,ratio,alpha,C,S] = UniversalKepler(r0,vr0,dT,mu,a);

end