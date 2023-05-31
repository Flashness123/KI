%Vater %Kind
vater(wilhelm,robert).
vater(kurt,sandra).
vater(winfried,thomas).
vater(hans,christine).
vater(thomas,eva).
vater(robert,jan).
vater(robert,jens).
vater(robert,julia).
vater(robert,jutta).
vater(jan,anne).
vater(jan,anke).
vater(jens,tim).

%Mutter %Kind
mutter(frieda,robert).
mutter(lisa,sandra).
mutter(elke,thomas).
mutter(paula,christine).
mutter(christine,eva).
mutter(sandra,jan).
mutter(sandra,jens).
mutter(sandra,julia).
mutter(sandra,jutta).
mutter(eva,anne).
mutter(eva,anke).
mutter(heike,tim).

mann(X):-vater(X,_).
mann(tim).
frau(A):-mutter(A,_).
frau(anne).
frau(anke).

%A_Bruder_von_B
/*
bruder(A,B):-vater(X,A),vater(X,B),A\==B,mann(A).
bruder(A,B):-mutter(X,A),mutter(X,B),A\==B,mann(A).
*/
bruder(A,B):-vater(X,A),vater(X,B),mutter(Y,A),mutter(Y,B),A\==B,mann(A).

schwester(A,B):-vater(X,A),vater(X,B),A\==B,frau(A).
schwester(A,B):-mutter(X,A),mutter(X,B),A\==B,frau(A).

%A_Enkel_von_B
enkel(A,B):-mann(A),A\==B,vater(B,C),vater(C,A).
enkel(A,B):-mann(A),A\==B,vater(B,C),mutter(C,A).
enkel(A,B):-mann(A),A\==B,mutter(B,C),mutter(C,A).
enkel(A,B):-mann(A),A\==B,mutter(B,C),vater(C,A).

%A_Onkel_von_B
onkel(A,B):-bruder(A,C);schwester(A,C),vater(C,B);mutter(C,B).

%V ist der vorfahr von P
vorfahr(P,V):-vater(V,P),P\==V.
vorfahr(P,V):-mutter(V,P),P\==V.
vorfahr(P,V):-vater(V,C),vorfahr(P,C),P\==V.    %V ist vorfahr, falls V Vater ist und dieser irgendjemand wird auch noch untersucht
vorfahr(P,V):-mutter(V,C),vorfahr(P,C),P\==V.   %aber warum?