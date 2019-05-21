function flag = triangle_intersection3(P1, P2)
% triangle_test : returns true if the triangles overlap and false otherwise

%%% All of your code should be between the two lines of stars.
% *******************************************************************
    a = 0;
    X1 = P1(:,1);
    X2 = P2(:,1);
    Y1 = P2(:,2);
    Y2 = P2(:,2);
    v = zeros(3,2);
    for i1 = 1:3
        for i2 = 1:3
            if X1(i1) == X2(i2)
                v(i1,1) = 1;
            end
            if Y1(i1) == Y2(i2)
                v(i1,2) = 1;
            end
        end    
    end
    if v == ones(3,2)
        a = 1;
    else
        for i = 1:2
            if i == 1
                Act = P1;
                Pas = P2;
            else
                Pas = P1;
                Act = P2;
            end
            for j = 1:3
                b = Act;
                v = b(j,:); 
                b(j,:) = [];
                check = zeros(4,1);
                for k = 1:3
                    X = Pas(k,1);
                    Y = Pas(k,2);
                    x1 = b(1,1);
                    x2 = b(2,1);
                    y1 = b(1,2);
                    y2 = b(2,2);
                    c = (Y - y1)*(x2 - x1) - (X - x1)*(y2 - y1);
                    if c == 0
                        check(k) = 0;
                    elseif c > 0
                        check(k) = 1;
                    else
                        check(k) = -1;
                    end 
                end
                c4 = (v(2) - y1)*(x2 - x1) - (v(1) - x1)*(y2 - y1);
                if c4 >= 0
                    check(4) = 1;
                else
                    check(4) = -1;
                end
                if check(1) == 0 && check(2) == 0 && check(3) == 0
                    a = 1;
                    break
                elseif check(1) == 0 && check(2) == 0 && check(3) ~= 0
                    if check(3) == check(4)
                        a = 1;
                        break
                    end
                    
                elseif check(2) == 0 && check(3) == 0 && check(1) ~= 0
                    if check(1) == check(4)
                        a = 1;
                        break
                    end    
              
                elseif check(1) == 0 && check(3) == 0 && check(2) ~= 0
                    if check(2) == check(4)
                        a = 1;
                        break
                    end    
                    
                elseif check(1)*check(2) > 0 && check(2)*check(3) > 0 && check(3)*check(1) >0
        
                else
                    a = 1;
                    break
                end
            end
        end
    end
    if a == 0
        flag = false;
    else
        flag = true;
    end
        % *******************************************************************
end