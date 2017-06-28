function [c,ceq] = spheremin(x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

c = zeros(size(x,2),1); %vector of ones len = #points
ceq = sqrt(sum(x.^2, 1))' - ones(size(x,2), 1); % x^2 + y^2 + ... -1 = 0

end

