:- use_module(library(clpfd)).

sr([9,A,B],[A,9,B]).
sr([A,9,B],[A,B,9]).

shiftr(X,Y) :- sr(X,Y);sr(Y,X).

adjr([ReiheAlt,R2,R3],[ReiheNeu,R2,R3]) :- shiftr(ReiheAlt,ReiheNeu).
adjr([R1,ReiheAlt,R3],[R1,ReiheNeu,R3]) :- shiftr(ReiheAlt,ReiheNeu).
adjr([R1,R2,ReiheAlt],[R1,R2,ReiheNeu]) :- shiftr(ReiheAlt,ReiheNeu).

adjv(Board1,Board2) :- transpose(Board1,TBoard1),adjr(TBoard1,TBoard2),transpose(TBoard2,Board2).

adj(Board1,Board2) :- adjr(Board1,Board2);adjv(Board1,Board2).

goal([[1,2,3],[4,5,6],[7,8,9]]).

% Heuristik
h(Board, HD) :-
  flatten(Board, B),
  goal(GoalB), flatten(GoalB,G),
  maplist(h9, B, G, Diffs), %warum?
  sumlist(Diffs, HD), !.
  % Cut-Symbol: verhindert Backtracking für Ergebnisse in h9, angestoßen durch IDA*


% h9(B, G, Diff) sind Elemente der Listen aus maplist()

h9(9, _, 0). %Note that we do not consider the empty space, as this would cause the Manhattan distance heuristic to not be an underestimate.

% Leeres Plättchen wird automatisch an die richtige Stelle "platziert" durch Verschieben der anderen
% mod: horizontaler Abstand
% div: vertikaler Abstand
h9(B, G, Diff) :-
    % Zeilen
    write('B:'),    
    write(B),
    write(' '),
    write('G:'),
    write(G),
    write(' '),
    
    X1 is ((B-1) mod 3),
    X2 is ((G-1) mod 3),
    % Spalten
    Y1 is ((B-1) div 3),
    Y2 is ((G-1) div 3),
   
    Diff is abs(X1 - X2) + abs(Y1 - Y2)
    ,    write('DIffs:'),    
    write(Diff),
    write(' ').

printBoard(Board) :- maplist(writeln,Board),writeln('').
printBoards(Boards) :- maplist(printBoard,Boards).

solve(StartBoard,Length) :- idas(StartBoard,1,GoalPath,Length),printBoards(GoalPath).

idas(StartNode, Limit,GoalPath,Length):-(dfs(StartNode, Limit,[StartNode],0,GoalPath,Length));
    											   (NewLimit is Limit + 1,
                                                    idas(StartNode, NewLimit,GoalPath,Length)).

% Man zusammenfassen g(v) und h(v) gemeinsam

dfs(StartNode, Limit,Pathing,TLength,GoalPath,Length)
    :-(goal(StartNode), reverse(Pathing,GoalPath),Length = TLength);
    (
    adj(StartNode,NewNeighbor),
    h(NewNeighbor,Heuristik),
    NewTLength is TLength +1,
    
    Bewertung is NewTLength + Heuristik,
    Limit >= Bewertung,
    not(member(NewNeighbor,Pathing)),

    
    dfs(NewNeighbor, Limit,[NewNeighbor|Pathing],NewTLength,GoalPath,Length)).

/*?- solve([[1,2,3],[4,5,6],[7,8,9]],X).*/