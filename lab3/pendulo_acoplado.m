function du = pendulo_acoplado(t, u, m1, m2, L, a, k, g) 

  du = zeros(4,1);

  du(1) = u(2);
  du(2) = ( k*a*a* ( sin(u(3)) - sin(u(1)) ) * cos(u(1)) - cos(u(2)) - m1*L*g*sin(u(1)) ) / ( m1*L*L );
  du(3) = u(4);
  du(4) = -( k*a*a * ( sin(u(3)) - sin(u(1)) ) * cos(u(3)) - cos(u(4)) - m2*L*g*sin(u(3)) ) / ( m2*L*L );

end

