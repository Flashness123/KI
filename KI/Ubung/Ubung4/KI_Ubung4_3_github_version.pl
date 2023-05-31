% Run missionaries(((3,3),(0,0),1),[],Path).

validMove(Position, Visited):-
    notMember(Position,Visited),
    positiveCount(Position),
    noEatingAnyone(Position).

positiveCount(((LeftCannibals,LeftMissionaries), (RightCannibals,RightMissionaries),_)):-
     LeftCannibals >=0,
     LeftMissionaries >=0,
     RightCannibals >=0,
     RightMissionaries >=0.

noEatingAnyone(((_,0),(RightCannibals,RightMissionaries),_)):- RightMissionaries >= RightCannibals, !.
noEatingAnyone(((LeftCannibals,LeftMissionaries), (_,0),_)):- LeftMissionaries >= LeftCannibals, !.
noEatingAnyone(((LeftCannibals,LeftMissionaries), (RightCannibals,RightMissionaries),_)):-
     LeftMissionaries >= LeftCannibals,
     RightMissionaries >= RightCannibals.

notMember(X,L) :- member(X,L), !, fail ; true.

move2missionaries(((LeftCannibals,LeftMissionaries),(RightCannibals,RightMissionaries), BoatPosition), ((LeftCannibals,
NewLeftMissionaries),(RightCannibals,NewRightMissionaries), NewBoatPosition)):-
    NewRightMissionaries is RightMissionaries  + BoatPosition * 2,
    NewLeftMissionaries is LeftMissionaries - BoatPosition * 2,
    NewBoatPosition is BoatPosition * -1.

move1missionary(((LeftCannibals,LeftMissionaries),(RightCannibals,RightMissionaries),BoatPosition), ((LeftCannibals,
NewLeftMissionaries),(RightCannibals,NewRightMissionaries),NewBoatPosition)):-
    NewRightMissionaries is RightMissionaries  + BoatPosition * 1,
    NewLeftMissionaries is LeftMissionaries - BoatPosition * 1,
    NewBoatPosition is BoatPosition * -1.

move2cannibals(((LeftCannibals,LeftMissionaries),(RightCannibals,RightMissionaries), BoatPosition), ((NewLeftCannibals,
LeftMissionaries),(NewRightCannibals,RightMissionaries),NewBoatPosition)):-
    NewRightCannibals is RightCannibals  + BoatPosition * 2,
    NewLeftCannibals is LeftCannibals - BoatPosition * 2,
    NewBoatPosition is BoatPosition * -1.

move1cannibal(((LeftCannibals,LeftMissionaries),(RightCannibals,RightMissionaries), BoatPosition),
((NewLeftCannibals, LeftMissionaries),(NewRightCannibals,RightMissionaries), NewBoatPosition)):-
    NewRightCannibals is RightCannibals  + BoatPosition * 1,
    NewLeftCannibals is LeftCannibals - BoatPosition * 1,
    NewBoatPosition is BoatPosition * -1.

move1each(((LeftCannibals,LeftMissionaries),(RightCannibals,RightMissionaries),BoatPosition), ((NewLeftCannibals,
NewLeftMissionaries),(NewRightCannibals,NewRightMissionaries),NewBoatPosition)):-
     NewRightMissionaries is RightMissionaries  + BoatPosition * 1,
     NewLeftMissionaries is LeftMissionaries - BoatPosition * 1,
     NewRightCannibals is RightCannibals  + BoatPosition * 1,
     NewLeftCannibals is LeftCannibals - BoatPosition * 1,
     NewBoatPosition is BoatPosition * -1.


missionaries(((0,0),(3,3), -1),_,[]):- !.

missionaries(CurrentPosition, Visited, ['2M'|RestOfPath]):-
    move2missionaries(CurrentPosition, NextPosition),
    validMove(NextPosition, Visited),
    missionaries(NextPosition, [CurrentPosition|Visited], RestOfPath).

missionaries(CurrentPosition, Visited, ['1M'|RestOfPath]):-
    move1missionary(CurrentPosition, NextPosition),
    validMove(NextPosition, Visited),
    missionaries(NextPosition, [CurrentPosition|Visited], RestOfPath).

missionaries(CurrentPosition, Visited, ['2C'|RestOfPath]):-
    move2cannibals(CurrentPosition, NextPosition),
    validMove(NextPosition, Visited),
    missionaries(NextPosition, [CurrentPosition|Visited], RestOfPath).

missionaries(CurrentPosition, Visited, ['1C'|RestOfPath]):-
    move1cannibal(CurrentPosition, NextPosition),
    validMove(NextPosition, Visited),
    missionaries(NextPosition, [CurrentPosition|Visited], RestOfPath).

missionaries(CurrentPosition, Visited, ['1C1M'|RestOfPath]):-
    move1each(CurrentPosition, NextPosition),
    validMove(NextPosition, Visited),
    missionaries(NextPosition, [CurrentPosition|Visited], RestOfPath).