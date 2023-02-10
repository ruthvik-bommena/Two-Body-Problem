%% Ruthvik Bommena
% February 8th, 2023
% Function to calculte State Vectors from Orbital Elements

function Calculate_ElmToState

close all; clc;

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