function [x,ratio,alpha,C,S] = UniversalKepler(r0,vr0,dT,mu,a)
%%  < File Description >
%    File Name:     UniversalKepler.m
%    Compiler:      MATLAB R2022b
%    Created by:    Ruthvik Bommena
%    Date:          10 February, 2022
%    Affiliation:   Department of Aerospace Engineering, University of Illinois Urbana-Champaign.
%    Description:   Function to solve universal Kepler's equation for the universal anomaly X
%    Inputs:        Magnitude of the position 'r0' and radial velocity
%    'vr0' at t0, change in time dT, gravitational parameter 'mu', and semimajor axis 'a'
%    References:    Ch 3. Orbital Mechanics for Engineering Students, 2013, Howard Curtis.

alpha = 1/a;

x = sqrt(mu)*abs(alpha)*dT;

iter = 1; iterMax = 1000;
ratio = 1; errMin = 1e-10;

    while abs(ratio)>errMin && iter<=iterMax
        C = stumpffC(alpha*x^2);
        S = stumpffS(alpha*x^2);
    
        f = ((r0*vr0)/sqrt(mu))*x^2*C + (1-alpha*r0)*x^3*S + r0*x - sqrt(mu)*dT;
        dfdx = ((r0*vr0)/sqrt(mu))*x*(1-alpha*x^2*S) + (1-alpha*r0)*x^2*C + r0;
    
        ratio = f/dfdx;
        x = x-ratio;
    
        iter = iter+1;
    end

end
