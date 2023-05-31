:- use_module(library(clpfd)).

% gewicht1(12).
% gewicht2(30).
% gewicht3(40).



balance(Position):-
    Balken is 20, 
    Seite is Balken/2,
    NegSeite is -Seite,
    Gewicht1 is 12,
    Gewicht2 is 30,
    Gewicht3 is 40,
    Position = [[Gewicht1,L1], [Gewicht2, L2], [Gewicht3, L3]],
    all_distinct([L1,L2,L3]),
    [L1, L2, L3] ins NegSeite .. -1 \/ 1 .. Seite, %left \/ right % left or right side holds
    0#=Gewicht1*L1+Gewicht2*L2+Gewicht3*L3.
    