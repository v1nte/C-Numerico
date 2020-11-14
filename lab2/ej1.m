clc
clear

a = 3;

df = @df;
f = @f;

N = 1000;
tol = 10^-9;

m = newton(f,df, a, tol, N);


figure
subplot(2,1,1);
plot(m, 'bo-');
m(end)
pause
