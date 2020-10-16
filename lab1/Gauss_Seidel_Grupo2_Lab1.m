function [x] = Gauss_Seidel_Grupo2_Lab1(A,b,x,s)
    largo=size(A,1);

    A_aux = Gauss_Grupo2_Lab1(A,b);

    A = A_aux(1:largo,1:largo);
    b = A_aux(:,largo+1);

    for i = 1:s
        for j = 1:largo
            %Necesitamos que sea vertical
            aux = A(j,:)*x';
            x(j) = ( 1/A(j,j) ) * ( b(j) - aux + A(j,j)*x(j) );
        end
        %Mostramos las iteraciones
        disp(x);
    end
end
