%% ME EN 6200 Homework 5 Ryan Dalby
%%
clear;
close all;

%% 1
% a
disp('(stable) a roots:');
disp(roots([1 4 8 4]));

% b 
disp('(unstable) b roots:');
disp(roots([1 2 -6 20]));

% c
disp('(unstable) c roots:');
disp(roots([1 1 2 12 10]));

% d
disp('(marginally stable) d roots:');
disp(roots([1 2 12 4 21 2 10]));

%% 4
T = tf(1,[1 5 20 6]);
tFinal = 100; %s Will see long term step response
figure;
step(T, tFinal);
title('Long Term Step Response for 1/(s^3 + 5s^2 + 20s + 6)');