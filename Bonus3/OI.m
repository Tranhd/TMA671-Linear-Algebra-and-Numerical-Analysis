function [lambda,k] = OI(A,X0,eigx,eps,iter)
%Returnerar de st�rsta egenv�rdena till matrisen A genom ortogonal iteration 
%Startmatris: X0 
%�nskad absolut tolerans: eps.
%iter - Max antal iterationer som k�rs.
%eigx - Korrekta egenv�rden.
    
    Xkm = X0;
    stop = 10;
    k = 0;
    while stop > eps && k <= iter
        [Q,R] = qr(Xkm,0);
        Xk = A*Q;
        Xkm = Xk;
        for i = 1:length(R)
            lambda(i) = R(i,i);
        end
        stop = norm(lambda-eigx);
        k=k+1;
    end

end

