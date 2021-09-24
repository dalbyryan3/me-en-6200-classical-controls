%% ME EN 6200 Homework 3 Ryan Dalby
%%
clear;
close all;
%% 1c
t_vals = 0:0.001:1.5;
% a
Ga = tf(5,[1,5]);
figure;
step(Ga,1.5);
title('Step response for 5/(s+5)');
hold on;
c = 1-exp(-5*t_vals);
plot(t_vals, c, 'r--');
legend('MATLAB Calculated Response', 'Hand Calculated Response');

% b
Gb = tf(20,[1,20]);
figure;
step(Gb,1.5);
title('Step response for 20/(s+20)');
hold on;
c = 1-exp(-20*t_vals);
plot(t_vals, c, 'r--');
legend('MATLAB Calculated Response', 'Hand Calculated Response');

%% 2c
t_vals = 0:0.1:10;

H = tf(1,[1,1,5]);
figure;
step(H,10);
title('Step response for 1/(s^2+s+5)');
hold on;
x = 1/5 - (1/5).*exp(-.5.*t_vals).*cos(sqrt(19).*t_vals/2) - (1/(5.*sqrt(19))).*exp(-.5.*t_vals).*sin(sqrt(19).*t_vals/2);
plot(t_vals, x, 'r--');
legend('MATLAB Calculated Response', 'Hand Calculated Response');