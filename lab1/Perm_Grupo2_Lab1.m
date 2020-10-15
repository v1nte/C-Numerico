function [p] = Perm_Grupo2_Lab1(A,k)
    [n,m]=size(A);
    p=eye(n);
    m=max(abs(A(k:n,k)));
    r=find(abs(A(k:n,k))==m)+k-1;
    r=r(1);
    p(r,k)=1;
    p(k,r)=1;
    if r~=k
        p(r,r)=0;
        p(k,k)=0;
    end
    A=p*A;
end
