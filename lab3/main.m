clc
clear
close all

options = odeset('RelTol', 1e-5,'AbsTol',[1e-5 1e-5 1e-5 1e-5]);

% Estamos en la Tierra
g = 9.81;

largo = 5;
masa = 5;

m1 = masa;
m2 = masa;
l1 = largo;
l2 = largo;

%x_1 = l1*sin(Y(:1,));
%y_1 = (l1+l2)*l1*cos(Y(:,1));
%x_2 = l1
%y_2 =

a = m2/m1;
b = l2/l1;
c = g/m1;

a1 = pi/2;
v1 = 0;
a2 = pi/2;
v2 = 0;

t_max = 20;


[T,U] = ode45(@(t,u)pendulo_doble(t, u, a,b,c),[0, t_max], [a1, v1, a2, v2], options);


figure()
for i=1:length(T)
    %t_i = T(i);
    %ang1_i = U(i,1)
    %vel1_i = U(i,2)
    %ang2_i = U(i,3)
    %vel2_i = U(i,4)

    
    % Current
    subplot(1, 1, 1);
    plot(T(i), U(i,1), 'ro', 'LineWidth', 2, 'Markersize', 3);


    % full circuit
    hold on
    plot(T, U(:,1), 'g-')
    title(['Angulo en t = ', num2str(T(i)), ' segundos'])

    drawnow
end
pause
