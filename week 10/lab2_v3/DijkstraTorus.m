function route = DijkstraTorus(input_map, start_coords, dest_coords, drawMap)
% Run Dijkstra's algorithm on a grid.
% Inputs :
%   input_map : a logical array where the freespace cells are false or 0 and
%      the obstacles are true or 1
%   start_coords and dest_coords : Coordinates of the start and end cell
%       respectively, the first entry is the row and the second the column.
% Output :
%   route : An array containing the linear indices of the cells along the
%    shortest route from start to dest or an empty array if there is no
%    route.

% set up color map for display
% 1 - white - clear cell
% 2 - black - obstacle
% 3 - red = visited
% 4 - blue  - on list
% 5 - green - start
% 6 - yellow - destination

cmap = [1 1 1; ...
    0 0 0; ...
    1 0 0; ...
    0 0 1; ...
    0 1 0; ...
    1 1 0];

colormap(cmap);


[nrows, ncols] = size(input_map);

% map - a table that keeps track of the state of each grid cell
map = zeros(nrows,ncols);

map(~input_map) = 1;  % Mark free cells
map(input_map)  = 2;  % Mark obstacle cells

% Generate linear indices of start and dest nodes
start_node = sub2ind(size(map), start_coords(1), start_coords(2));
dest_node  = sub2ind(size(map), dest_coords(1),  dest_coords(2));

map(start_node) = 5;
map(dest_node)  = 6;

% Initialize distance array
distances = Inf(nrows,ncols);

% For each grid cell this array holds the index of its parent
parent = zeros(nrows,ncols);

distances(start_node) = 0;

% Main Loop
while true
    
    % Draw current map
    map(start_node) = 5;
    map(dest_node) = 6;
    
    if drawMap
        image(1.5, 1.5, map);
        grid on;
        axis image;
        drawnow;
    end
    
    % Find the node with the minimum distance
    [min_dist, current] = min(distances(:));
    
    if ((current == dest_node) || isinf(min_dist))
        break
    end
    
    % Update map
    map(current) = 3;         % mark current node as visited
    distances(current) = Inf; % remove this node from further consideration
    
    % Compute row, column coordinates of current node
    [i, j] = ind2sub(size(distances), current);
    
    % Visit each neighbor of the current node and update the map, distances
    % and parent tables appropriately.
    
    %%% All of your code should be between the two lines of stars.
    % *******************************************************************
    %east neighbour
    if j+1 <= ncols
        if map(i,j+1) == 1
            map(i,j+1) = 4;
            parent(i,j+1) = current;
            distances(i,j+1) = min_dist + 1;           
        elseif map(i,j+1) == 4        
            if min_dist + 1 < distances(i,j+1)
               distances(i,j+1) = min_dist + 1;
               parent(i,j+1) = current;
            end
        elseif map(i,j+1) == 6
            parent(i,j+1) = current;
            distances(i,j+1) = min_dist + 1;
        end
    end
    
    if j == ncols
        
        map(:,1) = 2*ones(181,1);    
        if map(i,2) == 1
           map(i,2) = 4;
           parent(i,2) = current;
           distances(i,2) = min_dist + 1;           
        elseif map(i,2) == 4        
            if min_dist + 1 < distances(i,2)
               distances(i,2) = min_dist + 1;
               parent(i,2) = current;
            end
        elseif map(i,2) == 6
            parent(i,2) = current;
            distances(i,2) = min_dist + 1;
        end 
    end
    
    %west neighbour
    if j-1 >= 1
        if map(i,j-1) == 1
           map(i,j-1) = 4;
           parent(i,j-1) = current;
           distances(i,j-1) = min_dist + 1;
        elseif map(i,j-1) == 4        
            if min_dist + 1 < distances(i,j-1)
               distances(i,j-1) = min_dist + 1;
               parent(i,j-1) = current;
            end
        elseif map(i,j-1) == 6
            parent(i,j-1) = current;
            distances(i,j-1) = min_dist + 1;
        end
    end
    
    if j == 1
        map(:,1) = 2*ones(181,1);
        if map(i,ncols-1) == 1
           map(i,ncols-1) = 4;
           parent(i,ncols-1) = current;
           distances(i,ncols-1) = min_dist + 1;
        elseif map(i,ncols-1) == 4        
            if min_dist + 1 < distances(i,ncols-1)
               distances(i,ncols-1) = min_dist + 1;
               parent(i,ncols-1) = current;
            end
        elseif map(i,ncols-1) == 6
            parent(i,ncols-1) = current;
            distances(i,ncols-1) = min_dist + 1;
        end
    end
    
    %south neighbour
    if i+1 <= nrows
        if map(i+1,j) == 1
           map(i+1,j) = 4;
           parent(i+1,j) = current;
           distances(i+1,j) = min_dist + 1;
        elseif map(i+1,j) == 4        
            if min_dist + 1 < distances(i+1,j)
               distances(i+1,j) = min_dist + 1;
               parent(i+1,j) = current;
            end
        elseif map(i+1,j) == 6
            parent(i+1,j) = current;
            distances(i+1,j) = min_dist + 1;
        end
    end
    
    if i == nrows
        map(1,:) = 2*ones(1,181);
        if map(2,j) == 1
           map(2,j) = 4;
           parent(2,j) = current;
           distances(2,j) = min_dist + 1;
        elseif map(2,j) == 4        
            if min_dist + 1 < distances(2,j)
               distances(2,j) = min_dist + 1;
               parent(2,j) = current;
            end
        elseif map(2,j) == 6
            parent(2,j) = current;
            distances(2,j) = min_dist + 1;
        end
    end
    
    %north neighbour
    if i-1 >= 1
        if map(i-1,j) == 1
           map(i-1,j) = 4;
           parent(i-1,j) = current;
           distances(i-1,j) = min_dist + 1;
        elseif map(i-1,j) == 4        
            if min_dist + 1 < distances(i-1,j)
               distances(i-1,j) = min_dist + 1;
               parent(i-1,j) = current;
            end
        elseif map(i-1,j) == 6
            parent(i-1,j) = current;
            distances(i-1,j) = min_dist + 1;
        end
    end
    
    if i == 1
        map(nrows,:) = 2*ones(1,181);
        if map(nrows-1,j) == 1
           map(nrows-1,j) = 4;
           parent(nrows-1,j) = current;
           distances(nrows-1,j) = min_dist + 1;
        elseif map(nrows-1,j) == 4        
            if min_dist + 1 < distances(nrows-1,j)
               distances(nrows-1,j) = min_dist + 1;
               parent(nrows-1,j) = current;
            end
        elseif map(nrows-1,j) == 6
            parent(nrows-1,j) = current;
            distances(nrows-1,j) = min_dist + 1;
        end
    end
    
        % *******************************************************************
end

if (isinf(distances(dest_node)))
    route = [];
else
    route = dest_node;
    
    while (parent(route(1)) ~= 0)
        route = [parent(route(1)), route];
    end
    
    route(end) = dest_node;
end

end