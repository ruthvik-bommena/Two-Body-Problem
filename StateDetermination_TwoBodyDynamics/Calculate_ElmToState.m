function Calculate_ElmToState
%%  < File Description >
%    Author:        Ruthvik Bommena
%    File Name:     Calculate_ElmToState.m
%    Compiler:      MATLAB R2022b
%    Date:          10 February, 2022
%    Affiliation:   Department of Aerospace Engineering, University of Illinois Urbana-Champaign.
%    Description:   Function to calculte State Vectors from Orbital Elements
%    References:    Ch 3. Orbital Mechanics, 2013, J.E. Prussing and B.A. Conway

constants; 

a = 8000; %km
e = 0.125;
% Input Orbital Elements in degrees
i = 10;
alpha = 45; % RAAN
omega = 10; % AOP
M = 170;

[r,v] = ElmToState(a,e,i,alpha,omega,M,muE);

end