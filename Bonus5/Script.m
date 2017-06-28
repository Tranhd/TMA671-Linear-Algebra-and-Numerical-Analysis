%% a
clear all
close all
clc
close all

x = [1.02 0.95 0.87 0.77 0.67 0.56 0.44 0.30 0.16 0.01]';
y = [0.39 0.32 0.27 0.22 0.18 0.15 0.13 0.12 0.13 0.15]';

xto2 = x.^2;
yto2 = x.^2;
xy = x.*y;

A = [yto2 xy x y ones(length(x),1)];
b = xto2;


param = A\b
scatter(x,y,'*r');
hold on
[x,y] = meshgrid(-1.5:0.1:5);
f = param(1)*y.^2 + param(2)*x.*y + param(3)*x + param(4)*y - x.^2;             
contour(x,y,f,[-param(5) -param(5)],'b');  

%% b
clear all
close all
clc
clf

for i=1:3
    x = [1.02 0.95 0.87 0.77 0.67 0.56 0.44 0.30 0.16 0.01]';
    y = [0.39 0.32 0.27 0.22 0.18 0.15 0.13 0.12 0.13 0.15]';
    y = y + rand(length(y),1)*(i-1);
    
    xto2 = x.^2;
    yto2 = x.^2;
    xy = x.*y;
    
    A = [yto2 xy x y ones(length(x),1)];
    b = xto2
    
    param = A\b;
    plot(xto2,'r')
    hold on
    plot(A*param,'--b')
    hold on
end
