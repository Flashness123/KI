%:- consult('KI_Ubung4_1.pl').
:- ['KI_Ubung4_1.pl'].


adj(X,Y) :- adj0(X,Y);adj0(Y,X).
adj0(X,Y) :- member((X, Y),[(0,1),(1,2),(2,3),(1,6),(6,7),(6,11),
(11,10),(10,5),(10,15),(15,20),(15,16),(16,21),(21,22),(22,23),(23,24),
(24,19),(19,14),(19,18),(18,13),(22,17),(17,12),(12,13),(13,8),(8,9),(9,4)]).

%set_prolog_flag(answer_write_options,[quoted(true),portray(true),spacing(next_argument)]). For showing the whole prolog answer
											% or just simply press w dumbass
