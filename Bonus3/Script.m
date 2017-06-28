%% Bonusuppgift 3
%Ludwig Tranheden ludtra@student.chalmers.se
%Jesper M�nsson   jesmans@student.chalmers.se
%TMA671, Linj�r algebra och numerisk analys.


%% a,b,d
clc
clear all

A = delsq(numgrid('S',13)); %Skapa matris.
temp = eye(length(A)); 
X0 = temp(:,1:6); %Startmatris av ordning 121x6.
eigx = (eig(A))'; %
eigx = sort(eigx,'descend');
eigx = eigx(1:6); %De 6 st�rsta egenv�rdena.
t = cputime;
[eigens,k] = OI(A,X0,eigx,10^-6,100000); %Ta fram 6 st�rsta egenv�rden och antal iterationer.
e = cputime-t;

%{
Korrekta egenv�rden (6 st�rsta), eigx: 
 7.863703305156271   7.663902460147020   7.663902460147004   7.464101615137761
 7.346065214951234   7.346065214951226

Ber�knade med ortogonal iteration, eigens:
7.863703305156275   7.663902460147014   7.663902460147012   7.464100904181588
7.346065914664489   7.346065214951234

Elementvis skillnad (*10^-6), eigx - eigens:
0.000000003552714  -0.000000006217249   0.000000007993606  -0.710956173044508
0.699713255336576   0.000000007993606

Antal iterationer, k:
2779

Ber�kningstiden st�rsta egenv�rden, e:
0.069999999999993 s
%}

%% c,d
clc

eigx = (eig(A))'; 
eigx = eigx(1:6); %De 6 minsta egenv�rdena.
t = cputime;
[eigens,k] = OI_min(A,X0,eigx,10^-6,100000); %Ta fram 6 minsta egenv�rden och antal iterationer.
e = cputime-t; 

%{
Korrekta egenv�rden (6 minsta), eigx: 
 0.136296694843717   0.336097539852976   0.336097539852987   0.535898384862246
 0.653934785048767   0.653934785048773

Ber�knade med ortogonal iteration, eigens:
0.136296694843727   0.336097539852986   0.336097539852986   0.535898974726955
0.653934065261886   0.653934785048769

Elementvis skillnad (*10^-6), eigx - eigens:
0.000000009797718   0.000000009825474  -0.000000000499600   0.589864709077403
-0.719786880654105  -0.000000003996803

Antal iterationer, k:
211

Ber�kningstiden minsta egenv�rden, e:
0.030000000000030 s
%}


%{
Det kr�vs allts� b�de f�rre iterationer och mindre tid (0.04 s) att ber�kna
de 6 minsta egenv�rdena. 
%}

