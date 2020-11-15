function y = f(x) 
%  y = x.^4-3*sqrt(x.^2-0.5)+1./x-10;
%  y = x^x - 100;

    h = 2.205;
    l1 = 7.55;
    l2 = 12.56;

    y = ( h / abs( sqrt(l1^2-x^2) ) ) + ( h / abs( sqrt(l2^2 -x^2) ) ) - 1;

    % Ejercicio 1
    % A = 0.487;
    % B = 2.198;
    % C = 0.264;
    % E = 1.189;

    % y = A*sind(x)*cosd(x) + B*(sind(x)).^2 - C*cosd(x)-E*sind(x);
end
