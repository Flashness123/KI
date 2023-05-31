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



%:- ['/home/notsus/Coding/KI/Ubung/KI_Ubung4_1.pl'].

%Ziege, Kohlkopf, Wolf
%Ziege+Kohlkopf oder Ziege+Wolf nur wenn Fahrmann da
%pro Fahrt nur ein Element + fahrmann
%Ziege, Kohlkopf, Wolf
%valid(Ziege,Kohl,Wolf,Fahr)
%    :-member((Ziege,Kohl,Wolf,Fahr),
%    [(ort(X),ort(X),ort(X),ort(X)),
%     (ort(X),ort(X),ort(X),ort(Y)),
%     (ort(Y),ort(Y),ort(X),ort(Y)),
%     (ort(Y),ort(X),ort(Y),ort(Y))]). %prettier

valid(Ziege,Kohl,Wolf,Fahr)
    :- Ziege == Fahr;Ziege\==Wolf,Ziege\==Kohl.%,Ziege\==Fahr.

ort(X) :- member(X,[klein, pill]).

adj([Ziege1,Kohl1,Wolf1,Fahr1],[Ziege1,Kohl1,Wolf1,Fahr2])
    :-ort(Fahr1), ort(Fahr2), 
    Fahr1 \== Fahr2,
    valid(Ziege1,Kohl1,Wolf1,Fahr2).

adj([Ziege1,Kohl1,Wolf1,Fahr1],[Ziege2,Kohl1,Wolf1,Fahr2])
    :-ort(Fahr1), ort(Fahr2),
    ort(Ziege1), ort(Ziege2),
    Fahr1 \== Fahr2,
    Ziege1 \== Ziege2,
    Fahr1 == Ziege1,
    valid(Ziege2,Kohl1,Wolf1,Fahr2).

adj([Ziege1,Kohl1,Wolf1,Fahr1],[Ziege1,Kohl2,Wolf1,Fahr2])
    :-ort(Fahr1), ort(Fahr2), 
    ort(Kohl1), ort(Kohl2),
    Fahr1 \== Fahr2,
    Kohl1 \== Kohl2,
    Fahr1 == Kohl1,
    valid(Ziege1,Kohl2,Wolf1,Fahr2).

adj([Ziege1,Kohl1,Wolf1,Fahr1],[Ziege1,Kohl1,Wolf2,Fahr2])
    :-ort(Fahr1), ort(Fahr2), 
    ort(Wolf1), ort(Wolf2),
    Fahr1 \== Fahr2,
    Wolf1 \== Wolf2,
    Fahr1 == Wolf1,
    valid(Ziege1,Kohl1,Wolf2,Fahr2).

%aufrufen: idfs([klein,klein,klein,klein],[pill,pill,pill,pill],0,P).