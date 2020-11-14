function [X] = secant_method(f, x0, x1, tol, N, ej) 
    f = @f;
    X(1) = x0;
    X(2) = x1;
    X(3) = ( X(1) * f(X(2),ej) - ( X(2) * f(X(1), ej) ) ) / ( f(X(2),ej) - f(X(1),ej) );

    i = 3;
    while ( abs(X(i) - X(i-1))/X(i) > tol && i <=N )
        X(i+1) = ( X(i-1) * f(X(i), ej) - X(i) * f(X(i-1), ej) ) / ( f(X(i), ej) - f(X(i-1), ej) );
        i = i + 1;
    end
