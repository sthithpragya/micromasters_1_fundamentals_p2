function out = DistSixLink (x1, x2)
% Compute the distance between two sets of six link coordinates
% Note we assume all angular coordinates are between 0 and 360
% Use sum of the absolute value of angle difference (L1 norm) as the
% distance.
% Note this is angle difference.
% i.e. DistSixLink([0, 0, 0, 0, 0, 0], [360, 360, 360, 360, 360, 360]) = 0

diff = min(abs(x1-x2),360-abs(x1-x2));
out = diff(1) + diff(2) + diff(3) + diff(4) + diff(5) + diff(6);


end
