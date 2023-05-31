% definiere Nachbarn bzw. Adjazenzen
adj(X,Y) :- adj0(X,Y); adj0(Y,X).
adj0(X,Y) :- member((X,Y), [(1,2), (2,4), (2,5), (3,4), (3,6), (4,5)]).


dfs(Node) :-
    goal(Node);
    adj(Node, Neighbor),
    dfs(Neighbor).

%dfs(Node, Path) :-
%    % wenn gesuchter Knoten gefunden
%    goal(Node);
%    adj(Node, NewNeighbor), 
%    not(member(NewNeighbor,Path)),
%    dfs(NewNeighbor, [NewNeighbor|Path]).

% setze gesuchten Knoten
goal(4).



% depth(Depth) :- (Depth is )

% iteraitve_dfs(Node, Path, Depth) :-
%     % wenn gesuchter Knoten gefunden
%     goal(Node);
%     adj(Node, NewNeighbor), not(member(NewNeighbor,Path)),
%     iteraitve_dfs(NewNeighbor, [NewNeighbor|Path], Depth),
%     depth(Depth - 1).


