clf
clc
clear
close all

options = odeset('RelTol', 1e-5,'AbsTol',[1e-5 1e-5 1e-5 1e-5]);

g = -9.81;
m1 = 5;
m2 = 5;
L = 5;
a = L/2;
k = 5;
c = 0.5;
Tmax = 50;

a1 = pi;
v1 = 2;
a2 = pi;
v2 = 0;


[T, U] = ode45(@(t,u)pendulo_acoplado(t, u, m1, m2, L, a, k, g, c), [0 Tmax], [a1 v1 a2 v2], options);


% PLOT all or just the double pendulum
% 1: Plot everything
% 0: Plot just pendulum
flag = 1;

figure()
for i=1:length(T)

  % Get cartesian coordinates

  pos_m1(1) = L*sin(U(i,1)) - L/2;
  pos_m1(2) = L*cos(U(i,1));

  pos_m2(1) = L*sin(U(i,3)) + L/2;
  pos_m2(2) = L*cos(U(i,3));


    if flag==1
      %% ANGLE 1
      %Current
      clc
      subplot(3, 1, 1);
      plot(T(i), U(i,1)-pi, 'ro', 'LineWidth', 2, 'Markersize', 3)

      %full record
      hold on;
      plot(T, U(:,1)-pi, 'g-');
      title(['Angulo 1 en t = ', num2str(T(i)), ' segundos'])
      ylabel('Angulo (rad)')
      hold off;

      %% ANGLE 2
      % Current position
      subplot(3,1,2)
      plot(T(i), U(i,3)-pi, 'ro', 'LineWidth', 2, 'Markersize', 3)

      % Full record
      hold on;
      plot(T, U(:,3)-pi, 'g-');
      title(['Angulo 2 en t = ', num2str(T(i)), ' segundos'])
      ylabel('Angulo (rad)')
      hold off;
    end

    if flag == 1
      subplot(3, 1, 3)
    else
      subplot(1, 1, 1)
    end

  % Stick 1 (left)
  plot(
      [-L/2 pos_m1(1)],
      [0 pos_m1(2)],
      'b',
      'LineWidth', 1
  );

  hold on;

  % Stick 2
  plot(
      [L/2 pos_m2(1)],
      [0 pos_m2(2)],
      'b',
      'LineWidth', 1
  );
  hold on

  %% Spring coordinates
  spring(1) = a*sin(U(i,1)) - L/2; 
  spring(2) = a*cos(U(i,1));
  spring(3) = a*sin(U(i,3)) + L/2;
  spring(4) = a*cos(U(i,3));

  %% plot the spring
  plot(
      [spring(1) spring(3)],
      [spring(2) spring(4)],
      'r--',
      'LineWidth', 1
  )

  hold on
  %% plot bobs
  plot( pos_m1(1), pos_m1(2), 'ro', 'LineWidth', 3 )
  plot( pos_m2(1), pos_m2(2), 'ro', 'LineWidth', 3)

  hold off;

  xlim ([-1*(2*L) (2*L)]);
  ylim ([-1*(2*L) (2*L)]);
  axis(xlim, ylim);
  axis equal;
  title(['t = ', num2str(T(i)), 'segundos']);

  drawnow
end
pause
