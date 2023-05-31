%Programm, welches 2 Taylor Polynom an Stelle 0 berechnet und vereinfacht.
%Soll für alle Fkt. von Aufg. 3 berechnet werden können.

%Grundregeln
%dx von Gleichem
diff(X,X,1).
%dx von Konstante
diff(C,X,0) :- atomic(C) , C \== X.
%dx von negativen Wert/Variable
diff(-F,X,-DF) :- diff(F,X,DF).
%dx von Konstante*Variable
diff(C*F,X,C*DF) :- diff(C,X,0) , diff(F,X,DF).
%dx von K/V + K/V
diff(F+G,X,DF+DG) :- diff(F,X,DF) , diff(G,X,DG).
%dx von K/V - K/V
diff(F-G,X,DF-DG) :- diff(F,X,DF) , diff(G,X,DG).
%d von Exponent
diff(X^N,X,N*X^M) :- atomic(X) , number(N) , M is N-1.
%Kettenregel((x+2)^2)
diff(F^N,X,DF*N*F^M) :- number(N),diff(F,X,DF), M is N-1.
%Produktregel
diff(F*G,X,DF*G+DG*F) :- diff(F,X,DF),diff(G,X,DG).
%Sinus/Cosinus plus Verkettung
diff(sin(F),X,DF*cos(F)) :- diff(F,X,DF).
diff(cos(F),X,-DF*sin(F)) :- diff(F,X,DF).
%diff(-sin(F),X,-DF*cos(F)) :- diff(F,X,DF).
%diff(-cos(F),X,DF*sin(F)):- diff(F,X,DF).

%Berechnen
rew(x,X,X).
rew(A+B,_,C) :- number(A), number(B), C is A+B.
rew(A-B,_,C) :- number(A), number(B), C is A-B.
rew(A*B,_,C) :- number(A), number(B), C is A*B.
rew(A^B,_,C) :- number(A), number(B), C is A^B.
rew(sin(A),_,C) :- number(A), C is sin(A).
rew(cos(A),_,C) :- number(A), C is cos(A).
rew(0+A,_,A).
rew(A+0,_,A).
rew(0-A,_,-A).
rew(A-0,_,A).
rew(1*A,_,A).
rew(A*1,_,A).
rew(0*_,_,0).
rew(_*0,_,0).
rew(A^1,_,A).
rew(0.0+A,_,A).
rew(A+0.0,_,A).
rew(0.0-A,_,-A).
rew(A-0.0,_,A).
rew(1.0*A,_,A).
rew(A*1.0,_,A).
rew(0.0*_,_,0).
rew(_*0.0,_,0).
rew(A^1.0,_,A).
rew(A,_,A).

%Simplify
simp(A+B,X, C) :- simp(A,X,SA), simp(B,X,SB), rew(SA+SB,X, C).
simp(A-B,X, C) :- simp(A,X,SA), simp(B,X,SB), rew(SA-SB,X, C).
simp(A*B,X, C) :- simp(A,X,SA), simp(B,X,SB), rew(SA*SB,X, C).
simp(A^B,X, C) :- simp(A,X,SA), simp(B,X,SB), rew(SA^SB,X, C).
simp(sin(A),X, C) :- simp(A,X,SA), rew(sin(SA),X, C).
simp(cos(A),X, C) :- simp(A,X,SA), rew(cos(SA),X, C).
%simp(-A,X,C):- rew(A,X,B), C is -B.
simp(A,X,B) :- rew(A,X,B).
simp(A,_,A).

%Vereinfachung
evaldiff(F,X,SF) :- diff(F,X,DF),simp(DF,X,SF).

%2 Taylorpolynon an Stelle 0
%sin(x) ... sin(0)+cos(0)*x-sin(0)/2*x^2  = x
%x^2+2*x... 0^2+2*0 + (2*0+2)*x + 2/2*x^2 = 2x+x^2
t2(F,X,FL) :- t1(F,X,F1),evaldiff(F,X,D1),evaldiff(D1,X,D2),simp(D2*0.5,0,DL),simp(F1+DL*x^2,X,FL).
t1(F,X,FL) :- t0(F,F0),evaldiff(F,X,DF),simp(DF,0,DL),simp(F0+DL*x,X,FL).
%ta(F,X,DL) :- evaldiff(F,X,DF),simp(DF*x,X,DL). %(DF/1)*x
t0(F,FL) :- simp(F,0,FL).

%taylor(F,X,FL):-
%    diff(),
%    diff(),
    