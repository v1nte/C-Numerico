function double_pendulum_simulation(theta1_0,theta2_0,L1,L2,m1,m2,g,tail)
  if nargin<8 || isempty(tail)
      tail = 100;
  end
  if nargin<7 || isempty(g)
      g = 9.81;
  end
  if nargin<6 || isempty(m2)
      m2 = 3;
  end
  if nargin<5 || isempty(m1)
      m1 = 2;
  end
  if nargin<4 || isempty(L2)
      L2 = 2;
  end
  if nargin<3 || isempty(L1)
      L1 = 3;
  end
  if nargin<2 || isempty(theta2_0)
      theta2_0 = pi/2;
  end
  if nargin<1 || isempty(theta1_0) 
      theta1_0 = 3*pi/4;
  end
    % preparing for loop until user either keypresses or clicks
  global USER_RESPONDED
  USER_RESPONDED = 0;
  figure
  set(gcf,'WindowKeyPressFcn',@userRespondFcn,'WindowButtonDownFcn',...
      @userRespondFcn,'DeleteFcn',@userRespondFcn)
  % initial state
  x = [mod(theta1_0,2*pi),mod(theta2_0,2*pi),0,0];
  t = 0;
  i_end = 0.02; % initial estimate of a average iteration duration
  tail = repmat(L1*[sin(x(1)),-cos(x(1))],[tail,2]) + ...
      repmat([0 0 L2*[sin(x(2)),-cos(x(2))]],[tail,1]); % initial tail
  % ode function
  double_penudlum = @(t,x)double_pendulum_system(x,L1,L2,m1,m2,g);
  % preparing for loop
  axis xy equal, box on, hold on
  axis(1.1*[-1 1 -1 1]*(L1+L2))
  [r1,r2] = bob_drawing_scale(m1,m2,L1,L2); % scale for drawing bobs
  iter = 0;
  tic
    while ~USER_RESPONDED
        [t,x] = ode45(double_penudlum,t(end)*[1 0.5 0] + i_end*[0 0.5 1] ,x(end,:)');
        tail = patch_double_pendulum(t,x(end,:),L1,L2,r1,r2,tail);
        iter = iter+1;
        i_end = max(toc*(1+1/iter),t(end)+2*eps); % end time for next iteration
    end
  end

  function userRespondFcn(~,~)
    % callback function which execute when user responds
    global USER_RESPONDED
    USER_RESPONDED  = 1;
  end

  function dx = double_pendulum_system(x,L1,L2,m1,m2,g)
    % a system of differential equations defining a double pendulum
    % from http://www.myphysicslab.com/dbl_pendulum.html
    theta1 = x(1);
    theta2 = x(2);
    omega1 = x(3);
    omega2 = x(4);
    dtheta1 = omega1;
    dtheta2 = omega2;
    domega1 = (-g*(2*m1+m2)*sin(theta1)-m2*g*sin(theta1-2*theta2)-...
        2*sin(theta1-theta2)*m2*(omega2^2*L2+omega1^2*L1*cos(theta1-theta2)))...
        /(L1*(2*m1+m2-m2*cos(2*theta1-2*theta2)));
    domega2 = (2*sin(theta1-theta2)*(omega1^2*L1*(m1+m2)+...
        g*(m1+m2)*cos(theta1)+omega2^2*L2*m2*cos(theta1-theta2)))...
        /(L2*(2*m1+m2-m2*cos(2*theta1-2*theta2)));
    dx = [dtheta1;dtheta2;domega1;domega2];
  end
  function tail = patch_double_pendulum(t,x,L1,L2,r1,r2,tail)
    % using patch to plot pendulum state
    cla
    % plotting tail
    alpha = linspace(0,1,size(tail,1)+1)';
    patch([tail(:,1);NaN],[tail(:,2);NaN],0,'EdgeColor','r','FaceColor',...
        'none','FaceVertexAlphaData',alpha,'EdgeAlpha','interp','LineWidth',2);
    patch([tail(:,3);NaN],[tail(:,4);NaN],0,'EdgeColor','r','FaceColor',...
        'none','FaceVertexAlphaData',alpha,'EdgeAlpha','interp','LineWidth',2);
    % plotting rods
    theta1 = x(1);
    theta2 = x(2);
    xm1 = L1*sin(theta1);
    ym1 = -L1*cos(theta1);
    xm2 = xm1 + L2*sin(theta2);
    ym2 = ym1 - L2*cos(theta2);
    patch([0, xm1, xm2, NaN],[0, ym1, ym2, NaN],0,'EdgeColor','b',...
        'FaceColor','none','LineWidth',2)
    % plotting bobs
    p = linspace(0,2*pi,17);
    sint = sin(p);
    cost = cos(p);
    patch(xm1+r1*cost,ym1+r1*sint,0,'EdgeColor','b','FaceColor','b')
    patch(xm2+r2*cost,ym2+r2*sint,0,'EdgeColor','b','FaceColor','b')
    title(sprintf('time = %0.1f',t(end)))
    drawnow
    tail = [tail(2:end,:);xm1,ym1,xm2,ym2];
  end

  function [r1,r2] = bob_drawing_scale(m1,m2,L1,L2)
    % finding a scale for plotting the size of the bobs: the bigger bob has
    % a radius which is a given fraction of the length of the shorter rod.
    r_max = max(m1^(1/3),m2^(1/3));
    l_min = min(L1,L2);
    scale = 0.1*l_min/r_max;
    r1 = scale*m1^(1/3); % mass is proportional with the volume
    r2 = scale*m2^(1/3);
  end
