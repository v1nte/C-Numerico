function [c] = Gauss_Jordan_Grupo2_Lab1(A,b)
    c = Gauss_Grupo2_Lab1(A,b);
    m = length(c);
    %triangular superior
    for j = m-1:-1:1
        for i = j-1:-1:1
            c(i,:)=c(i,:)-c(j,:)*(c(i,j)/c(j,j));
        end
    end
    %diagonal
    for k=1:m-1
        c(k,:)=c(k,:)/c(k,k);
    end
end
