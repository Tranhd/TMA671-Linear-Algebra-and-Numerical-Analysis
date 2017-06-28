%% Laboration 1 TMA671

%% a)
clc
clear all
h=6.6256e-34; %Constants
c=2.9979e8;
k=1.3805e-23;

opt = optimset('TolX' , 1e-10); 
Ts = [3000 4000 5000];

for i=1:length(Ts)
    fun = @(x) -planck(x,Ts(i));
    x(i) = fminbnd(fun,0,3e-6,opt); %Find min (-f) -> Max of f
    b(i) = x(i)*Ts(i); %Wiens Constant
end
x
b % 0.0029 

%fplot(fun,[0 3e-6])
%% b)
clc
close all
clf

dfun = @(x) (5-x).*exp(x) - 5; %f
ddfun = @(x) 5*exp(x) - exp(x) - x.*exp(x); %d/dx(f)
fplot(dfun,[2 6],'r') %roughly locate x*

tol = 1e-10; %Tolerans
x = 5;  %Startpoint
stop = 1; 
eps = 1e-6; 
while abs(stop) > tol %Stop when close to zero
   if abs(ddfun(x)) < eps %Break if denominator to small
       break;       
   end
   temp = x - dfun(x)/ddfun(x); %Update
   stop = abs(temp-x); 
   x = temp;
end
x
WienC = (h*c)/(x*k) %0.0029 -> SAME

%% c)
clc
close all
clf
clear all

t1 = cputime;
sigma=5.67e-8; %Stefan-Boltzmanns konstant
plankI = @(T) quadl(@(x) planck(x,T), 4e-7, 7e-7); %Quadl integral function of T

Ts = 100:10:10000; 
kvot = zeros(1,length(Ts));
for i=1:length(Ts)
    N = plankI(Ts(i)); %Ms(T(i))
    D = sigma*(Ts(i)^4); %Me(T(i))
    kvot(i) = N/D; %Kvoten
end
plot(Ts,kvot)
find(max(kvot) == kvot);
Ts(695) %Temperatur när kvoten är störst
e1 = cputime-t1
%% d)
clc
close all
clf
clear all

t2 = cputime;
sigma=5.67e-8; %Stefan-Boltzmanns konstant
Ts = 100:10:10000; 
kvot = zeros(1,length(Ts));
for i=1:length(Ts)
    [t, Sol] = ode45(@(l, x) planck(l,Ts(i)), [4e-7, 7e-7], 0);
    N = Sol(length(t));
    D = sigma*(Ts(i)^4); %Me(T(i))
    kvot(i) = N/D; %Kvoten
end
plot(Ts,kvot)
find(max(kvot) == kvot);
Ts(695) %Temperatur när kvoten är störst
e2 = cputime-t2