function [xhat,residual,fel,felnorm,rnorm] = Hilbert(n)
%R�knar ut den approximativa l�sningen: xhat
%resudialen: residual
%felet: fel
%felets norm: felnorm
%residualens norm: rnorm
%f�r en nxn Hilbertmatris med den korrekta l�sningen x = ones(n,1).
    H = hilb(n);
    x = ones(n,1);
    b = H*x;
    xhat = H\b;
    fel = xhat - x;
    felnorm = norm(fel);
    residual = b - H*xhat;
    rnorm = norm(residual);
end

