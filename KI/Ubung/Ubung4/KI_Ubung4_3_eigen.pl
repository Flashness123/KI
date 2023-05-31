:- ['KI_Ubung4_1.pl'].
%Kanibalen/Missionar
validCombinationOnBoot(M,K) :- member((M,K),
[(0,2),(2,0),(1,0),(0,1),(1,1)]).

adj([MA1,KA1,MB1,KB1,Boot1],[MA2,KA2,MB2,KB2,Boot2]) %A/B gibt an, an welchem Ufer man sich befindet 
                                                     %1/2 gibt zustandsubergang an, damit 
:-  validCombinationOnBoot(FM,FK), (bootAtoB(MA1,KA1,MB1,KB1,Boot1,MA2,KA2,MB2,KB2,Boot2, FM,FK);  bootBtoA(MA1,KA1,MB1,KB1,Boot1,MA2,KA2,MB2,KB2,Boot2, FM,FK)).

bootAtoB(MA1,KA1,MB1,KB1,Boot1,MA2,KA2,MB2,KB2,Boot2, FM,FK) :-
    Boot1 == a, Boot2 = b, %function is possible, if Boot at bay a
    MA2 is MA1 - FM,
    KA2 is KA1 - FK,
    KB2 is KB1 + FK,
    MB2 is MB1 + FM,     
    (KA2 =< MA2;MA2 == 0),
    (KB2 =< MB2;MB2 == 0),
    (KB1 =< MB1;MB1 == 0),
    (KA1 =< MA1;MA1 == 0).

bootBtoA(MA1,KA1,MB1,KB1,Boot1,MA2,KA2,MB2,KB2,Boot2, FM,FK) :-
    Boot1 == b, Boot2 = a,
    MA2 is MA1 + FM,
    KA2 is KA1 + FK,
    KB2 is KB1 - FK,
    MB2 is MB1 - FM,  
    (KA2 =< MA2;MA2 == 0),
    (KB2 =< MB2;MB2 == 0),
    (KB1 =< MB1;MB1 == 0),
    (KA1 =< MA1;MA1 == 0).


%idfs([3,3,0,0,a], [0,0,3,3,b], 0, P).