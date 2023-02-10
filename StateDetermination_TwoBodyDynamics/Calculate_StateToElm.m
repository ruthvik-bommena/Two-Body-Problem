function Calculate_StateToElm
%%  < File Description >
%    File Name:     Calculate_StateToElm.m
%    Compiler:      MATLAB R2022b
%    Created by:    Ruthvik Bommena
%    Date:          10 February, 2022
%    Affiliation:   Department of Aerospace Engineering, University of Illinois Urbana-Champaign.
%    Description:   Function to calculate Orbital Elements from State Vectors 
%    References:    Ch 3. Orbital Mechanics, 2013, J.E. Prussing and B.A. Conway

constants; 

r0 = [-6115.75 -6586.18 -58.65]; %km
v0 = [4.42 -4.26 -1.08]; %km/s

[a,e,i,alpha,omega,f] = StateToElm(r0,v0,muE);

end