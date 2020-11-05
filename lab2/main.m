clc
clear
close all

a = -2;
b = 5;

df = @df;
f = @f;

N = 1000;
tol = 10^-9;

m = bisection_method(f, a, b, tol, N);


figure
subplot(2,1,1);
plot(m, 'bo-');
m(end)
pause
