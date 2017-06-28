function [xhat,residual,fel,felnorm,rnorm] = Hilbert(n)
%Räknar ut den approximativa lösningen: xhat
%resudialen: residual
%felet: fel
%felets norm: felnorm
%residualens norm: rnorm
%för en nxn Hilbertmatris med den korrekta lösningen x = ones(n,1).
    H = hilb(n);
    x = ones(n,1);
    b = H*x;
    xhat = H\b;
    fel = xhat - x;
    felnorm = norm(fel);
    residual = b - H*xhat;
    rnorm = norm(residual);
end

