adj(X, Y, DistanceXY, HeuristikY) :-
    member((X, Y, DistanceXY, HeuristikY), [
        (a, b, 90, 8),
        (a, c, 110, 1),
        (c, z, 1, 0),
        (b, z, 10, 0)
    ]).
idas_search(Start, Goal, Limit, MaxLimit, Path, PathLength) 
    :-dfs(Start, Goal, Limit, [Start], 0, Path, PathLength);
    MaxLimit \== Limit,
    NewLimit is Limit + 1,
    idas_search(Start, Goal, NewLimit, MaxLimit, Path, PathLength).

dfs(Node, Goal, Limit, Visited, GLength, Path, PathLength) 
    :- Goal == Node,
    reverse(Visited, Path),
    PathLength = GLength;
    adj(Node, NewNeighbor, Distance, Heuristik),
    NewGLength is GLength + Distance,
    Bewertungsfkt is NewGLength + Heuristik,
    Limit >= Bewertungsfkt,
    not(member(NewNeighbor,Visited)),
    dfs(NewNeighbor,Goal,Limit, [NewNeighbor|Visited], NewGLength, Path, PathLength).

%-idas_search(a, z, 0, 200, P, L).