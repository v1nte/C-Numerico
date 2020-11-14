clc
clear
close all

a = -2;
b = 5;

df = @df;
f = @f;

fprintf('==================\n');
fprintf('   Ejercicio 1: \n');
fprintf('==================\n');


N = 1000;
tol = 10^-5;

m = bisection_method(f, a, b, tol, N);


figure
subplot(2,1,1);
plot(m, 'bo-');
m(end)
pause
