diff(X,X,1).                        %diff(eingefuhrte Funktion,wonach wird abgeleitet, Ergebniss).
diff(C,X,0):-atomic(C), C \== X.    %atomic(X) is true if and only if X is either an atom, an integer or a float.   Atom = string that starts with a lower case letter
diff(-F,X,-DF):-diff(F,X,DF).       %wenn F nach DF vorhanden, dann auch als negativ vorhanden
diff(C*F,X,C*DF):-diff(C,X,0), diff(F,X,DF).
diff(F+G,X,DF+DG):-diff(F,X,DF),diff(G,X,DG).
diff(F-G,X,DF-DG):-diff(F,X,DF),diff(G,X,DG).
diff(X^N,X,N*X^M):-atomic(X), number(N), M is N-1. %number: True if Term is bound to a rational number (including integers) or a floating point number.
diff(C*(F),X,C*DF):-diff(C,X,0), diff(F,X,DF).
%--------
diff(sin(X),X,cos(X)).
            %diff(sin(C*X),X,DF*cos(C*X)):-diff(C*X,X,DF).
diff(sin(F),X,DF*cos(F)):-diff(F,X,DF).
diff(cos(F),X,-DF*sin(F)):-diff(F,X,DF).

rew(0+A, A).
rew(A+0, A).
rew(1 * A, A).
rew(A * 1, A).
rew(0 * _, 0).
rew(_ * 0, 0).
rew(A + B, C) :- number(A), number(B), C is A + B.
rew(A - B, C) :- number(A), number(B), C is A - B.
rew(A * B, C) :- number(A), number(B), C is A * B.
rew(A, A).
%--------
rew(A * B * sin(C), D*sin(C)) :- number(A), number(B), D is A * B.

simp(A + B, C) :- simp(A, SA), simp(B, SB), rew(SA + SB, C).
simp(A * B, C) :- simp(A, SA), simp(B, SB), rew(SA * SB, C).
simp(A * B * sin(C), D*sin(C)) :- simp(A, SA), simp(B, SB), rew(SA * SB, C).
simp(A, B) :- rew(A, B).
simp(A, A).

%Produkte, die Funktionen Sinus und Cosinus und Verkettungen von Funktionen differenziert und vereinfacht werden.