%Drei Missionare und drei Kannibalen sollen einen Fluß überqueren. Dazu dient
%ihnen ein Ruderboot, das maximal zwei Personen fasst und das nicht selbständig
%fahren kann. Alle Personen befinden sich zu Beginn auf einer Seite des Flusses.
%Die Kannibalen dürfen gegenüber den Missionaren nie in der Überzahl sein.

:- ['KI_Ubung4_1.pl'].

% Aufgabe 17

% MA1 - Missionar am Ufer A vorher
% KB2 - Kannibale am Ufer B nachher

combination(M, K) :- member((M, K), [
(0, 2), (2, 0), (0, 1), (1, 0), (1, 1)
]).

% mögliche Verbesserung, statt 2-mal Berechnung zu definieren, 1-mal mit Faktor 1 oder -1
adj([MA1, KA1, MB1, KB1, Boot1], [MA2, KA2, MB2, KB2, Boot2]) :-
  combination(DM, DK),
  (
    (
      Boot1 == a, Boot2 = b,  % Boot ist am Ufer A
      MA2 is MA1 - DM, MB2 is MB1 + DM, KA2 is KA1 - DK, KB2 is KB1 + DK,
      (KA2 =< MA2; MA2 == 0), (KB2 =< MB2; MB2 == 0),(KA1 =< MA1; MA1 == 0), (KB1 =< MB1; MB1 == 0)
      %,
      %0 =< KA2, 0 =< KB2, 0 =< MA2, 0 =< MB2
    );
    (
      Boot1 == b, Boot2 = a,  % Boot ist am Ufer B
      MA2 is MA1 + DM, MB2 is MB1 - DM, KA2 is KA1 + DK, KB2 is KB1 - DK,
      (KA2 =< MA2; MA2 == 0), (KB2 =< MB2; MB2 == 0),(KA1 =< MA1; MA1 == 0), (KB1 =< MB1; MB1 == 0)
      %,
      %0 =< KB1, 0 =< KA1, 0 =< MB1, 0 =< MA1
    )
  ).



/** <examples>
?- iterative_dfs([3,3,0,0,a], [0,0,3,3,b], 0, 20, P).
*/