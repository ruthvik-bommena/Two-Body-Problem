function Calculate_Lamberts
%%  < File Description >
%    Author:        Ruthvik Bommena
%    File Name:     Calculate_Lamberts.m
%    Compiler:      MATLAB R2022b
%    Date:          10 February, 2022
%    Affiliation:   Department of Aerospace Engineering, University of Illinois Urbana-Champaign.
%    Description:   Function to calculate delta V using Lambert's Equation
%    References:    Ch 5. Orbital Mechanics, 2013, J.E. Prussing and B.A. Conway

constants;
TU = sqrt(AU^3/muS);
mu = 1; % Gravitational Parameter
tf = 410*86400/TU; % TOF in TU

% in DU & DU/TU
r1Vec = [-1.152298994309664E+08, -9.900155838813813E+07, 3.696167672807723E+04]./AU; 
v1Vec = [1.897300201461335E+01, -2.268665080580648E+01, 5.966729305662000E-04]./AU*TU;

r2Vec = [-7.850925795703618E+07, 1.374546686841051E+08, -9.195926177815042E+06]./AU;
v2Vec = [-2.455504321364110E+01, -1.023862606665380E+01, -3.504079122987891E-02]./AU*TU; 

[a,v1,v2,dv1,dv2,dv] = LambertSolver(r1Vec,r2Vec,v1Vec,v2Vec,tf,mu);

end