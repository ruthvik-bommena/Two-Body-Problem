%% Ruthvik Bommena
% February 8th, 2023
% Function to calculate s/c state using f and g solutions

function [r,v] = FGfunc(r0,v0,tf,mu)

rMag = norm(r0); 
vMag = norm(v0); 

a = (rMag*mu)/(2*mu - vMag^2*rMag); 
h = cross(r0,v0); 
hMag = sqrt(sum(h.^2));
e = sqrt(1 - ((hMag^2) / (mu * a)));

E0 = acos((1-rMag/a)*(1/e)); 

n = sqrt(mu/a^3);

tspan = linspace(0,tf,1000);

for ii = 1:length(tspan)
    
    M = n * tspan(ii); %rad/s
    X = E0 - e*sin(E0); 
    G = M + X;

E = G;
g = 1;

itr = 0;
while abs(g) > 1e-13
    
    g    = E-e*sin(E) - G;
    dgdE = 1-e*cos(E);
    
    E1 = E - g/dgdE;
    
    E = E1;
    
    itr = itr + 1;
    
end

F = 1 - (a/rMag)*(1-cos(E-E0));
G = tspan(ii) - sqrt(a^3/mu)*((E-E0)-sin(E-E0));

rVec = a * (1 - e * cos(E));

Fdot = -sqrt(mu*a)/(rMag*rVec) * sin(E-E0);
Gdot = 1 - (a/rVec) * (1-cos(E-E0));

rInt = F*r0 + G*v0;
vInt = Fdot*r0 + Gdot*v0;

r(ii,:) = rInt;
v(ii,:) = vInt;

end