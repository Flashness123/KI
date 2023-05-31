%IDA* Suche
%f(v) = g(v) + h(v)

%adj(X, Y, DistanceXY, HeuristikY) :-member((X, Y, DistanceXY, HeuristikY), [(a, b, 90, 8),(a, c, 110, 1),(c, z, 1, 0),(b, z, 10, 0)]).
% CTRL + /

hs([H|T], Closed) :-
    goal(H);
    Cl = [H|Closed],
    findall(Node, (adj(H, Node), not(member(Node, Cl))), NewNeighbors),
    append(T, NewNeighbors, Queue),
    fsort(Queue, SortedQ),
    hs(SortedQ, Cl).

fsort(List, Sorted) :-
    map_list_to_pairs(f, List, Pairs),
    keysort(Pairs, SortedPairs),
    pairs_values(SortedPairs, Sorted).

f([H|T],Y) :- g([H|T],Y1), h(H,Y2), Y is Y1+Y2.
    g(L,Y) :- length(L,Y0), Y is Y0-1.
    h(X,Y) :- Y is 0.