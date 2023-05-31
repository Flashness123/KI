taylor(F,X,R) :-
    differenziert(F,X,DF),
    differenziert(DF,X,DFF),
    ev(F,0,RF),
    ev(DF,0,RFF),
    ev(DFF,0,RFFF),