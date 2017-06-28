function f = fun(x)
%UNTITLED2 Summary of this function goes here
% X: #rader = Dimension  #Kolonner = punkter

l = size(x,2); %Number of points = l
M = zeros(l); % lxl Matrix
f = 0;
for i=1:l
    for j=1:l
        M(i, j) = norm(x(:,i) - x(:,j));
        if(M(i,j) ~= 0)
            f = f - M(i,j);
        end
    end
end