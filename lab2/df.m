function dy  = df(f,x,ej) 
  f = @f;
  dx = 10^-9;
  dy = ( f(x+dx)-f(x) ) / ( dx );
end
