clc
clear

a = 20; % Punto inicial para Newton y extremo izquierdo para bisección
b = 60; % Extremo derecho para bisección, y segunda iteración de Secante

df = @df;
f = @f;

N = 1000;
tol = 10^-5;


newton_ej1 = newton(f, df, a, tol, N);
bisection_ej1 = bisection_method(f, a, b, tol, N);
secant_ej1 = secant_method(f, a, b, tol, N);
n = newton_ej1(end);
b = bisection_ej1(end);
s = secant_ej1(end);


figure
subplot(3,1,1)
plot(newton_ej1, 'bo-');
title({'Newton, valor final: ' n});

subplot(3,1,2)
plot(bisection_ej1, 'bo-');
title({'Bisección, valor final', b})

subplot(3,1,3)
plot(secant_ej1, 'bo-');
title({'Secante, valor final', s})

fprintf('\n\nNewton-Raphson: ')
disp(newton_ej1);

fprintf('\n\nBisección: ')
disp(bisection_ej1);

fprintf('\n\nSecante: ')
disp(secant_ej1);
pause
