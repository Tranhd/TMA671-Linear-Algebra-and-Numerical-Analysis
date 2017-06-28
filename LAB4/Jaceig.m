function eigs = Jaceig(w1,w2,w3)
Gamma = [0.265 -0.995 0.882]';

Jac = @(w1,w2,w3) [0 Gamma(1)*w3 Gamma(1)*w2
                   Gamma(2)*w3 0   Gamma(2)*w1
                   Gamma(3)*w2 Gamma(3)*w1 0];
               
eigs = eig(Jac(w1,w2,w3));
end

