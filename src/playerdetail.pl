/* filename: playerdetail.pl */
checkPlayerDetail(X) :-
    idPlayer(X),
    X = p1,!,
    write('Informasi player '), write(X), nl,nl,
    player1(Loc),
    write('Lokasi: '), write(Loc),nl,
    uangP1(Money),
    write('Total Uang: '), write(Money), nl,
    uangPropP1(PropMoney),
    write('Total Nilai Properti: '),write(PropMoney),  nl,
    TotAset is PropMoney + Money,
    write('Total Aset: '), write(TotAset),nl,
    nl,
    /* DAFTAR PROPERTI */
    write('Daftar Kepemilikan Properti: '),nl,
    printPropP1,
    nl,
    /* DAFTAR KEPEMILIKAN */
    write('Daftar Kepemilikan Card: '), nl,
    printCardP1,
    nl.

checkPlayerDetail(X) :-
    idPlayer(X),
    X = p2,!,
    write('Informasi player '), write(X), nl,nl,
    player2(Loc),
    write('Lokasi: '), write(Loc),nl,
    uangP2(Money),
    write('Total Uang: '), write(Money), nl,
    uangPropP2(PropMoney),
    write('Total Nilai Properti: '),write(PropMoney),  nl,
    TotAset is PropMoney + Money,
    write('Total Aset: '), write(TotAset),nl,
    nl,
    /* DAFTAR PROPERTI */
    write('Daftar Kepemilikan Properti: '),nl,
    printPropP2,
    nl,
    /* DAFTAR KEPEMILIKAN */
    write('Daftar Kepemilikan Card: '), nl,
    printCardP2,
    nl.

checkPlayerDetail(X):-
    \+idPlayer(X),
    write('ID tidak terdefinisi').

isPropEmptyP1:-
    listOfPropsP1([]).

isPropEmptyP2:-
    listOfPropsP2([]).

isCardEmptyP1:-
    listofCardsP1([]).

isCardEmptyP2:-
    listofCardsP2([]).

printPropP1:-
    isPropEmptyP1,
    write('Tidak ada properti yang dimiliki'),nl.

printPropP1:-
    \+isPropEmptyP1,
    listPropTanahP1,
    listPropBang1P1,
    listPropBang2P1,
    listPropBang3P1,
    listPropLandmarkP1.

printCardP1:-
    isCardEmptyP1,
    write('Tidak ada kartu yang dimiliki'),nl.

printCardP1:-
    \+isCardEmptyP1,
    forall(listofCardsP1(Cards), (write(Cards),nl)).

printPropP2:-
    isPropEmptyP2,
    write('Tidak ada properti yang dimiliki'),nl.

printPropP2:-
    \+isPropEmptyP2,
    listPropTanahP2,
    listPropBang1P2,
    listPropBang2P2,
    listPropBang3P2,
    listPropLandmarkP2.

printCardP2:-
    isCardEmptyP2,
    write('Tidak ada kartu yang dimiliki'),nl.

printCardP2:-
    \+isCardEmptyP2,
    forall(listofCardsP2(Cards), (write(Cards),nl)).

listPropTanahP1:-
    write('Tanah: '),
    forall(propTanahP1(Prop), (write(Prop), write(' '))),
    nl.

listPropBang1P1:-
    write('Bangunan 1: '),
    forall(propBangunan1P1(Prop), (write(Prop), write(' '))),
    nl.

listPropBang2P1:-
    write('Bangunan 2: '),
    forall(propBangunan2P1(Prop), (write(Prop), write(' '))),
    nl.

listPropBang3P1:-
    write('Bangunan 3: '),
    forall(propBangunan3P1(Prop), (write(Prop), write(' '))),
    nl.


listPropLandmarkP1:-
    write('Landmark: '),
    forall(propLandmarkP1(Prop), (write(Prop), write(' '))),
    nl.

listPropTanahP2:-
    write('Tanah: '),
    forall(propTanahP2(Prop), (write(Prop), write(' '))),
    nl.

listPropBang1P2:-
    write('Bangunan 1: '),
    forall(propBangunan1P2(Prop), (write(Prop), write(' '))),
    nl.

listPropBang2P2:-
    write('Bangunan 2: '),
    forall(propBangunan2P2(Prop), (write(Prop), write(' '))),
    nl.

listPropBang3P2:-
    write('Bangunan 3: '),
    forall(propBangunan3P2(Prop), (write(Prop), write(' '))),
    nl.

listPropLandmarkP2:-
    write('Landmark: '),
    forall(propLandmarkP2(Prop), (write(Prop), write(' '))),
    nl.