function A = perm(A,r,s) 
  [n,~] = size(A);

  P = eye(n);

  P(r,s) = 1;
  P(r,r) = 0;
  P(s,r) = 1;
  P(s,s) = 0;

  A = P*A;

end
