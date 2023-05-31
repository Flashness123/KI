%consult(a3) %a3 zum einbinden von a3
:- op(1100, yfx, or).
:- op(400, yfx, and).
:- op(200, fx, not).

form2(X,Y,XL,YL) :- form(X,XL),form(Y,YL).
form(X,X) :- atomic(X).
form(not X,not X):-atomic(X).%atom is string, atomic is string and number

form(not (not X),XL) :- form(X,XL).
form(X and Y, XL and YL) :- form2(X,Y,XL,YL).
form(X or Y,XL or YL):-form2(X,Y,XL,YL).

form(not (X and Y), XL or YL) :- form2(not X, not Y, XL,YL).
form(not(X or Y),XL and YL) :- form2(not X, not Y,XL,YL).