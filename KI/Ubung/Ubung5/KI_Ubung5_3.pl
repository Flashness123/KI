:- use_module(library(clpfd)).
%shift row
sr([0,A,B],[A,0,B]).
sr([A,0,B],[A,B,0]).
shiftr(X,Y):-sr(X,Y);sr(Y,X).

adjr([X,R2,R3],[Y,R2,R3]):-shiftr(X,Y).
adjr([R1,X,R3],[R1,Y,R3]):-shiftr(X,Y).
adjr([R1,R2,X],[R1,R2,Y]):-shiftr(X,Y).
%shift column

adjc(X,Y) :- 
    transpose(X, XT),
    adjr(XT,YT),
    transpose(YT,Y).

%shift 0 in any direction

adj(Board1,Board2) :- adjr(Board1,Board2);adjc(Board1,Board2).

goal([[1,2,3],[4,5,6],[7,8,0]]).

h(Board, HD) :-
    flatten(Board, B),
    % goal(GoalB),
     flatten(GoalB,G),
    % write('GoalB: '),
    % write(GoalB),
    
    maplist(h0, B, G, Diffs),
    sumlist(Diffs, HD), !.

h0(B,B,0).
h0(_,0,1).%weshalb
ho(_,_,1).

printB(Board) :- maplist(writeln, Board), writeln('').
printBoards(Boards) :- maplist(printB, Boards).

solve_puzzle(Start, MaxLimit, PathLength) :-
    idas_search(Start, 0, MaxLimit, Path, PathLength),
    printBoards(Path).

idas_search(Start, Limit, MaxLimit, Path, PathLength) 
    :-dfs(Start, Limit, [Start], 0, Path, PathLength);
    MaxLimit \== Limit,
    NewLimit is Limit + 1,
    idas_search(Start, NewLimit, MaxLimit, Path, PathLength).

dfs(Node, Limit, Visited, GLength, Path, PathLength) 
    :- goal(Node),
    reverse(Visited, Path),
    PathLength = GLength;
    adj(Node, NewNeighbor),
    NewGLength is GLength + 1,
    h(NewNeighbor, Heuristik),
    Bewertungsfkt is NewGLength + Heuristik,
    Limit >= Bewertungsfkt,
    not(member(NewNeighbor,Visited)),
    dfs(NewNeighbor,Limit, [NewNeighbor|Visited], NewGLength, Path, PathLength).

%-idas_search(a, z, 0, 200, P, L).
%solve_puzzle([[1,0,3],[4,2,8],[7,5,6]],900000,P).