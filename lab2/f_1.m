function [out] = f_1(x) 
    A = 0.487;
    B = 2.198;
    C = 0.264;
    E = 1.189;

    y = A*sind(x)*cosd(x) + B*sind(2*x) - C*cosd(x)-E*sind(x);
end
