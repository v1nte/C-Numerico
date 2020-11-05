function x_sol = bisection_method(f, a, b, tol, N) 
  f = @f;

  a(1) = a;
  b(1) = b;
  x_sol(1) = ( a(1) + b(1) )/2;

  if feval(f, a(1)) * feval(f, x_sol(1)) < 0
      a(2) = a(1);
      b(2) = x_sol(1);
  else
      a(2) = x_sol(1);
      b(2) = b(1);
  end

  x_sol(2) = ( a(2) + b(2) )/2;

  i = 2;
  while abs(b(i) - a(i)) >= tol && i <= N
    if feval(f, a(i)) * feval(f, x_sol(i)) < 0
        a(i+1) = a(i);
        b(i+1) = x_sol(i);
    else
        a(i+1) = x_sol(i);
        b(i+1) = b(i);
    end

    x_sol(i+1) = ( a(i) + b(i) ) / 2;
    i = i + 1;
  end
end
