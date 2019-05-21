x = [0,2,0];
y = [0,0,2];
P1 = [x;y]';

x = [0,-2,0];
y = [0,0,2];
P2 = [x;y]';

flag = triangle_intersection4(P1, P2)