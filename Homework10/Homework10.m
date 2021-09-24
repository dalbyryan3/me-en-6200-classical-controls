%% ME EN 6200 Homework 10 Ryan Dalby
%%
clear;
close all;

%% 2
% a
La = tf(2000,[1 200 0]);
figure;
bode(La);
title('Bode plot for 2a');
% b
Lb = tf(100,[0.05 0.6 1 0]);
figure;
bode(Lb);
title('Bode plot for 2b');
% c
Lc = tf(1,[0.02 1.02 1 0]);
figure;
bode(Lc);
title('Bode plot for 2c');
%% 3
% a
La = tf([1 2],[1 12 22 20 0]);
figure;
bode(La);
title('Bode plot for 3a');
% b
Lb = tf([1 2],[1 16 85 250 0 0]);
figure;
bode(Lb);
title('Bode plot for 3b');