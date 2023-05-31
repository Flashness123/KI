%Bundeslander Miteinander Benachbart als adj
%:- ['/home/notsus/Coding/KI/Ubung/Ubung4/KI_Ubung4_1.pl'].
%:- use_module(library(clpfd)).

% Baden-Württemberg         Bw
% Bayern                    Ba
% Berlin                    Be
% Brandenburg               Bra
% Bremen                    Bre
% Hamburg                   Ha
% Hessen                    He
% Mecklenburg-Vorpommern    Me
% Niedersachsen             Ni
% Nordrhein-Westfalen       No
% Rheinland-Pfalz           Rh
% Saarland                  Saa
% Sachsen                   Sa
% Sachsen-Anhalt            Sach
% Schleswig-Holstein        Schle
% Thüringen                 Th

Schle #\= Ha,Schle#\=Me,Schle#\=Ni.
Me #\= Bra,Me#\=Ni.
Ha #\= Ni.
Bre #\= Ni.
Ni #\= Bra,Ni#\=Sach,Ni#\=Th,Ni#\=He,Ni#\=No.
Bra #\= Be,Bra#\=Sach,Bra#\=Sa.
Sach #\= Th,Sach#\=Sa.
No #\= He,No#\=Rh.
He #\= Th,He#\=Ba,He#\=Bw,He#\=Rh.
Th #\= Sa,Th#\=Ba.
Sa #\= Ba.
Rh #\= Saa,Rh#\= Bw.
Ba #\= Bw.

color_map(List,Solution) :- remaining(Country,List),
                            color(Hue),
                            \+ prohibited(Country,Hue,List),
                            write(Country),
                            nl,
                            color_map([[Country,Hue]|List],Solution).
color_map(Solution,Solution).