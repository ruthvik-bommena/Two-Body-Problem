function Calculate_FGfunc
%%  < File Description >
%    File Name:     Calculate_FGfunc.m
%    Compiler:      MATLAB R2022b
%    Created by:    Ruthvik Bommena
%    Date:          10 February, 2022
%    Affiliation:   Department of Aerospace Engineering, University of Illinois Urbana-Champaign.
%    Description:   Function to calculate s/c trajectory from f and g solutions
%    References:    Ch 2. Orbital Mechanics, 2013, J.E. Prussing and B.A. Conway

constants;

r0 = [-8903.833 1208.356 213.066]; %km
v0 = [-0.971 -6.065 -1.069]; %km/s

[r,v] = FGfunc(r0,v0,10800,muE);

end