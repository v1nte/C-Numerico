function [X] = secant_method(f, x0, x1, tol, N) 
    f = @f;
    X(1) = x0;
    X(2) = x1;
    X(3) = ( X(1) * f(X(2)) - ( X(2) * f(X(1)) ) ) / ( f(X(2)) - f(X(1)) );

    i = 3;
    while ( abs(X(i) - X(i-1))/X(i) > tol && i <=N )
        X(i+1) = ( X(i-1) * f(X(i)) - X(i) * f(X(i-1)) ) / ( f(X(i)) - f(X(i-1)) );
        i = i + 1;
    end
