clf
clc
clear
close all

options = odeset('RelTol', 1e-5,'AbsTol',[1e-5 1e-5 1e-5 1e-5]);

% Estamos en la Tierra
g = -9.81;

largo = 5;
masa = 5;

m1 = masa;
m2 = masa;
l1 = largo;
l2 = largo;

a = m2/m1;
b = l2/l1;
c = g/l1;

a1 = pi/2; % 90 degrees
v1 = 0;
a2 = pi/2; % 90 degrees
v2 = 0;

t = 0;
t_max = 30;

[T,U] = ode45(@(t,u)pendulo_doble(t, u, a,b,c),[0, t_max], [a1, v1, a2, v2], options );

% PLOT all or just the double pendulum
% 1: Plot everything
% 0: Plot just pendulum
flag = 1;

figure()
for i=1:length(T)
    % Get cartesian coordinates

    pos_m1(1) = l1*sin(U(i,1)); % X
    pos_m1(2) = l1*cos(U(i,1)); % Y

    pos_m2(1) = pos_m1(1) + l2*sin(U(i,3)); % X
    pos_m2(2) = pos_m1(2) + l2*cos(U(i,3)); % Y


    if flag==1
      %% ANGLE 1
      %Current
      subplot(3, 1, 1);
      plot(T(i), U(i,1), 'ro', 'LineWidth', 2, 'Markersize', 3)

      %full record
      hold on;
      plot(T, U(:,1), 'g-');
      title(['Angulo 1 en t = ', num2str(T(i)), ' segundos'])
      ylabel('Angulo (rad)')
      hold off;

      %% ANGLE 2
      % Current position
      subplot(3,1,2)
      plot(T(i), U(i,3), 'ro', 'LineWidth', 2, 'Markersize', 3)

      % Full record
      hold on;
      plot(T, U(:,3), 'g-');
      title(['Angulo 2 en t = ', num2str(T(i)), ' segundos'])
      ylabel('Angulo (rad)')
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

    % Decorate a little
    xlim ([-1*(l1+l2) (l1+l2)]);
    ylim ([-1*(l1+l2) (l1+l2)]);
    axis(xlim, ylim);
    title(['t = ', num2str(T(i)), ' segundos'])
    axis equal;
    axis off;
    drawnow;
    hold off;
    
    pause(0.03);
end
 %frame = getframe(gcf); 
 %img = frame2im(frame);  
 %[img,cmap] = rgb2ind(img,256);  
 %if k == 1 
 %  imwrite(img,cmap,'PenduloDoble1.gif','gif','LoopCount',Inf,'DelayTime',1); 
 %else 
 %imwrite(img,cmap,'PenduloDoble1.gif','gif','WriteMode','append','DelayTime',0.1); 
 %end
pause
