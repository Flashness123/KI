% Aufgabe 26

:- use_module(library(clpfd)).

prof(0, 'Hollas').
prof(1, 'Beck').
prof(2, 'Baumgartl').
prof(3, 'Schwarzenberger').
prof(4, 'Schönthier').
prof(5, 'Anke').

lecture(0, 'KI', 0, 2021).
lecture(1, 'GDI', 0, 2022).
lecture(2, 'Prog I', 1, 2022).
lecture(3, 'Prog II', 1, 2021).
lecture(4, 'BS I', 2, 2022).
lecture(5, 'BS II', 2, 2021).
lecture(6, 'Mathe I', 3, 2022).
lecture(7, 'Stochastik', 3, 2021).
lecture(8, 'RA', 4, 2021).
lecture(9, 'SE I', 5, 2022).

time_slot([X, Y]) :-
  lecture(X, _, XProf, XJahr),
  lecture(Y, _, YProf, YJahr),
  XProf #\= YProf,
  XJahr #\= YJahr.

length1(Length, List) :- length(List, Length).

translate_lecture(Lecture, [Desc,Prof]) :-  % Übersetze Indizes zu Lehrveranstaltungen
  lecture(Lecture, Desc, ProfX, _),
  prof(ProfX, Prof).  

schedule(ScheduleT) :-
  length(Schedule, 5),  % 5 Zeitslots
  maplist(length1(2), Schedule),  % 2 Räume
  flatten(Schedule, ScheduleF),
  ScheduleF ins 0..9,
  all_distinct(ScheduleF),
  maplist(time_slot, Schedule), % Indizes der lehrveranstaltungen den Räumen zuweisen
   
  maplist(maplist(translate_lecture), Schedule, ScheduleT). % Übersetze Indizes zu Lehrveranstaltungsnamen