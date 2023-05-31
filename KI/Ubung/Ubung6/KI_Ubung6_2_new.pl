:- use_module(library(clpfd)).
make_tuple(A,B,(A,B)).

color(0,red).
color(1,blue).
color(2,green).
color(3,yellow).

color_map(StateColors) :-
    Colors = [BW, BY, BE, BB, HB, HH, HE, MV, NI, NW, RP, SL, SN, ST, SH, TH],
    Colors ins 0 .. 3,

    BY #\= BW, BY #\= HE, BY #\= SN, BY #\= TH,
    BE #\= BB,
    BB #\= MV, BB #\= SN, BB #\= ST,
    HB #\= NI,
    HH #\= NI, HH #\= SH,
    HE #\= BW, HE #\= NW, HE #\= RP, HE #\= TH,
    NI #\= BB, NI #\= HE, NI #\= MV, NI #\= ST, NI #\= SH, NI #\= TH,
    NW #\= NI,
    RP #\= BW, RP #\= NW, RP #\= SL,
    SN #\= TH,
    ST #\= SN, ST #\= TH,
    SH #\= MV,

    label(Colors),
    maplist(color,Colors,ReadableColors),
    States = ['BW', 'BY', 'BE', 'BB', 'HB', 'HH', 'HE', 'MV', 'NI', 'NW', 'RP', 'SL', 'SN', 'ST', 'SH', 'TH'],
    make_tuple(States,ReadableColors,StateColors).