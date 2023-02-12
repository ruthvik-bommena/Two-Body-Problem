function [x,alpha,C,S] = Calculate_UniversalAnomalyX(R0,V0,dT,mu)
%%  < File Description >
%    Author:        Ruthvik Bommena
%    File Name:     Calculate_UniversalAnomalyX.m
%    Compiler:      MATLAB R2022b
%    Date:          10 February, 2023
%    Affiliation:   Department of Aerospace Engineering, University of Illinois Urbana-Champaign.
%    Description:   Function to calculate universal anomaly X from universal Kepler's equation
%    Inputs:        Initial state vectors, change in time dT, gravitational parameter 'mu'
%    References:    Ch 3. Orbital Mechanics for Engineering Students, 2013, Howard Curtis.

r0 = norm(R0);
v0 = norm(V0);
vr0 =  dot(R0,V0)/r0; % radial velocity

% hyperbolas a<0, parabolas a = inf, ellipses a>0
a = ((r0*mu)/(2*mu - v0^2*r0));

[x,ratio,alpha,C,S] = UniversalKepler(r0,vr0,dT,mu,a);

end