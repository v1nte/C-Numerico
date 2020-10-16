function [x] = Gauss_Seidel_Grupo2_Lab1(A,b,x,s)
    largo=size(A,1);

    % Asegurarse de que no hayan 0 en la diagonal
    A_aux = Gauss_Grupo2_Lab1(A,b);

    A = A_aux(1:largo,1:largo);
    b = A_aux(:,largo+1);

    for i = 1:s
        for j = 1:largo
            %Necesitamos que sea vertical
            aux = A(j,:)*x';
            x(j) = ( 1/A(j,j) ) * ( b(j) - aux + A(j,j)*x(j) );
        end
        %Mostramos las últimas 3 iteraciones
        if i > s-3
            fprintf('Iteracion numero %i :',i);
            disp(x);
        end
    end
end
