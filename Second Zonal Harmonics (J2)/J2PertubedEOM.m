function [t,X] = J2PertubedEOM(R0,V0,Radius,mu,J2,tf)
%%  < File Description >
%    Author:        Ruthvik Bommena
%    File Name:     J2PertubedEOM.m
%    Compiler:      MATLAB R2022b
%    Date:          08 March, 2023
%    Affiliation:   Department of Aerospace Engineering, University of Illinois Urbana-Champaign.
%    Description:   Function to propagate pertubed J2 EOMs numerically 
%    Inputs:        Initial state vector R0 and V0, radius of the body,
%                   gravitational parameter 'mu', zonal harmonics 'J2'.
%    References:    Orbital Mechanics, 2013, J.E. Prussing and B.A. Conway

% initial state vector
X0 = [R0, V0];
t0 = 0;

% set ode tolerance
options = odeset('RelTol',1e-13,'AbsTol',1e-15);

% ode propagator
[t,X] = ode89(@pJ2Orbit,[t0 tf],X0,options,Radius,mu,J2);

end


%  J2 pertubed EOMs
function dydt = pJ2Orbit(~,X,Radius,mu,J2)

I = [1 0 0];
J = [0 1 0];
K = [0 0 1];

r = norm(X(1:3));

pJ2 = ((3*J2*mu*Radius^2)/(2*r^4))*(((X(1)/r)*(5*(X(3)/r)^2 - 1))*I + ((X(2)/r)*(5*(X(3)/r)^2 - 1))*J + ((X(3)/r)*(5*(X(3)/r)^2 - 3))*K);

dydt = [X(4); X(5); X(6); -mu*X(1)/r^3 + pJ2(1); -mu*X(2)/r^3 + pJ2(2); -mu*X(3)/r^3 + pJ2(3)];

end