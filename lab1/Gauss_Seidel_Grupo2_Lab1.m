function [x] = Gauss_Seidel_Grupo2_Lab1(A,b,x,s)
    largo=size(A,1);
    
    for i = 1:s
        for j = 1:largo
            %Necesitamos que sea vertical
            aux = A(j,:)*x';
            x(j) = ( 1/A(j,j) ) * ( b(j) - aux + A(j,j)*x(j) );
        end
    end
end
