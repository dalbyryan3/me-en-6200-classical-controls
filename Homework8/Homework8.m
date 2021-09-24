%% ME EN 6200 Homework 8 Ryan Dalby
%%
clear;
close all;
%% 1
disp('Problem 1:');
% c
a = 0.1;
b = 10;

% Open loop step response
G = tf(a,[1 b]);
figure;
step(G);
title('Open loop step response of G from HW8 Problem 1');
G_step_info = stepinfo(G);
fprintf('OLTF: Steady state value is %f and the settling time is %fs\n\n', G_step_info.SettlingMax, G_step_info.SettlingTime);

% d 
% 25% method
L = 0.01;
A = 0.01;
tau = 0.1;
R = A/tau;

kp = 1.2/(R*L);
Ti = 2*L;
Td = 0.5*L;
ki = kp/Ti;
kd = kp*Td;

fprintf('25 Percent Method Gains: Kp=%f, Ki=%f, and Kd=%f\n\n', kp,ki,kd);

% e
% Closed loop step response for optimum gains
cltf = tf([a*kd a*kp a*ki],[(kd*a+1) (kp*a+b) (ki*a)]);
figure;
step(cltf);
[cltf_response,~] = step(cltf);
title('Closed loop step response of G with a PID controller for HW8 Problem 1');
cltf_ss_error = 1 - cltf_response(end);
cltf_step_info = stepinfo(cltf);
fprintf('CLTF: Percent overshoot is %f, the settling time is %fs, and the steady state error is %f\n\n', cltf_step_info.Overshoot, cltf_step_info.SettlingTime, cltf_ss_error);

% f
% Improving tuning values
kp=3000;
ki=80000;
kd=8;
cltf = tf([a*kd a*kp a*ki],[(kd*a+1) (kp*a+b) (ki*a)]);

figure;
step(cltf);
title('Closed loop step response of G with a PID controller for HW8 Problem 1- Improved');
cltf_ss_error = 1 - cltf_response(end);
cltf_step_info = stepinfo(cltf);
fprintf('CLTF Improved: Percent overshoot is %f, the settling time is %fs, and the steady state error is %f\n\n\n', cltf_step_info.Overshoot, cltf_step_info.SettlingTime, cltf_ss_error);

% figure;
% opt = stepDataOptions('StepAmplitude', 0.0000000000001);
% step(cltf,opt);
% t_vals = linspace(0, 1);
% noise = 0.01 * randn(size(t_vals));
% lsim(cltf, noise, t_vals);

%% 2
disp('Problem 2:');
% c 
b = 10;
zeta = 0.707;
wn = 4; % rad/s

% Open loop step response
G = tf(1,[1 (2*zeta*wn+b) (wn^2+2*zeta*wn*b) (b*wn^2) 0]);
figure;
step(G);
title('Open loop step response of G from HW8 Problem 2');
G_step_info = stepinfo(G);
fprintf('OLTF: Steady state value is %f and the settling time is %fs\n\n', G_step_info.SettlingMax, G_step_info.SettlingTime);

% d
% Ultimate sensitivity 
kp_star = 637.1004;
opt = stepDataOptions('StepAmplitude', 0.00000001);
G_kp = tf(kp_star,[1 (2*zeta*wn+b) (wn^2+2*zeta*wn*b) (b*wn^2) kp_star]);
figure;
step(G_kp, opt);
title('Ultimate sensitivity determination, Kp* = 637.1004');
Pu = 2; % s % From inspection

% Optimum gains from Zieglaer-Nichols
kp = 1.6*kp_star;
Ti = 0.5*Pu;
Td = 0.125*Pu;
ki = kp/Ti;
kd = kp*Td;
fprintf('Ultimate Sensitivity Gains: Kp=%f, Ki=%f, and Kd=%f\n\n', kp,ki,kd);

% e
% Closed loop step response for optimum gains
cltf = tf([kd kp ki],[1 (2*zeta*wn+b) (wn^2+2*zeta*wn*b) (b*wn^2 + kd) kp ki]);
figure;
step(cltf);
[cltf_response,~] = step(cltf);
title('Closed loop step response of G with a PID controller for HW8 Problem 2');

cltf_step_info = stepinfo(cltf);
cltf_ss_error = 1 - cltf_response(end);
fprintf('CLTF: Percent overshoot is %f, the settling time is %fs, and the steady state error is %f\n\n', cltf_step_info.Overshoot, cltf_step_info.SettlingTime, cltf_ss_error);

% f
% Improving tuning values
kp=750;
ki=750;
kd=330;
cltf = tf([kd kp ki],[1 (2*zeta*wn+b) (wn^2+2*zeta*wn*b) (b*wn^2 + kd) kp ki]);

figure;
step(cltf);
title('Closed loop step response of G with a PID controller for HW8 Problem 2- Improved');
cltf_ss_error = 1 - cltf_response(end);
cltf_step_info = stepinfo(cltf);
fprintf('CLTF Improved: Percent overshoot is %f, the settling time is %fs, and the steady state error is %f\n\n\n', cltf_step_info.Overshoot, cltf_step_info.SettlingTime, cltf_ss_error);


