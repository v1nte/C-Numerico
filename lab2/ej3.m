clc
clear
close all

a = 6.5; % Punto inicial para Newton y Secante, y extremo izquierdo para bisección
b = 7.5; % Extremo derecho para bisección, y segunda iteración de Secante

df = @df;
f = @f;

N = 1000;
tol = 10^-5;

newton_ej3 = newton(f, df, a, tol, N);
bisection_ej3 = bisection_method(f, a, b, tol, N);
secant_ej3 = secant_method(f, a, b, tol, N);
n = newton_ej3(end);
b = bisection_ej3(end);
s = secant_ej3(end);


figure
subplot(3,1,1)
plot(newton_ej3, 'bo-');
title({'Newton, valor final: ' n});

subplot(3,1,2)
plot(bisection_ej3, 'bo-');
title({'Bisección, valor final', b})

subplot(3,1,3)
plot(secant_ej3, 'bo-');
title({'Secante, valor final', s})

fprintf('\n\nNewton-Raphson: ')
disp(newton_ej3);

fprintf('\n\nBisección: ')
disp(bisection_ej3);

fprintf('\n\nSecante: ')
disp(secant_ej3);
pause

