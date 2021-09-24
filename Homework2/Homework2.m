%% ME EN 6200 Homework 2 Ryan Dalby
%%
clear;
close all;
%% Problem 5
omega_n = 100; % Hz natural frequency
zeta = 0.01; % Damping constant
K = 3.6;

G = tf((K*omega_n^2),[1, (2*zeta*omega_n), (omega_n^2)]);
u = @(t) t.*heaviside(t) - t.*heaviside(t-1) + heaviside(t-1) - heaviside(t-2) - (t-3).*heaviside(t-2) + (t-3).*heaviside(t-3);
dt = 0.001;
t_vals = 0:dt:3;

% a
figure;
lsim(G,u(t_vals),t_vals);
title('Amplitude vs Time Response for G(s)');
legend('response');

% c
figure;
step(G,3);
title('Amplitude vs Time Unit Step Response for G(s)');
legend('response');

% d
step_response = step(G,3);
fprintf('The final value of the unit step response is %.2f\n',step_response(end));


