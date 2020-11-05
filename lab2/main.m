clc
clear
close all

a = 15;
b = 16;

df = @df;
f = @f;

N = 1000;
tol = 10^-9;

m = secant_method(f, a, b, tol, N);


figure
subplot(2,1,1);
plot(m, 'bo-');
m(end)
pause
