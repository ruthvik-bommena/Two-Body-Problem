function Plot_J2PertubedOrbit
%%  < File Description >
%    Author:        Ruthvik Bommena
%    File Name:     Plot_J2PertubedOrbit.m
%    Compiler:      MATLAB R2022b
%    Date:          08 March, 2023
%    Affiliation:   Department of Aerospace Engineering, University of Illinois Urbana-Champaign.
%    Description:   Function to plot pertubed J2 orbit and time evolution of orbital elements

close all; clc;

constants; 

% Orbital Elements for a Molniya Orbit
a = 26600; %km
e = 0.74;
% input in degrees
i = rad2deg(1.10654);
alpha = 90; % RAAN
omega = 5; % AOP
M = 10;

% Time
time = 100; % days
tf = time*86400; % sec

% Earth Zonal Harmonics
J2 = 0.00108263;

% State vector
[R0,V0] = ElmToState(a,e,i,alpha,omega,M,muE);

% J2 Pertubation
[t,X] = J2PertubedEOM(R0,V0,RE,muE,J2,tf);

% Time Evolution of Orbital Elements
a = zeros(1,length(X)); e = zeros(1,length(X));
i = zeros(1,length(X)); alpha = zeros(1,length(X));
omega = zeros(1,length(X)); f = zeros(1,length(X));

for ii = 1:length(X)
    [a(ii),e(ii),i(ii),alpha(ii),omega(ii),f(ii)] = StateToElm(X(ii,1:3),X(ii,4:6),muE);
end

% Plots
plots(t,X,a,e,i,alpha,omega,f)

end


% Plots Function
function plots(t,X,a,e,i,alpha,omega,f)

% Plot Trajectory
figure; hold on; grid on; view(3); axis("equal");
earth_sphere;
plot3(X(:,1),X(:,2),X(:,3),'-k','LineWidth',0.1,'DisplayName','Pertubed J2 Orbit')
xlabel('x-Distance (km)'); ylabel('y-Distance (km)'); zlabel('z-Distance (km)')
title('Earth’s J2 Perturbation on a Molniya Orbit')
legend('show','Location','best')

% Plot Variation of Orbital Elements
figure; sgtitle('Variation of Orbital Elements');
subplot 321; grid on; hold on; 
plot(t/86400,a,'-b','DisplayName','Semi-major Axis');
xlabel('Time (days)'); ylabel('a (km)');
title('Semi-major Axis')

subplot 322; grid on; hold on; 
plot(t/86400,e,'-b','DisplayName','eccentricity');
xlabel('Time (days)'); ylabel('e');
title('Eccentricity')

subplot 323; grid on; hold on; 
plot(t/86400,i,'-b','DisplayName','inclination');
xlabel('Time (days)'); ylabel('i (deg)');
title('Inclination')

subplot 324; grid on; hold on; 
plot(t/86400,alpha,'DisplayName','RAAN');
xlabel('Time (days)'); ylabel('\Omega (deg)');
title('Right Ascension of Ascending Node')

subplot 325; grid on; hold on; 
plot(t/86400,omega,'DisplayName','AOP');
xlabel('Time (days)'); ylabel('\omega (deg)');
title('Argument of Perigee')

subplot 326; grid on; hold on; 
plot(t/86400,f,'DisplayName','True Anomaly');
xlabel('Time (days)'); ylabel('f (deg)');
title('True Anomaly')

end
