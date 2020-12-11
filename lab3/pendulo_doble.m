function du = pendulo_doble(t, u, a,b,c)

  du = zeros(4,1);

  du(1) = u(2);
  du(2) = -( (1+a)*c*sin(u(1)) + a*b*(u(4))^2*sin(u(1)-u(3)) + a*cos(u(1)-u(3))*(u(2)^2*sin(u(1)-u(3))-c*sin(u(3))) ) / (1+a*(sin(u(1)-u(3)))^2);
  du(3) = u(4);
  du(4) = ( ((1+a)*((u(2))^2*sin(u(1)-u(3)))-c*sin(u(3)))+cos(u(1)+u(3))*((1+a)*c*sin(u(1))+a*b*u(4)^2*sin(u(1)-u(3))) ) / (b*(1+a*(sin(u(1)-u(2)))^2));

  %theta1 = x(1);
  %theta2 = x(2);
  %omega1 = x(3);
  %omega2 = x(4);

  %dtheta1 = omega1;
  %dtheta2 = omega2;

  %domega1 = (-g*(2*m1+m2)*sin(theta1)-m2*g*sin(theta1-2*theta2)-2*sin(theta1-theta2)*m2*(omega2^2*L2+omega1^2*L1*cos(theta1-theta2)))/(L1*(2*m1+m2-m2*cos(2*theta1-2*theta2)));
  %domega2 = (2*sin(theta1-theta2)*(omega1^2*L1*(m1+m2)+g*(m1+m2)*cos(theta1)+omega2^2*L2*m2*cos(theta1-theta2)))/(L2*(2*m1+m2-m2*cos(2*theta1-2*theta2)));

  %dx = [dtheta1;dtheta2;domega1;domega2];
end
