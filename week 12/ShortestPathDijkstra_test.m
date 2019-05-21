% 
% i = [1 1 3 4].';
% j = [2 3 4 5].';
% k = [1 2 3 4].';
% 
% route = ShortestPathDijkstra ([i j], k, 1, 5)

load 'g3.mat'
route = ShortestPathDijkstra (g3(:, 1: 2), g3(:, 3), 1, 500)