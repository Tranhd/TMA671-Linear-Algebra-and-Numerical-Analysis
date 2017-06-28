function yk = Eulerforward(f, in, y0, h)
    tk = in(1);
    yk = y0';
    while(tk <= in(2) && sqrt(y0(1)^2 + y0(2)^2) <= 1)
        y = y0 + h*f(tk,y0);
        tk = tk+h;
        y0 = y;
        yk = [yk; y0'];
    end
end

