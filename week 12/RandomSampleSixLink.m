function x = RandomSampleSixLink (obstacle)
% Generate a random freespace configuration for the robot
% Hint: use CollisionCheck(fv, obstacle) to check if the configuration is
% in freespace.

    while true
        angles = 360*rand(1,6);
        orientation = SixLinkRobot(angles);
        if CollisionCheck(orientation, obstacle) == false
            break
        end
    end

    x = angles;
    
end
