Option A)
In der adjazenz liste werden verbundene Knoten angzeigt, zusatzlich noch die Distanz und die Geschwindigkeit
da die Suche nur die schnellste Strecke finden soll, errechnen wir
die benotigte Zeit zwischen den jeweiligen Knoten uber die Vorschrift Lange mal Geschwindigkeit.
Die verbundenen Knoten haben die Geschwindigkeit oder Lange dann als Heuristik  

adj(X, Y, DistanceXY, HeuristikY) :-
    member((X, Y, DistanceXY, HeuristikY), [
        (a, b, 90, 80),
        (a, c, 110, 10),
        (c, z, 1, 5),
        (b, z, 10, 5)
    ]).