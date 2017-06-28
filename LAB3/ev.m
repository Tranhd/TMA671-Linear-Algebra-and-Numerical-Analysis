<afunction [val, stopp, riktn] = ev(~, y)
    val = sqrt(y(1)^2 + y(2)^2) - 1;
    stopp = [1];
    riktn = [1];
end

