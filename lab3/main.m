clf
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

a1 = pi/2; % 90 degrees
v1 = 0;
a2 = pi/2; % 90 degrees
v2 = 0;

t_max = 20;


[T,U] = ode45(@(t,u)pendulo_doble(t, u, a,b,c),[0, t_max], [a1, v1, a2, v2], options);


% Rotate
U(:,1) = U(:,1) - pi/2;
U(:,3) = U(:,3) - pi/2;

% PLOT all or just the double pendulum
% 1: Plot everything
% 0: Plot just pendulum
flag = 0;

figure()
for i=1:length(T)

    % Get cartesian coordinates
    pos_m1 = pol2cart(U(i,1), l1);
    pos_m2 = pol2cart(U(i,3), l2);
    pos_m2(1) = pos_m2(1) + pos_m1(1);
    pos_m2(2) = pos_m2(2) + pos_m1(2);

    if flag==1
      %% ANGLE 1
      %Current
      subplot(3, 1, 1);
      plot(T(i), U(i,1), 'ro', 'LineWidth', 2, 'Markersize', 3)

      %full record
      hold on;
      plot(T, U(:,1), 'g-');
      title(['Angulo 1 en t = ', num2str(T(i)), ' segundos'])
      hold off

      %% ANGLE 2
      % Current position
      subplot(3,1,2)
      plot(T(i), U(i,3), 'ro', 'LineWidth', 2, 'Markersize', 3)

      % Full record
      hold on;
      plot(T, U(:,3), 'g-');
      title(['Angulo 2 en t = ', num2str(T(i)), ' segundos'])
      hold off;
    end


    %% ANIMATION
    % Lines
    if flag == 1
      subplot(3, 1, 3)
    else
      subplot(1, 1, 1)
    end
    plot(
        [0 pos_m1(1)],
        [0 pos_m1(2)],
        'b'
    ); 
    hold on;

    plot(
        [pos_m1(1) pos_m2(1)],
        [pos_m1(2) pos_m2(2)],
        'b-'
    );

    % m1
    hold on;
    plot(
        pos_m1(1),
        pos_m1(2),
        'ro'
    )

    % m2
    hold on;
    plot(
        pos_m2(1),
        pos_m2(2),
        'ro'
    )
    xlim ([-1*(l1+l2) (l1+l2)]);
    ylim ([-1*(l1+l2) (l1+l2)]);
    axis(xlim, ylim);
    axis equal;
    axis off;
    hold off;
    drawnow;
end
pause
