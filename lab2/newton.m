function x = newton(f,df,x0,tol,N,ej) 

  f = @f;
  df = @df;

  x(1) = x0;
  x(2) = x(1) - f(x(1), ej) / df(f,x(1), ej);

  i = 1;
  while abs(x(i+1)-x(i)) > tol && i<=N
    x(i+2) = x(i+1) -f(x(i+1), ej) / df(f, x(i+1), ej); 
    
    i = i + 1;
  end
end
