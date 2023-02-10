%% Ruthvik Bommena
% February 8th, 2023
% Function to plot s/c trajectory from f and g solutions

function Calculate_FGfunc

close all; clc;
constants;

r0 = [-8903.833 1208.356 213.066]; %km
v0 = [-0.971 -6.065 -1.069]; %km/s

[r,v] = FGfunc(r0,v0,10800,muE);

end