clear
close all
clc


%
%==================
%   Ejercicio 1
%==================
%
fprintf('==================\n');
fprintf('   Ejercicio 1: \n');
fprintf('==================\n');
A=[
   99 -32 -50   0   0   0  -5;
  -32  72  -5 -35   0   0   0;
  -50  -5 127 -60   0   0 -12;
    0 -35 -60 163 -25 -43   0;
    0   0   0 -25  58  -3   0;
    0   0   0 -43  -3 131   0;
   -5   0 -12   0   0   0   42
  ]; 
b = [220;0;0;0;0;0;0];
fprintf('\n Matriz Ampliada: \n');

%Mostrar como Matriz ampliada
disp([A,b]);
fprintf('\n\n');

%gauss
fprintf('------------\n');
fprintf('Gauss\n');
fprintf('------------\n');
fprintf('x = \n');
x = Sol_Gauss_Grupo2_Lab1(A,b);
disp(x');

%Gauss-Jordan
y = Gauss_Jordan_Grupo2_Lab1(A,b);
fprintf('\n\n');
fprintf('------------\n');
fprintf('Gauss-Jordan\n');
fprintf('------------\n');
fprintf('x= \n');
disp(y);

%Gauss-Seidel
fprintf('\n\n');
fprintf('------------\n');
fprintf('Gauss-Seidel\n');
fprintf('------------\n');

largob = length(b);
z = zeros(1,largob);

fprintf('Cantidad de iteraciones = 20 \n');
fprintf('\n ultimas 3 iteraciones: \n');

z = Gauss_Seidel_Grupo2_Lab1(A,b,z,20);

fprintf('X_final = \n');
disp(z)

%
%
%Ejercicio 2
%
%

fprintf('\n\n\n\n\n');
fprintf('==================\n');
fprintf('   Ejercicio 2: \n');
fprintf('==================\n');
C=[
 1 cos(5/36*pi) -cos(1/9*pi) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
 0 sin(5/36*pi) sin(1/9*pi) -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
 0 -cos(5/36*pi) 0 0 cos(2/9*pi) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
 0 sin(5/36*pi) 0 0 sin(2/9*pi) -1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
 0 0 cos(1/9*pi) 0 0 0 cos(1/18*pi) sin(1/4*pi) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
 0 0 sin(1/9*pi) 0 0 1 -sin(1/18*pi) cos(1/4*pi) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
 0 0 0 0 -cos(2/9*pi) 0 -cos(1/18*pi) 0 cos(1/3*pi) sin(1/36*pi) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
 0 0 0 0 sin(2/9*pi) 0 -sin(1/18*pi) 0 -sin(1/3*pi) -cos(1/36*pi) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
 0 0 0 0 0 0 0 -cos(1/4*pi) 0 cos(19/36*pi) 1 sin(1/12*pi) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
 0 0 0 0 0 0 0 sin(1/4*pi) 0 sin(19/36*pi) 0 -cos(1/12*pi) 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
 0 0 0 0 0 0 0 0 -cos(1/3*pi) 0 -1 0 sin(1/18*pi) sin(1/9*pi) 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
 0 0 0 0 0 0 0 0 sin(1/3*pi) 0 0 0 -cos(1/18*pi) cos(1/9*pi) 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
 0 0 0 0 0 0 0 0 0 0 0 -cos(5/12*pi) 0 -cos(7/18*pi) 1 cos(5/12*pi) sin(1/9*pi) 0 0 0 0 0 0 0 0 0 0 0;
 0 0 0 0 0 0 0 0 0 0 0 sin(5/12*pi) 0 -sin(5/12*pi) 0 sin(5/12*pi) -cos(1/9*pi) 0 0 0 0 0 0 0 0 0 0 0;
 0 0 0 0 0 0 0 0 0 0 0 0 -cos(4/9*pi) 0 -1 0 0 -cos(4/9*pi) 0 0 0 0 0 0 0 0 0 0;
 0 0 0 0 0 0 0 0 0 0 0 0 sin(4/9*pi) 0 0 0 0 -sin(4/9*pi) 0 0 0 0 0 0 0 0 0 0;
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -cos(7/18*pi) cos(4/9*pi) -1 -cos(1/3*pi) 0 0 0 0 0 0 0 0;
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 sin(1/18*pi) sin(4/9*pi) 0 -sin(1/3*pi) 0 0 0 0 0 0 0 0;
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -cos(5/12*pi) 0 0 1 0 cos(19/36*pi) cos(19/36*pi) 0 0 0 0 0 0 ;
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 sin(5/12*pi) 0 0 0 0 sin(19/36*pi) sin(19/36*pi) 0 0 0 0 0 0;
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 sin(1/6*pi) -cos(1/36*pi) 0 -cos(1/18*pi) -cos(2/9*pi) 0 0 0 0;
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 cos(1/6*pi) sin(1/36*pi) 0 sin(1/18*pi) -sin(2/9*pi) 0 0 0 0 ;
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -sin(1/4*pi) sin(4/9*pi) 0 cos(1/9*pi) 0 0 0;
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -cos(1/4*pi) cos(4/9*pi) 0 sin(1/9*pi) -1 0 0;
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 cos(2/9*pi) 0 0 -cos(5/36*pi) 0;
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 sin(2/9*pi) 0 1 sin(5/36*pi) 0;
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 cos(7/18*pi) 0 cos(13/36*pi) 0;
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -sin(7/18*pi) 0 sin(13/36*pi) 1
 ];
 
disp(C);
fprintf('\n');
d = [0, 0, 800, 0, 0, 0, 1500, 0, 0, 0, 1000, 0, 0, 0, 1200, 0, 1000, 0, 0, 0, 1500, 0, 0, 0, 800, 0, 0, 0];
d = d';
disp(d);

%Gauss
fprintf('------------\n');
fprintf('Gauss\n');
fprintf('------------\n');
fprintf('x= \n');
x = Sol_Gauss_Grupo2_Lab1(C,d);
disp(x);

%Gauss-Jordan
y = Gauss_Jordan_Grupo2_Lab1(C,d);
fprintf('\n\n');
fprintf('------------\n');
fprintf('Gauss-Jordan\n');
fprintf('------------\n');
fprintf('x = \n');
disp(y);

%Gauss-Seidel
fprintf('\n\n');
fprintf('------------\n');
fprintf('Gauss-seidel\n');
fprintf('------------\n');

z = zeros(1,length(d));

fprintf('cantidad de iteraciones = 20 \n');
fprintf('\n ultimas 3 iteraciones: \n');

z = Gauss_Seidel_Grupo2_Lab1(C,d,z,20);
fprintf('X_final = \n');
disp(z)
