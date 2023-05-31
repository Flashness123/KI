adj(X,Y) :- adj0(X,Y);adj0(Y,X).
adj0(X,Y) :- member((X, Y),[(0,1),(1,2),(2,3),(1,6),(6,7),(6,11),(11,10),(10,5),(10,15),(15,20),(15,16),(16,21),(21,22),(22,23),(23,24),(24,19),(19,14),(19,18),(18,13),(22,17),(17,12),(12,13),(13,8),(8,9),(9,4)]).


%goal(4).
%dfs(Node) :-
%    goal(Node);
%    adj(Node, Neighbor),
%    dfs(Neighbor).
%dfs(Node, Path) :-  goal(Node); %deklariert was unser Ziel ist und 
%                    adj(Node, NewNeighbor),  %gibt alle Nachbran unserer Node aus                  
%                    not(member(NewNeighbor, Path)), %Path ist eine Liste und member guckt, ob New Neighbor schon in Path ist, falls nicht
%                    dfs(NewNeighbor, [NewNeighbor|Path]). %wir straten noch eine Tiefensuche aus NewNeighbor aus und fugen NewNeighbor in die Liste path ein

%adj(X,Y) :- member((X,Y), [(0,1), (0,2), (0,10), (1,3), (1,4), (2,5), (2,6), 
%                          (3,7), (3,8), (4,9) , (4,10), (5,11),(5,12),(6,13),
%                          (6,14)]).
idfs(StartNode, Goal, Limit, Path) 
        :- dfs(StartNode,Goal, Limit, [StartNode], Path);
        NewLimit is Limit + 1,
        idfs(StartNode, Goal, NewLimit, Path).

dfs(Node, Goal, DepthRemaining, Visited, Path)
        :- Goal == Node,
        reverse(Visited, Path);
        DepthRemaining \==0, NewDepthRemaining is DepthRemaining - 1,
        adj(Node, NewNeighbor),
        not(member(NewNeighbor,Visited)),
        dfs(NewNeighbor,Goal,NewDepthRemaining,[NewNeighbor|Visited],Path).
