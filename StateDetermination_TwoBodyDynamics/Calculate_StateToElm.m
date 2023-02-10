%% Ruthvik Bommena
% February 8th, 2023
% Function to calculte Orbital Elements from State Vectors 

function Calculate_StateToElm

close all; clc;

constants; 

r0 = [-6115.75 -6586.18 -58.65]; %km
v0 = [4.42 -4.26 -1.08]; %km/s

[a,e,i,alpha,omega,f] = StateToElm(r0,v0,muE);

end