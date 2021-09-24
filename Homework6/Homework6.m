%% ME EN 6200 Homework 6 Ryan Dalby
%%
clear;
close all;

%% 1
% b
t_step = .01; % s
t_vals = 0:t_step:40; % s
r_vals = [0:t_step:10, (10-t_step):-t_step:0, t_step:t_step:10, (10-t_step):-t_step:0];
G = tf([75,75],[1,30 125,0]);
Y_R = feedback(G, 1);
E_R = tf([1,30,125,0],[1,30,200,75]);

figure;
plot(t_vals, r_vals);
hold on;
lsim(Y_R,r_vals,t_vals);
hold on;
lsim(E_R,r_vals,t_vals);
title('Closed loop system response and error');
legend('r(t)- Input signal','y(t)- Output signal', 'e(t)- Error');

%% 3
% f
K = 5/3;
tau = 2.4;
T = tf([2,2.4],[1,1.53,2.4]);

figure;
step(T);
title('Step Response With Response Characteristics');
disp(stepinfo(T));


%% 4 
% d
omega_vals = logspace(-3,3);
a = 1;
A = 1;
beta = 0.1;
s = 1i .* omega_vals;

S_A = (s.*(s+a)) ./ (s.*(s+a) + A);
S_a = (-a.*s) ./ (s.*(s+a) + A);
S_beta = (-beta .* A) ./ (s.*(s+a) + beta*A);

figure;
semilogx(omega_vals, abs(S_A));
title('Sensitivity of closed-loop TF to changes in A vs log(omega)');
xlabel('log(omega) [log(rad/s)]');
ylabel('Sensitivity value');

figure;
semilogx(omega_vals, abs(S_a));
title('Sensitivity of closed-loop TF to changes in a vs log(omega)');
xlabel('log(omega) [log(rad/s)]');
ylabel('Sensitivity value');

figure;
semilogx(omega_vals, abs(S_beta));
hold on;
beta = 1;
S_beta = (-beta .* A) ./ (s.*(s+a) + beta*A);
semilogx(omega_vals, abs(S_beta));
hold on;
beta = 10;
S_beta = (-beta .* A) ./ (s.*(s+a) + beta*A);
semilogx(omega_vals, abs(S_beta));
title('Sensitivity of closed-loop TF to changes in beta vs log(omega)');
legend('beta=0.1', 'beta=1', 'beta=10');
xlabel('log(omega) [log(rad/s)]');
ylabel('Sensitivity value');

