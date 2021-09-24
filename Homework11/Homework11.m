%% ME EN 6200 Homework 11 Ryan Dalby
%%
clear;
close all;

%% 1
% a
La = tf(2000,[1 200 0]);
figure;
margin(La);
legend('Bode plot for 1a', 'Location', 'northoutside');
% b
Lb = tf(100,[0.05 0.6 1 0]);
figure;
margin(Lb);
legend('Bode plot for 1b', 'Location', 'northoutside');
% c
Lc = tf(1,[0.02 1.02 1 0]);
figure;
margin(Lc);
legend('Bode plot for 1c', 'Location', 'northoutside');
%% 2
% a
La = tf([1 2],[1 12 22 20 0]);
figure;
margin(La);
legend('Bode plot for 2a', 'Location', 'northoutside');
% b
Lb = tf([1 2],[1 16 85 250 0 0]);
figure;
margin(Lb);
legend('Bode plot for 2b', 'Location', 'northoutside');

%% 3
% a
G_a = tf(1,[1/25,3/25,27/25,1,0]);
figure;
margin(G_a);
legend('Bode plot for 3a', 'Location', 'northoutside')

% b
G_b = tf(1.115,[1/25,3/25,27/25,1,0]);
figure;
margin(G_b);
legend('Bode plot for 3b, k=1.115', 'Location', 'northoutside')

% d
disp('The poles for which the phase margin is 45 degrees are:')
disp(pole(feedback(G_b, 1)));
disp(' ');
figure;
rlocus(G_a);
title('Root Locus with Respect to K for G of Problem 3');  
