function du = pendulo_doble(t, u, a,b,c)

  du = zeros(4,1);


  du(1) = u(2);
  du(2) = -( (1+a)*c*sin(u(1)) + a*b*u(3)^2*sin(u(1)-u(3)) + a*cos(u(1)-u(3))*(u(1)^2*sin(u(1)-u(3))-c*sin(u(3))) ) / (1+a*sin(u(1)-u(3))^2);
  du(3) = u(4);
  du(4) = ( ((1+a)*(u(1)^2*sin(u(1)-u(3)))-c*sin(u(3)))+cos(u(1)+u(3))*((1+a)*c*sin(u(1))+a*b*u(3)^2*sin(u(1)-u(3))) ) / (b*(1+a*sin(u(1)-u(2))^2));
  

end

