function S = stumpffS(z)
%%  < File Description >
%    Author:        Ruthvik Bommena
%    File Name:     stumpffS.m
%    Compiler:      MATLAB R2022b
%    Date:          10 February, 2022
%    Affiliation:   Department of Aerospace Engineering, University of Illinois Urbana-Champaign.
%    Description:   Function to calculate Stumpff function S(z)
%    Inputs:        z (z=alpha*x^2), where 'alpha' is 1/a, 'x' is the universal
%    anomaly, and 'a' is the semimajor axis
%    References:    Ch 3. Orbital Mechanics for Engineering Students, 2013, Howard Curtis.

    if z>0
        S = (sqrt(z)-sin(sqrt(z)))/(sqrt(z))^3;
    elseif z<0
        S = (sinh(sqrt(-z))-sqrt(-z))/(sqrt(-z))^3;
    else
        S = 1/6;
    end

end