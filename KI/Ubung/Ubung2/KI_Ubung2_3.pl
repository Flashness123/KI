ev(x,Y,Y):-number(Y). %wenn du in das erste das zweite einsetzt, kommt das dritte heraus
ev(C,_,C):-number(C).
ev(x^C,X,L) :- number(X),number(C), L is X^C.
ev(C*F,X,L) :- number(X),number(C), ev(F,X,R), L is C*R.    %kleines x ist wo ich einsetze und grosses ist ein konkreter variablenwert den ich einsetze
ev(F1+F2, X, L) :- number(X), ev(F1,X,R), ev(F2,X,P), L is R+P.
ev(F1-F2, X, L) :- number(X), ev(F1,X,R), ev(F2,X,P), L is R-P.



%diff(X^N,X,N*X^M).
%diff(C*F,X,C*DF):-diff(C,X,0), diff(F,X,DF).