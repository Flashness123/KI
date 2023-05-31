:- use_module(library(clpfd)).

% SEND
%+MORE
%----
%MONEY


send(Digits) :-
    Digits = [S,E,N,D,M,O,R,Y],
    Digits ins 0..9,
    S#\=0, M#\=0,
    all_different(Digits),
        1000*S+100*E+10*N+1*D
        +1000*M+100*O+10*R+1*E 
    #= 10000*M+1000*O+100*N+10*E+1*Y.

    %aufruf: send(Digits), label(Digits).    