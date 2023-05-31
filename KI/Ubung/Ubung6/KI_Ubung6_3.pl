:- use_module(library(clpfd)).
%Speisen:
vorspeise(brot, 300).
vorspeise(caprese, 150).
vorspeise(antipasti, 200).
vorspeise(avocade, 250).

hauptspeise(lachs, 400).
hauptspeise(spaghetti, 600).
hauptspeise(gemuse, 300).
hauptspeise(lasagne, 800).

nachspeise(schoko, 400).
nachspeise(vanille, 500).
nachspeise(erdbeer, 600).
nachspeise(banane, 700).

menu(Cmax, Speisen):-
    combination(X,Y,Z, Cmax).

combination(X,Y,Z,Cmax) 
                    :-vorspeise(X,A),
                      hauptspeise(Y,B),
                      nachspeise(Z,C),
                      A+B+C #=<Cmax,
                      write(X),
                      write(Y),
                      write(Z).