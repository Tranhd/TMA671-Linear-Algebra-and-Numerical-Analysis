%%a
clc
clear all
close all
clf

x = 0:0.01:2*pi;
plot(cos(x),sin(x),'b')
grid on
hold on

A = [0 0 1 0
    0 0 0 1
    0 0 0 1
    0 0 -1 0];
b = [0 0 1 0]';

set = odeset('Events', @ev);
yprime = @(t,y) A*y + b;
[t,u] = ode45(yprime,[0 2],[1 0 -2 0]',set);
x = u(:,1);
y = u(:,2);
lamnarode = [x(end) y(end)] %
riserun = (y(end) - y(length(y)-1))/abs(x(end) - x(length(x)-1));
y = [y; y(end) + riserun];
x = [x; x(end)+1];

plot(x,y,'r')
axis([-1.5 1.5 -1.5 1.5])

% EF

koord = Eulerforward(yprime,[0 2],[1 0 -2 0]',0.1);
x = koord(:,1);
y = koord(:,2);
lamnarEF = [x(end) y(end)] %

riserun = (y(end) - y(length(y)-1))/abs((x(end) - x(length(x)-1)));

y = [y; y(end) + riserun];
x = [x; x(end)+1];
plot(x,y,'--')

axis([-1.5 1.5 -1.5 1.5])

% EB
koord = Eulerback(yprime,[0 2],[1 0 -2 0]',0.1);
x = koord(:,1);
y = koord(:,2);
lamnarEB = [x(end) y(end)] %
riserun = (y(end) - y(length(y)-1))/abs((x(end) - x(length(x)-1)));

y = [y; y(end) + riserun];
x = [x; x(end)+1];
plot(x,y,'--')

axis([-1.5 1.5 -1.5 1.5])

% Trapets
koord = Trapets(yprime,[0 2],[1 0 -2 0]',0.1);
x = koord(:,1);
y = koord(:,2);
lamnarTrapets = [x(end) y(end)] %
riserun = (y(end) - y(length(y)-1))/abs((x(end) - x(length(x)-1)));

y = [y; y(end) + riserun];
x = [x; x(end)+1];
plot(x,y,'b*')

axis([-1.5 1.5 -1.5 1.5])
legend('Enhetscirkel','ODE45','Euler framåt','Euler bakåt','Trapets')
%Mest nogrann trapetsmetoden "Medelvärde av Euler"

%%
A = [0 0 1 0
    0 0 0 1
    0 0 0 1
    0 0 -1 0];
eig(A) %0,0,i,-i
%Trapets och Euler bakåt stabila (A-stabila)
%Euler framåt inte stabil (ej A stabil)
%% f
close all 
clear all
clc
clf

u0 = fsolve(@ev2,-1)

x = 0:0.01:2*pi;
plot(cos(x),sin(x),'b')
grid on
hold on

A = [0 0 1 0
    0 0 0 1
    0 0 0 1
    0 0 -1 0];
b = [0 0 1 0]';

set = odeset('Events', @ev);
yprime = @(t,y) A*y + b;
[t,u] = ode45(yprime,[0 1.5],[1 0 u0 0]',set);
x = u(:,1);
y = u(:,2);
riserun = (y(end) - y(length(y)-1))/abs(x(end) - x(length(x)-1));
y = [y; y(end) + riserun];
x = [x; x(end)+1];

plot(x,y,'r')
axis([-1.5 1.5 -1.5 1.5])
