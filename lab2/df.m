function dy  = df(f,x) 
  f = @f;
  dx = 10^-6;
  dy = ( f(x+dx)-f(x) ) / ( dx );
end
