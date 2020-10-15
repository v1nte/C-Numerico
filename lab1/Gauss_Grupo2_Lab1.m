function [g] = Gauss_Grupo2_Lab1(A,b)
    n=length(b);
    g=[A,b];
    for j=1:n-1
        %triangular inferior
        p=Perm_Grupo2_Lab1(g,j);
        g=p*g;
        for k=j+1:n
            al=-g(k,j)/g(j,j);
            g(k,:)=g(k,:)-g(j,:)*g(k,j)/g(j,j);
        end
    end
end
