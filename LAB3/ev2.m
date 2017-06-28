function fun = ev2(x)
A = [0 0 1 0
    0 0 0 1
    0 0 0 1
    0 0 -1 0];
b = [0 0 1 0]';

u0 = [1 0 x 0]';
yprime = @(t, y) A*y + b;
set = odeset('Events', @ev);
[t,u] = ode45(yprime, [0 2], u0, set);
x1 = u(:,1);
x2 = u(:,2);
lamnar = [x1(end) x2(end)];
fun = lamnar - [0 1];
end

