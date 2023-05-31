%funktion(and(true,neg(false)),_,L).
%funktion(neg(and(X,Y)),_,S).
funktion(neg(and(X,Y)),_,or(neg(X),neg(Y))).%de morgan


%logik(neg(X)) :- write('Ergebniss von neg: '),neg(X).
%logik(or(X,Y)) :- write('Ergebniss von or: '),or(X,Y).
%logik(and(X,Y)) :- write('Ergebniss von and: '),and(X,Y).


neg(S) :- S, !, false; true.
or(X,Y) :- X;Y.
and(X,Y) :- X,Y.
