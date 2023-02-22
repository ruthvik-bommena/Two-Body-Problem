function C = stumpffC(z)
%%  < File Description >
%    Author:        Ruthvik Bommena
%    File Name:     stumpffC.m
%    Compiler:      MATLAB R2022b
%    Date:          10 February, 2023
%    Affiliation:   Department of Aerospace Engineering, University of Illinois Urbana-Champaign.
%    Description:   Function to calculate Stumpff function C(z)
%    Inputs:        z (z=alpha*x^2), where 'alpha' is 1/a, 'x' is the universal
%    anomaly, and 'a' is the semimajor axis
%    References:    Ch 3. Orbital Mechanics for Engineering Students, 2013, Howard Curtis.

    if z>0
        C = (1-cos(sqrt(z)))/z;
    elseif z<0
        C = (cosh(sqrt(-z))-1)/-z;
    else
        C = 1/2;
    end

end