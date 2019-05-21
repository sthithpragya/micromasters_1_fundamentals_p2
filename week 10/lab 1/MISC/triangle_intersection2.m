function flag = triangle_intersection2(P1, P2)
% triangle_test : returns true if the triangles overlap and false otherwise

%%% All of your code should be between the two lines of stars.
% *******************************************************************
X = P1(:,1).';
Y = P2(:,2).';
x = P2(:,1).';
y = P2(:,2).';

x1 = X(1);
x2 = X(2);
x3 = X(3);

y1 = Y(1);
y2 = Y(2);
y3 = Y(3);

AP1 =  (x1*(y2-y3) + x2*(y3-y1) + x3*(y1-y2))/2;

a = 0;
b = zeros(1,3);
for i = 1:3
    a1 = (x(i)*(y2-y3) + x2*(y3-y(i)) + x3*(y(i)-y2))/2;
    a2 = (x1*(y(i)-y3) + x(i)*(y3-y1) + x3*(y1-y(i)))/2;
    a3 = (x1*(y2-y(i)) + x2*(y(i)-y1) + x(i)*(y1-y2))/2;
    if a1+a2+a3 == AP1;
        if a1 == 0 || a2 == 0 || a3 == 0
            b(i) = 1;
        end
    else
        a = 1;
        break
    end
end

if a == 1
    flag = true;
else
    if b == ones(1,3)
        flag = true;
    end
end
% *******************************************************************
end
