function [a,e,i,alpha,omega,f] = StateToElm(R0,V0,mu)
%%  < File Description >
%    Author:        Ruthvik Bommena
%    File Name:     StateToElm.m
%    Compiler:      MATLAB R2022b
%    Date:          10 February, 2023
%    Affiliation:   Department of Aerospace Engineering, University of Illinois Urbana-Champaign.
%    Description:   Function to convert State Vectors to Orbital Elements
%    Inputs:        State vectors and gravitational parameter
%    References:    Ch 3. Orbital Mechanics, 2013, J.E. Prussing and B.A. Conway

r0 = norm(R0);
v0 = norm(V0);

a = (r0*mu)/(2*mu - v0^2*r0); % semimajor axis

eVec = (v0^2/mu - 1/r0)*R0 - (1/mu * dot(R0,V0) * V0);
e = norm(eVec); % eccentricity

h = cross(R0,V0); 
hMag = norm(h);

I = [1 0 0];
J = [0 1 0];
K = [0 0 1];

i = acosd(dot(h,K) / hMag); % inclination

n = cross(K, h/hMag);
nMag = norm(n);

alpha = acosd(dot(n,I) / nMag); % Right Ascension of Ascending Node (RAAN)
check = dot(n,J);
if check<0
    alpha = 360 - alpha;
else 
    alpha = alpha;
end

omega = acosd(dot(n,eVec) / (nMag*e)); % Argument of Periapse
check2 = dot(eVec,K);
if check2>0
    omega = omega;
else 
    omega = 360 - omega;
end

f = acosd(dot(eVec,R0) / (e*r0)); % True Anamoly
check3 = dot(R0,V0);
if check3>0
    f = f;
else
    f = 360-f;
end

end