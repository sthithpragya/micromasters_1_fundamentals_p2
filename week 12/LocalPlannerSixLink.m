function out = LocalPlannerSixLink (x1, x2, obstacle)
% Generate a random freespace configuration for the robot
% This function checks if you can generate a straight line between x1 and 
% x2 without collision. It return true when there is a valid line.



vector_list = x1;

while true
    x = vector_list(:,end);
    dist_vector = x2 - x;
    dist_length = sqrt(dist_vector(1)^2 + dist_vector(2)^2 + dist_vector(3)^2 + dist_vector(4)^2 + dist_vector(5)^2 + dist_vector(6)^2);
    if x2 - x == zeros(6,1) | dist_length <= 1
        out = true;
        break
    end
    
    % taking test point at 1degree distance
    xn = x + dist_vector/dist_length;
    orientation = SixLinkRobot(xn);
    
    if CollisionCheck(orientation, obstacle) == true
        out = false;
        break
    end

    vector_list = [vector_list, xn];

end
end
