clc
clear
close all

x0 = 5;

df = @df;
f = @f;

N = 1000;
tol = 10^-9;

x_sol = newton(f,df,x0,tol,N)

figure;
subplot(2,1,1);
plot(x_sol, 'bo');
pause
