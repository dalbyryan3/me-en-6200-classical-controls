%% ME EN 6200 Homework 9 Ryan Dalby
%%
clear;
close all;
%% 1
% a
% Open loop response
G = tf(1, [1 0 0]);
figure;
step(G);
title('Open loop step response for 1a');

% Closed loop response
z = sqrt(8);
p = 4.83;
k = 12.8;
Dc = tf([1 z], [1 p]);
cltf = feedback(k*Dc*G, 1);
figure;
step(cltf);
title('Closed loop step response for 1a');

% b
% Open loop response
G = tf(1, [1 2 0]);
figure;
t_vals = 0:0.1:30;
ramp_vals = t_vals;
lsim(G, ramp_vals, t_vals);
title('Open loop ramp response for 1b');

% Closed loop response
z = 0.1;
p = 0.0208;
k = 2.08;
Dc = tf([1 z], [1 p]);
cltf = feedback(k*Dc*G, 1);
figure;
lsim(cltf, ramp_vals, t_vals);
title('Closed loop ramp response for 1b');

% Determine steady-state error
t_vals = 0:0.1:10000;
ramp_vals = t_vals;
[y,t] = lsim(cltf, ramp_vals, t_vals);
ess = abs(ramp_vals(end) - y(end)); 
fprintf('The steady-state error of the closed loop ramp response for 1b is %.2f\n', ess);
