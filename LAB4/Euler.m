function yprime = Euler(t,y,gamma)
yprime(1) = gamma(1)*y(2)*y(3);
yprime(2) = gamma(2)*y(1)*y(3);
yprime(3) = gamma(3)*y(1)*y(2);
yprime = yprime';
end

