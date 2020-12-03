clc
clear

options = odeset('RelTol',1e-5,'AbsTol',[1e-5 1e-5 1e-5 1e-5]);

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

a1 = pi/4;
v1 = 0;
a2 = pi/6;
v2 = 0;

t_max = 600;


[T,Y] = ode45(@(t,u)pendulo_doble(t, u, a,b,c),[0,t_max],[a1, v1, a2, v2], options);
