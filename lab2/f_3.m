function y = f_3(x) 
    h = 2.205;
    l1 = 7.55;
    l2 = 12.56;

    y = ( h / sqrt(l1.^2-x.^2) ) + ( h / sqrt(l2.^2 -x.^2) ) - 1;
end
