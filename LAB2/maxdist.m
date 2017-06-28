function y = maxdist(dimension,points)
%input = (dimension of points,number of points)
%maximizes the distance between points

x0 = rand(dimension, points);
o = optimset('MaxIter', 1e16, 'MaxFunEvals', 1e16,'Algorithm','Interior-point');

nonlcon = @spheremin;
y = fmincon(@fun, x0, [], [], [], [], [], [],nonlcon, o);

end

