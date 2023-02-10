%% Ruthvik Bommena
% February 9th, 2023
% Function to calculate (r,v) at time t, given (r0,v0) at time t0
% where t=t0+dT

function Calculate_StateAtDT

close all; clc;

constants;

% Initial Conditions
R0 = [7000, -12124, 0];
V0 = [2.6679, 4.6210, 0];
dT = 60*60;

[R,V] = StateAtDT(R0,V0,dT,muE);

end