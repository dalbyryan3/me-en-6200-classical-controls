%% ME EN 6200 Homework 7 Ryan Dalby
%%
clear;
close all;

% sys = tf(1, [1 18 80 0]);
% sys = tf(1, [1 4 6 4]);
% sys = tf([1 4 8], [1 1 0 0]);
% sys = tf([1 5], [1 11 10 0]);
% sys = tf(1, [1 5 8 6 0]);

sys = tf([1 -4 20], [1 6 8]);
start_line = 0;
end_line = -4.5 + 8.93i;
damp_line = linspace(start_line, end_line);

figure;
[r,~] = rlocus(sys);
rlocus(sys);
hold on;
plot(damp_line);

upper_line = r(2,:);

[real_inter, imag_inter]=polyxpoly(real(upper_line),imag(upper_line),real(damp_line),imag(damp_line));

s0 = real_inter + imag_inter*1i;

mag_G_hat = abs(((s0-(2+4i))*(s0-(2-4i)))/((s0+2)*(s0+4)));

k = 1/mag_G_hat;

fprintf('Intersection at: %.2f + %.2fj where   k=%.4f \n', real_inter, imag_inter, k);