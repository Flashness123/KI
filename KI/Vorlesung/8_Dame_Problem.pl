%N-Dame-Problem Vereinfacht
:- use_module(library(clpfd)).
%[Z1,Z2, ... Zn]

queens(N, Qs) :- %bekommt die anzahl der Zeilen im quadratischen Brett und Liefert Damenposition
    length(Qs,N),
    Qs ins 1..N,
    safe(Qs).

safe([]).
safe([Q0|Qs]):- safeq(Q0,Qs, 1), safe(Qs).
safeq(_,[],_).
safeq(Q0,[Q|Qs],D0):-
    Q0 #\= Q,       %Zeilen durfen nicht gleich sein
    abs(Q0-Q) #\= D0,%Diagonalen werden uberpruft
    D1 is D0 + 1,
    safeq(Q0,Qs,D1).