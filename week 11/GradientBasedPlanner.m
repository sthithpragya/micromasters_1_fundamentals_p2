function route = GradientBasedPlanner (f, start_coords, end_coords, max_its)
% GradientBasedPlanner : This function plans a path through a 2D
% environment from a start to a destination based on the gradient of the
% function f which is passed in as a 2D array. The two arguments
% start_coords and end_coords denote the coordinates of the start and end
% positions respectively in the array while max_its indicates an upper
% bound on the number of iterations that the system can use before giving
% up.
% The output, route, is an array with 2 columns and n rows where the rows
% correspond to the coordinates of the robot as it moves along the route.
% The first column corresponds to the x coordinate and the second to the y coordinate

[gx, gy] = gradient (-f);
route = start_coords;
it = 0;
%%% All of your code should be between the two lines of stars.
% *******************************************************************
while it < max_its &&  (end_coords(1) - route(end,1))^2 + (end_coords(2) - route(end,2))^2 > 4
    int_x = round(route(end,1));
    int_y = round(route(end,2));
    grad_x = gx(int_y,int_x);
    grad_y = gy(int_y,int_x);
    norm_gx = grad_x/sqrt(grad_x^2 + grad_y^2);
    norm_gy = grad_y/sqrt(grad_x^2 + grad_y^2);
    new_x = route(end,1) + norm_gx;
    new_y = route(end,2) + norm_gy;
    route = [route; [new_x new_y]];
    it = it + 1;
% *******************************************************************
end
