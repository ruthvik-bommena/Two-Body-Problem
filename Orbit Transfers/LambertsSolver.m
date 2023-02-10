function [a,v1,v2,dv1,dv2,dv] = LambertsSolver(r1Vec,r2Vec,v1Vec,v2Vec,tf,mu)
%%  < File Description >
%    File Name:     LambertsSolver.m
%    Compiler:      MATLAB R2022b
%    Created by:    Ruthvik Bommena
%    Date:          10 February, 2022
%    Affiliation:   Department of Aerospace Engineering, University of Illinois Urbana-Champaign.
%    Description:   Function to solve Lambert's Equation
%    Inputs:        State vectors of departure and arrival points, time of
%    flight, and gravitational parameter
%    References:    Ch 5. Orbital Mechanics, 2013, J.E. Prussing and B.A. Conway

r1 = norm(r1Vec);
r2 = norm(r2Vec);

theta = acos(r1Vec*r2Vec'/(r1*r2));
theta = 2*pi-theta;

c = sqrt(r1^2 + r2^2 - 2*r1*r2*cos(theta)); % chord
s = (r1 + r2 + c)/2; % semiperimeter

a_m = s/2;

alpha_m = 2*asin(sqrt(s/(2*a_m)));
beta_m = 2*asin(sqrt((s-c)/(2*a_m)));

if theta >=0 && theta < pi
    beta_m = beta_m;
elseif theta >= pi && theta < 2*pi
    beta_m = -beta_m;                 
end

% Transfer time for minimum semimajor axis ellipse
tm = sqrt(a_m^3/mu)*(alpha_m - beta_m - (sin(alpha_m) - sin(beta_m)));

%fzero function
lambertFunc = @(a) lambert(a,theta,c,s,tm,tf);
a = fzero(lambertFunc,1.1);

alpha0 = 2*asin(sqrt(s/(2*a)));
beta0 = 2*asin(sqrt((s-c)/(2*a)));

if theta >=0 && theta < pi
    beta = beta0;
elseif theta >= pi && theta < 2*pi
    beta = -beta0;                 
end

if tf <= tm
    alpha = alpha0;
elseif tf > tm
    alpha = 2*pi - alpha0;
end

% Velocity of transfer ellipse
u1 = r1Vec/r1;                  
u2 = r2Vec/r2;
uc = (r2Vec-r1Vec)/c;

A = sqrt(mu/(4*a)) * cot(alpha/2);
B = sqrt(mu/(4*a)) * cot(beta/2);

% Terminal velocity vectors on transfer ellipse
v1 = (B+A)*uc + (B-A)*u1;
v2 = (B+A)*uc - (B-A)*u2;

% Terminal DVs
dv1 = v1-v1Vec;
dv2 = v2-v2Vec;

% Total DV
dv = norm(dv1) + norm(dv2);

end

%% Semimajor axis calculation
function f = lambert(a,theta,c,s,tm,tf)

alpha_0 = 2*asin(sqrt(s/(2*a)));
beta_0 = 2*asin(sqrt((s-c)/(2*a)));

if theta >=0 && theta < pi
    beta = beta_0;
elseif theta >= pi && theta < 2*pi
    beta = -beta_0;                 
end

if tf <= tm
    alpha = alpha_0;
elseif tf > tm
    alpha = 2*pi - alpha_0;
end

f = tf-(a^(3/2))*(alpha-beta-sin(alpha)+sin(beta));

end