function [z] = Sol_Gauss_Grupo2_Lab1(A,b)
    a=Gauss_Grupo2_Lab1(A,b);
    n=length(a);
    k=n-1;
    h=a;
    z=zeros(k,1);
    for i=k:-1:1
        z(i)=h(i,n)/h(i,i)-h(i,i+1:k)*z(i+1:k)/h(i,i);
    end
end
