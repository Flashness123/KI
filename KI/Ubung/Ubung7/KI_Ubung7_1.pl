ort(X) :- member(X,[raum1, raum2]).
time(X) :- member(X,[8,10,12,14,16]).

vorlesung(time(),ort()).
