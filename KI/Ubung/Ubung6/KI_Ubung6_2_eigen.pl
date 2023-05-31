:- use_module(library(clpfd)).
%make_tuple(A,B,(A - B)).
write(A,B,(A , B)).
%write().
color(0,red).
color(1,blue).
color(2,green).
color(3,yellow).

colorize(ColorizedStates):-
States = ['BW', 'BY', 'BE', 'BB', 'HB', 'HH', 'HE', 'MV', 'NI', 'NW', 'RP', 'SL', 'SN', 'ST', 'SH', 'TH'],
Colors = [BW, BY, BE, BB, HB, HH, HE, MV, NI, NW, RP, SL, SN, ST, SH, TH],
%Colors ins 0..3, %warum?
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
%label(Colors), %wozu?
%Colors ins 0..3, %warum muss das oben hin?
maplist(color,Colors,ColorValue),
%make_tuple(States,ColorValue,ColorizedStates).
maplist(write,States,ColorValue,ColorizedStates).
%append(States,ColorValue,ColorizedStates).
%indomain(Colors).

%maplist(ColorValue, States,ColorizedStates).
%trace, (trace(colorize(ColorizedStates))).

