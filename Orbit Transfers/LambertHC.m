function [V1,V2] = LambertHC(R1,R2,t,mu)
%%  < File Description >
%    File Name:     LambertHC.m
%    Compiler:      MATLAB R2022b
%    Created by:    Ruthvik Bommena
%    Date:          10 February, 2022
%    Affiliation:   Department of Aerospace Engineering, University of Illinois Urbana-Champaign.
%    Description:   Function to solve Lambert's Equation
%    Inputs:        State vectors of departure and arrival points, time of
%    flight, and gravitational parameter
%    References:    Ch 5. Orbital Mechanics for Engineering Students, 2013, Howard Curtis.

r1 = norm(R1);
r2 = norm(R2);

theta = acos(dot(R1,R2)/(r1*r2));
cross12 = cross(R1,R2);

% Determine whether the orbit is prograde or retrograde:
    if theta<=pi
        string = 'pro';
    else 
        string = 'retro';
    end

% Determine transfer angle
    if strcmp(string, 'pro')
        if cross12(3) < 0
            theta = 2*pi - theta;
        end
    elseif strcmp(string,'retro')
        if cross12(3) >= 0
            theta = 2*pi - theta;
        end
    end

% A - a constant given by Equation 5.35
A = sin(theta)*sqrt((r1*r2)/(1-cos(theta)));

% Newton iteration to solve Eq. 5.39 for z
z = 1.5;
    while F(z,t,r1,r2,A,mu) < 0
        z = z + 0.1;
    end
iter = 1; iterMax = 10000;
ratio = 1; errMin = 1e-10;
    while abs(ratio)>errMin && iter<=iterMax
        ratio = F(z,t,r1,r2,A,mu)/dFdz(z,r1,r2,A);
        z = z - ratio;
        iter = iter+1;
    end

% Eq. 5.46
f = 1 - y(z,r1,r2,A)/r1;
g = A * sqrt(y(z,r1,r2,A)/mu);
gDot = 1 - y(z,r1,r2,A)/r2;

% Initial and final velocity vectors
V1 = 1/g * (R2 - f*R1);
V2 = 1/g * (gDot*R2 - R1);


% Eq. 5.38
function val = y(z,r1,r2,A)
    val = r1 + r2 + A*(z*S(z) - 1)/sqrt(C(z));
return

% Eq. 5.40
function val = F(z,t,r1,r2,A,mu)
    val = ((y(z,r1,r2,A)/C(z))^1.5)*S(z) + A*sqrt(y(z,r1,r2,A)) - sqrt(mu)*t;
return

% Eq. 5.43
function val = dFdz(z,r1,r2,A)
    if z == 0
        val = (sqrt(2)*y(z,r1,r2,A)^1.5)/40 + A/8*((sqrt(y(z,r1,r2,A)) + A*sqrt(1/(2*y(z,r1,r2,A)))));
    else
        val = ((y(z,r1,r2,A)/C(z))^1.5)*((1/2/z)*(C(z) - 3*S(z)/C(z)/2) + 3*S(z)^2/C(z)/4) + ...
               A/8 * (3*S(z)*sqrt(y(z,r1,r2,A))/C(z) + A*sqrt(C(z)/y(z,r1,r2,A)));
    end
return 

% Stumpff functions
function val = C(z)
    val = stumpffC(z);
return

function val = S(z)
    val = stumpffS(z);
return







