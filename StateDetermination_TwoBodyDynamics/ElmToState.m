function [r,v] = ElmToState(a,e,i,alpha,omega,M,mu)
%%  < File Description >
%    Author:        Ruthvik Bommena
%    File Name:     ElmToState.m
%    Compiler:      MATLAB R2022b
%    Date:          10 February, 2022
%    Affiliation:   Department of Aerospace Engineering, University of Illinois Urbana-Champaign.
%    Description:   Function to convert State Vectors to Orbital Elements
%    Inputs:        Orbital Elements (a,e,i,alpha,omega), Mean Anamoly M, gravitational parameter mu
%    References:    Ch 3. Orbital Mechanics, 2013, J.E. Prussing and B.A. Conway

% convert to radians
i = i*pi/180;
alpha = alpha*pi/180; 
omega = omega*pi/180; 
M = M*pi/180; 

E = M; % Guess E0
g = 1;

itr = 0;
while abs(g) > 1e-13
    
    g    = E-e*sin(E)-M;
    dgdE = 1-e*cos(E);
    
    E1 = E - g/dgdE;
    
    % Update
    E = E1;
    
    itr = itr + 1;
    
end

f = 2*atan(sqrt((1+e)/(1-e)) * tan(E/2));

theta = omega + f;

h = sqrt(mu*a*(1-e^2));

I = [1 0 0];
J = [0 1 0];
K = [0 0 1];

rMag = a*(1 - (e*cos(E)));

r = rMag*(((cos(theta)*cos(alpha) - cos(i)*sin(alpha)*sin(theta))*I) + ((cos(theta)*sin(alpha) + cos(i)*cos(alpha)*sin(theta))*J) + ((sin(i)*sin(theta))*K));
v = ((-mu/h)*(cos(alpha)*(sin(theta)+e*sin(omega)) + sin(alpha)*cos(i)*(cos(theta)+e*cos(omega))))*I - ((mu/h)*(sin(alpha)*(sin(theta)+e*sin(omega)) - cos(alpha)*cos(i)*(cos(theta)+e*cos(omega))))*J + ((mu/h)*(cos(theta)+e*cos(omega))*sin(i))*K;

end
