function x = gauss_seidel(A, b, x, k_s) 
  for i = 1:k_s
    for j = 1:size(A,1)
      
      % We can't multiply two 1xn vectrors, that's why <<x>> is x'
      aux = A(j,:)*x';

      x(j) = ( 1/A(j,j) ) * ( b(j) - aux + A(j,j)*x(j) );
      x;
    end
  end
end
    
