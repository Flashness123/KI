%Kind Vater Mutter

familie(robert,wilhelm,frieda).
familie(sandra,kurt,lisa).
familie(thomas,winfried,elke).
familie(christine,hans,paula).
familie(eva, thomas, christine).
familie(jan,robert,sandra).
familie(jens,robert,sandra).
familie(julia,robert,sandra).
familie(jutta,robert,sandra).
familie(anne,jan,eva).
familie(anke,jan,eva).
familie(tim,jens,heike).

%frau(X) :- X is julia;X is jutta;X is anne;X is anke. Kann man das besser zusammenfassen?

frau(X) :- familie(_,_,X).
frau(julia).
frau(jutta).
frau(anne).
frau(anke).

mann(X) :- familie(_,X,_).
mann(tim).

%X ist erlternteil von Y
eltern(X,Y) :- familie(Y,X,_); familie(Y,_,X).


%X ist der bruder von Y
%bruder(X,Y) :- familie(X,_,M), familie(X,V,_), familie(Y,_,M), familie(Y,V,_), X \== Y.              %Vater und Mutter gleich, keine Halbgeschwister
geschwister(X,Y) :- familie(X,V,M), familie(Y,V,M), X \== Y.
bruder(X,Y) :- geschwister(X,Y),mann(X).
schwester(X,Y) :- geschwister(X,Y),frau(X).
%X ist der enkel von Y
%enkel(X,Y) :- familie(X,A,_), familie(A,Y,_);familie(A,_,Y);familie(X,B,_),familie(B,_,Y),familie(B,Y,_).
enkel(X,Y) :- eltern(V,X),eltern(Y,V).
%X ist der Onkel von Y
onkel(X,Y) :-eltern(E,Y),bruder(X,E).
tante(X,Y) :-eltern(E,Y),schwester(X,E).
%V ist der Vorfahr von P
vorfahr(P,V) :- eltern(V,P).
vorfahr(P,V) :- eltern(V,M),vorfahr(P,M).%falls V erlternteil von M, dann auch M vorfahr von P