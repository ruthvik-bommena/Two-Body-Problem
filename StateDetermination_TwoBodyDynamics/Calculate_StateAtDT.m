function Calculate_StateAtDT
%%  < File Description >
%    Author:        Ruthvik Bommena
%    File Name:     Calculate_StateAtDT.m
%    Compiler:      MATLAB R2022b
%    Date:          10 February, 2022
%    Affiliation:   Department of Aerospace Engineering, University of Illinois Urbana-Champaign.
%    Description:   Function to calculate (r,v) at time t, given (r0,v0) at time t0 where t=t0+dT
%    References:    Ch 3. Orbital Mechanics for Engineering Students, 2013, Howard Curtis.

constants;

% Initial Conditions
R0 = [7000, -12124, 0];
V0 = [2.6679, 4.6210, 0];
dT = 60*60;

[R,V] = StateAtDT(R0,V0,dT,muE)

end