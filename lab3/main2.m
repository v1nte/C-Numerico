clf
clc
clear
close all

options = odeset('RelTol', 1e-5,'AbsTol',[1e-5 1e-5 1e-5 1e-5]);

g = 9.81;
m1 = 5;
m2 = 5;
L = 5;
a = L/3;
k = 1;
c = 0.1;
Tmax = 50;

a1 = 0;
v1 = 2;
a2 = 0;
v2 = 0;


[T, U] = ode45(@(t,u)pendulo_acoplado(t, u, m1, m2, L, a, k, g, c), [0 Tmax], [a1 v1 a2 v2], options);

U(:,1) = U(:,1) - pi;
U(:,3) = U(:,3) - pi;


for i=1:length(T)
  
  % Get cartesian coordinates
  clc

  %bob1
  pos_m1(1) = L*sin(U(i,1)) - L/2;
  pos_m1(2) = L*cos(U(i,1));

  %bob2
  pos_m2(1) = L*sin(U(i,3)) + L/2;
  pos_m2(2) = L*cos(U(i,3));

  plot(
      [-L/2 pos_m1(1)],
      [0 pos_m1(2)],
      'b',
      'LineWidth', 2
  );

  hold on;

  plot(
      [L/2 pos_m2(1)],
      [0 pos_m2(2)],
      'b',
      'LineWidth', 2
  );
  hold on

  spring(1) = a*sin(U(i,1)) - L/2; 
  spring(2) = a*cos(U(i,1));
  spring(3) = a*sin(U(i,3)) + L/2;
  spring(4) = a*cos(U(i,3));

  plot(
      [spring(1) spring(3)],
      [spring(2) spring(4)],
      'r--',
      'LineWidth', 1
  )

  hold off;

  xlim ([-1*(2*L) (2*L)]);
  ylim ([-1*(2*L) (2*L)]);
  axis(xlim, ylim);
  axis equal;
  title(['t = ', num2str(T(i)), 'segundos']);

  drawnow
end
pause
