MAX_ITERATION = 10000;

A = [1 7; 2 -1];
b = [9 18];
x = [0 0];


x = gauss_seidel(A, b, x, MAX_ITERATION);
x
