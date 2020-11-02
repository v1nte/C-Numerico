clc
clear
close all

x0 = 1.8;

df = @df;
f = @f;

N = 50;
tol = 10^-4;

x_sol = newton(f,df,x0,tol,N)

figure;
subplot(2,1,1);
plot(x_sol, 'bo');
