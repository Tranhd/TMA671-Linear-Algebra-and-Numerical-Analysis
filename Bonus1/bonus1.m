%% Bonus1
clc
clear all
A = [0 1 1 0 1
     0 0 1 1 0
     1 1 0 0 0
     1 0 0 0 1
     0 1 0 1 0];
A2 = A^2;

A + A2;

%MAX FLIGHTS from i to j
B = zeros(5,5);
for i = 1:5A
    for j=1:5
        B(i,j) = Getflights(i,j,A);
    end
end
B
%%
Anew = [0 1 0 0 1
       0 0 1 1 0
       1 0 0 0 0
       1 0 0 0 1
       0 0 0 1 0];
   
%MAX FLIGHTS from i to j
Bnew = zeros(5,5);
for i = 1:5
    for j=1:5
        Bnew(i,j) = Getflights(i,j,Anew)
    end
end
B
Bnew

%% f
clc
syms a b c d e f g h i j k
Alast = [0 1 a b 1
         c 0 1 1 d
         1 e 0 f g
         1 h i 0 1
         j 1 k 1 0];

Al2 = Alast^2 + Alast

G = [2 1 1 1 0 0 0 0 0 0 0 0 0 1 0 0;
    0 0 2 1 0 1 1 0 0 0 1 0 0 0 0 0
    0 1 0 0 0 0 1 2 0 0 0 0 0 0 0 0
    0 1 0 0 0 0 0 0 0 0 1 1 0 0 1 0
    0 0 1 0 0 0 1 0 1 1 0 0 0 0 0 0];

for i = 1:16
   x = zeros(16,1);
   x(i) = 1;
   G*x
end

x = zeros(16,1);
x(2) = 1;
x(7) = 1;
G*x
% Blast = zeros(5,5);
% for i = 1:5
%     for j=1:5
%         Blast(i,j) = Getflights(i,j,Alast)
%     end
% end
% Blast
% R = rref(A)
