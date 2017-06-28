%% a
clear all
clc
close all
clf

Gamma = [0.265 -0.995 0.882]';
%fall 1
Bvfall1 = [1 0.1/max(abs(Gamma)) 0.1/max(abs(Gamma))]';
%fall2
Bvfall2 = [0.1/max(abs(Gamma)) 1 0.1/max(abs(Gamma))]';

figure(1)
[t,u] = ode45(@(t,y)Euler(t,y,Gamma),[0 10],Bvfall1);
plot(t,u(:,1),t,u(:,2),t,u(:,3))
legend('w1','w2','w3')
hold on

figure(2)
[t,u] = ode45(@(t,y)Euler(t,y,Gamma),[0 10],Bvfall2);
plot(t,u(:,1),t,u(:,2),t,u(:,3))
legend('w1','w2','w3')

%% b

clear all
clc
close all
clf

Gamma = [0.265 -0.995 0.882]';
%fall 1
Bvfall1 = [1 0.1/max(abs(Gamma)) 0.1/max(abs(Gamma))]';
%fall2
Bvfall2 = [0.1/max(abs(Gamma)) 1 0.1/max(abs(Gamma))]';

figure(1)
[t,u] = ode45(@(t,y)Euler(t,y,Gamma),[0 50],Bvfall1);
plot(t,u(:,1),t,u(:,2),t,u(:,3))
legend('w1','w2','w3')
hold on
for i=1:15:length(t)
scatter(t(i),max(real((Jaceig(u(i,1),u(i,2),u(i,3))))),'r*');
%Jaceig(u(i,1),u(i,2),u(i,3))
end

figure(2)
[t,u] = ode45(@(t,y)Euler(t,y,Gamma),[0 50],Bvfall2);
plot(t,u(:,1),t,u(:,2),t,u(:,3))
legend('w1','w2','w3')
hold on 
for i=1:5:length(t)
scatter(t(i),max(real((Jaceig(u(i,1),u(i,2),u(i,3))))),'r*');
%Jaceig(u(i,1),u(i,2),u(i,3))
end

%% b2

clear all
clc
close all
clf

Gamma = [0.265 -0.995 0.882]';
%fall 1
Bvfall1 = 8*[rand() rand() rand()]';
%fall2
Bvfall2 = 8*[rand() rand() rand()]';

figure(1)
[t,u] = ode45(@(t,y)Euler(t,y,Gamma),[0 50],Bvfall1);
plot(t,u(:,1),t,u(:,2),t,u(:,3))
legend('w1','w2','w3')
hold on
for i=1:15:length(t)
scatter(t(i),max(real((Jaceig(u(i,1),u(i,2),u(i,3))))),'r*');
%Jaceig(u(i,1),u(i,2),u(i,3))
end

figure(2)
[t,u] = ode45(@(t,y)Euler(t,y,Gamma),[0 50],Bvfall2);
plot(t,u(:,1),t,u(:,2),t,u(:,3))
legend('w1','w2','w3')
hold on 
for i=1:5:length(t)
scatter(t(i),max(real((Jaceig(u(i,1),u(i,2),u(i,3))))),'r*');
%Jaceig(u(i,1),u(i,2),u(i,3))
end