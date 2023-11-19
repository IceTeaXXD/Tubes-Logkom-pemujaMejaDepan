generateUang(X,Y):-
    (Y = p1 -> 
        uangP1(Uang),
        UangBaru is X,
        retract(uangP1(_)),
        asserta(uangP1(UangBaru)));
    (Y = p2 ->
        uangP2(Uang),
        UangBaru is X,
        retract(uangP2(_)),
        asserta(uangP2(UangBaru))).