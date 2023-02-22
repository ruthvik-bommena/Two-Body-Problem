function Calculate_LambertHC
%%  < File Description >
%    Author:        Ruthvik Bommena
%    File Name:     LambertHC.m
%    Compiler:      MATLAB R2022b
%    Date:          10 February, 2023
%    Affiliation:   Department of Aerospace Engineering, University of Illinois Urbana-Champaign.
%    Description:   Function to calculate delta V using Lambert's Equation
%    References:    Ch 5. Orbital Mechanics for Engineering Students, 2013, Howard Curtis.

constants;

R1 = [5000, 10000, 2100];
R2 = [-14600, 2500, 7000];
tf = 3600;

[V1,V2] = LambertHC(R1,R2,tf,muE)

end