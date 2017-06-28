function fly = Getflights(i,j,A)
%How many flights do you have to take to get from i to j
    flights = 0;
    Iter = 20;
    k = 0;
    while flights == 0 && k < Iter
        k = k+1;
        Ato = A^k;
        flights = Ato(i,j);
    end
    fly = k;
end

