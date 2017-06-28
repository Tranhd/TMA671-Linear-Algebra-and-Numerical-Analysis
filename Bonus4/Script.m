clear all
clc

%a,b
nl = 100;
tol = 1;
i = 1;
for n=1:nl
    [xhat,residual,fel,felnorm,rnorm] = Hilbert(n);
    if felnorm > tol && i == 1;
        disp('n to large:')
        n
        i = 2;
    end
end

%xhat blir oandvändbar redan vid n ? 12

%% c
clc
clear all
close all
clf

n = 1:1:12;
for i = 1:length(n)
  [xhat,residual,fel,felnorm(i),rnorm(i)] = Hilbert(n(i));
end
figure(1)
plot(n,felnorm,'b')
hold on
plot(n,rnorm,'r')
legend('Normen av felet','Normen av redidualen')

figure(2)
plot(n,rnorm,'r')
legend('Normen av residualen, inzoomat')

%% d
clear all
close all
clc
clf

n = 1:1:12;
for i=1:length(n)
    kondition(i) = cond(hilb(n(i)));
end
figure(3)
plot(n,kondition,'r')
legend('Konditionstalet')

%% Undersökning komd
clear all
close all
clc
clf

n = 1:1:20;
for i = 1:length(n)
    H = hilb(n(i));
    kondition(i) = cond(H);
    x = ones(n(i),1);
    b = H*x
    xhat = H\b;
    fel = xhat - x;
    felnorm(i) = norm(fel);
    residual = b - H*xhat;
    rnorm(i) = norm(residual);
    normx(i) = norm(xhat);
    normb(i) = norm(b);
end

y = (felnorm./normx)./(rnorm./normb)
plot(n,y,'r')
hold on
plot(n,kondition,'g')
legend('Det relativa felet i utdata genom det relativa felet i indata',...
    'Konditionstalet')

