%% 
clc
clear all
close all
clf

[a, b, c] = sphere(32);
h = surfl(a, b, c);
set(h, 'FaceAlpha', 0.5)
shading interp
axis equal;
hold on;
shading flat;
x = maxdist(3, 6);
scatter3(x(1,:), x(2,:), x(3,:),'filled','r')
hold on

%% d
clc
%x = maxdist(3, 6);
A = x'*x;

temp = zeros(1,size(A,2));
alp = zeros(1,size(A,2));
for i=1:size(A,2)
    for j=1:size(A,2)
        if i ~=j
        temp(i) = temp(i) + abs(A(i,j));
        end
    end
    alp(i) = (abs(A(i,i)) - temp(i))/abs(A(i,i));
end
alpha = min(alp)

%% hej
clf
close all
clc

[a, b, c] = sphere(32);
h = surfl(a, b, c);
set(h, 'FaceAlpha', 0.5)
shading interp
axis equal;
hold on;
shading flat;

I = eye(size(x,1));
index = find(min(x(1,:)));
v = (x(:,index) - I(:,1))/(norm(x(:,index) - I(:,1)));
H = I - 2*(v*v');
y = H*x;
scatter3(y(1,:), y(2,:), y(3,:),'filled','g')
hold on

e3 = I(:,3);
[mx,index2] = max(y(3,:));
sign =  (y(2,index2)/abs(y(2,index2)));
theta = sign*acos(dot(y(:,index2),e3)/norm(y(:,index2)));
Rot = [1 0 0; 0 cos(theta) -sin(theta); 0 sin(theta) cos(theta)];
finalx = Rot*y
scatter3(finalx(1,:), finalx(2,:), finalx(3,:),'filled','c')
legend('Sphere','Efter householder','Efter rotation')
Anew = x'*x;

