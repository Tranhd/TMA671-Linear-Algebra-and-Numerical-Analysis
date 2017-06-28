function [lambda,k] = OI_min(A,X0,eigx,eps,iter)
%Returnerar de minsta egenvärdena till matrisen A genom ortogonal iteration 
%Startmatris: X0 
%Önskad absolut tolerans: eps.
%iter - Max antal iterationer som körs.
%eigx - Korrekta egenvärden.

    Xkm = X0;
    stop = 10;
    k = 0;
    C=chol(A);
    while stop > eps && k <= iter
        [Q,R] = qr(Xkm,0);
        Z = ((C')\Q);
        Xk = (C\Z);
        Xkm = Xk;
        for i = 1:length(R)
            lambda(i) = 1/R(i,i);
        end
        stop = norm(lambda-eigx);
        k=k+1;
    end

end

