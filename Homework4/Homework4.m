%% ME EN 6200 Homework 4 Ryan Dalby
%%
clear;
close all;

%% 1

G1 = tf([1,2],[1,3,36]); % a
G2 = tf([1,-2],[1,3,36]); % b

figure;
step(G1);
hold on; 
step(G2);
legend('(s+2)/(s^2+3s+36) response (a)' , '(s-2)/(s^2+3s+36) response (b)');

%% 4
k = 71.68;
p = 27.33;
z = 7.097;

G = tf(1,[1, 3, 0]);
D = tf([k,k*z],[1,p]);
sys = feedback(G*D, 1);

figure;
step(sys);
title('Designed System Step Response');

% Expected: 10% OS and 1.5 second(+/-2%) settling time
sys_inf = stepinfo(sys);
disp(sys_inf);
