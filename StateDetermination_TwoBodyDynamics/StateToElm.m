function [a,e,i,alpha,omega,f] = StateToElm(r0,v0,mu)
%%  < File Description >
%    File Name:     StateToElm.m
%    Compiler:      MATLAB R2022b
%    Created by:    Ruthvik Bommena
%    Date:          10 February, 2022
%    Affiliation:   Department of Aerospace Engineering, University of Illinois Urbana-Champaign.
%    Description:   Function to convert State Vectors to Orbital Elements
%    Inputs:        State vectors and gravitational parameter
%    References:    Ch 3. Orbital Mechanics, 2013, J.E. Prussing and B.A. Conway

rMag = norm(r0);
vMag = norm(v0);

a = (rMag*mu)/(2*mu - vMag^2*rMag); % semimajor axis

eVec = (vMag^2/mu - 1/rMag)*r0 - (1/mu * dot(r0,v0) * v0);
e = norm(eVec); % eccentricity

h = cross(r0,v0); 
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

f = acosd(dot(eVec,r0) / (e*rMag)); % True Anamoly
check3 = dot(r0,v0);
if check3>0
    f = f;
else
    f = 360-f;
end

end