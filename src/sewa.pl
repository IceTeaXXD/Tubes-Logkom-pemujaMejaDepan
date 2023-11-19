/* filename : sewa.pl */
cekIsOwnedTanah :-
    aksi(Aksi),
    Aksi = 1,
    player1(Loc),
    propTanahP2(Loc).

cekIsOwnedTanah :-
    aksi(Aksi),
    Aksi = 2,
    player2(Loc), 
    propTanahP1(Loc).

cekIsOwnedBangunan1 :-
    aksi(Aksi),
    Aksi = 1,
    player1(Loc),
    propBangunan1P2(Loc).

cekIsOwnedBangunan1 :-
    aksi(Aksi),
    Aksi = 2,
    player2(Loc),
    propBangunan1P1(Loc).

cekIsOwnedBangunan2 :-
    aksi(Aksi),
    Aksi = 1,
    player1(Loc),
    propBangunan2P2(Loc).

cekIsOwnedBangunan2 :-
    aksi(Aksi),
    Aksi = 2,
    player2(Loc),
    propBangunan2P1(Loc).

cekIsOwnedBangunan3 :-
    aksi(Aksi),
    Aksi = 1,
    player1(Loc),
    propBangunan3P2(Loc).

cekIsOwnedBangunan3 :-
    aksi(Aksi),
    Aksi = 2,
    player2(Loc),
    propBangunan3P1(Loc).

cekIsOwnedLandmark :-
    aksi(Aksi),
    Aksi = 1,
    player1(Loc),
    propLandmarkP2(Loc).

cekIsOwnedLandmark :-
    aksi(Aksi),
    Aksi = 2,
    player2(Loc),
    propLandmarkP1(Loc).

sewaTanah :-
    aksi(Aksi),
    Aksi = 1,
    cekIsOwnedTanah,
    player1(Loc),
    elemenBoard(Loc,ID),
    biaya_sewa_tanah(ID,Biaya), 
    uangP1(Uang1),
    Uang1 >= Biaya,
    UangBaru1 is Uang1 - Biaya,
    retract(uangP1(Uang1)),
    asserta(uangP1(UangBaru1)),
    uangP2(Uang2),
    UangBaru2 is Uang2 + Biaya,
    retract(uangP2(Uang2)),
    asserta(uangP2(UangBaru2)),
    write('Anda berada di '), write(Loc), write(' yang dimiliki oleh Player 2.'), nl,
    write('Anda harus membayar sewa sebesar '), write(Biaya),nl,
    write('Uang Anda sekarang adalah '), write(UangBaru1),nl.

sewaTanah :-
    aksi(Aksi),
    Aksi = 1,
    cekIsOwnedTanah,
    player1(Loc), 
    elemenBoard(Loc,ID),
    biaya_sewa_tanah(ID, Biaya),
    uangP1(Uang1),
    Uang1 < Biaya,
    write('Uang Anda tidak cukup untuk membayar sewa tanah!'),nl,
    write('Anda harus menjual properti Anda!'),nl,!.

sewaTanah :-
    aksi(Aksi),
    Aksi = 2,
    cekIsOwnedTanah,
    player2(Loc), 
    elemenBoard(Loc,ID),
    biaya_sewa_tanah(ID,Biaya),
    uangP2(Uang2),
    Uang2 >= Biaya,
    UangBaru2 is Uang2 - Biaya,
    retract(uangP2(Uang2)),
    asserta(uangP2(UangBaru2)),
    uangP1(Uang1),
    UangBaru1 is Uang1 + Biaya,
    retract(uangP1(Uang1)),
    asserta(uangP1(UangBaru1)),
    write('Anda berada di '), write(Loc), write(' yang dimiliki oleh Player 1.'), nl,
    write('Anda harus membayar sewa sebesar '), write(Biaya),nl,
    write('Uang Anda sekarang adalah '), write(UangBaru2),nl,!.

sewaTanah :-
    aksi(Aksi),
    Aksi = 2,
    cekIsOwnedTanah,
    player2(Loc),
    elemenBoard(Loc,ID),
    biaya_sewa_tanah(ID,Biaya),
    uangP2(Uang2),
    Uang2 < Biaya,
    write('Uang Anda tidak cukup untuk membayar sewa tanah!'),nl,
    write('Anda harus menjual properti Anda!'),nl,
    displayAset.

sewaBangunan1 :-
    aksi(Aksi),
    Aksi = 1,
    cekIsOwnedBangunan1,
    player1(Loc), 
    elemenBoard(Loc,ID),
    biaya_sewa_bangunan1(ID,Biaya),
    uangP1(Uang1),
    Uang1 >= Biaya,
    UangBaru1 is Uang1 - Biaya,
    retract(uangP1(Uang1)),
    asserta(uangP1(UangBaru1)),
    uangP2(Uang2),
    UangBaru2 is Uang2 + Biaya,
    retract(uangP2(Uang2)),
    asserta(uangP2(UangBaru2)),
    write('Anda berada di '), write(Loc), write(' yang dimiliki oleh Player 2.'), nl,
    write('Anda harus membayar sewa sebesar '), write(Biaya),nl,
    write('Uang Anda sekarang adalah '), write(UangBaru1),nl, !.

sewaBangunan1  :-
    aksi(Aksi),
    Aksi = 1,
    cekIsOwnedBangunan1,
    player1(Loc),
    elemenBoard(Loc,ID),
    biaya_sewa_bangunan1(ID,Biaya),
    uangP1(Uang1),
    Uang1 < Biaya,
    write('Uang Anda tidak cukup untuk membayar sewa bangunan!'),nl,
    write('Anda harus menjual properti Anda!'),nl,
    displayAset.

sewaBangunan1 :-
    aksi(Aksi),
    Aksi = 2,
    cekIsOwnedBangunan1,
    player2(Loc), 
    elemenBoard(Loc,ID),
    biaya_sewa_bangunan1(ID,Biaya),
    uangP2(Uang2),
    Uang2 >= Biaya,
    UangBaru2 is Uang2 - Biaya,
    retract(uangP2(Uang2)),
    asserta(uangP2(UangBaru2)),
    uangP1(Uang1),
    UangBaru1 is Uang1 + Biaya,
    retract(uangP1(Uang1)),
    asserta(uangP1(UangBaru1)),
    write('Anda berada di '), write(Loc), write(' yang dimiliki oleh Player 1.'), nl,
    write('Anda harus membayar sewa sebesar '), write(Biaya),nl,
    write('Uang Anda sekarang adalah '), write(UangBaru2),nl, !.

sewaBangunan1 :-
    aksi(Aksi),
    Aksi = 2,
    cekIsOwnedBangunan1,
    player2(Loc),
    elemenBoard(Loc,ID),
    biaya_sewa_bangunan1(ID,Biaya),
    uangP2(Uang2),
    Uang2 < Biaya,
    write('Uang Anda tidak cukup untuk membayar sewa bangunan!'),nl,
    write('Anda harus menjual properti Anda!'),nl,
    displayAset.

sewaBangunan2 :-
    aksi(Aksi),
    Aksi = 1,
    cekIsOwnedBangunan2,
    player1(Loc), 
    elemenBoard(Loc,ID),
    biaya_sewa_bangunan2(ID,Biaya),
    uangP1(Uang1),
    Uang1 >= Biaya,
    UangBaru1 is Uang1 - Biaya,
    retract(uangP1(Uang1)),
    asserta(uangP1(UangBaru1)),
    uangP2(Uang2),
    UangBaru2 is Uang2 + Biaya,
    retract(uangP2(Uang2)),
    asserta(uangP2(UangBaru2)),
    write('Anda berada di '), write(Loc), write(' yang dimiliki oleh Player 2.'), nl,
    write('Anda harus membayar sewa sebesar '), write(Biaya),nl,
    write('Uang Anda sekarang adalah '), write(UangBaru1),nl, !.

sewaBangunan2 :-
    aksi(Aksi),
    Aksi = 1,
    cekIsOwnedBangunan2,
    player1(Loc),
    elemenBoard(Loc,ID),
    biaya_sewa_bangunan2(ID,Biaya),
    uangP1(Uang1),
    Uang1 < Biaya,
    write('Uang Anda tidak cukup untuk membayar sewa bangunan!'),nl,
    write('Anda harus menjual properti Anda!'),nl,
    displayAset.

sewaBangunan2 :-
    aksi(Aksi),
    Aksi = 2,
    cekIsOwnedBangunan2,
    player2(Loc),  
    elemenBoard(Loc,ID),
    biaya_sewa_bangunan2(ID,Biaya),
    uangP2(Uang2),
    Uang2 >= Biaya,
    UangBaru2 is Uang2 - Biaya,
    retract(uangP2(Uang2)),
    asserta(uangP2(UangBaru2)),
    uangP1(Uang1),
    UangBaru1 is Uang1 + Biaya,
    retract(uangP1(Uang1)),
    asserta(uangP1(UangBaru1)),
    write('Anda berada di '), write(Loc), write(' yang dimiliki oleh Player 1.'), nl,
    write('Anda harus membayar sewa sebesar '), write(Biaya),nl,
    write('Uang Anda sekarang adalah '), write(UangBaru2),nl, !.

sewaBangunan2 :-
    aksi(Aksi),
    Aksi = 2,
    cekIsOwnedBangunan2,
    player2(Loc),
    elemenBoard(Loc,ID),
    biaya_sewa_bangunan2(ID,Biaya),
    uangP2(Uang2),
    Uang2 < Biaya,
    write('Uang Anda tidak cukup untuk membayar sewa bangunan!'),nl,
    write('Anda harus menjual properti Anda!'),nl,
    displayAset.

sewaBangunan3 :-
    aksi(Aksi),
    Aksi = 1,
    cekIsOwnedBangunan3, 
    player1(Loc), 
    elemenBoard(Loc,ID),
    biaya_sewa_bangunan3(ID,Biaya),
    uangP1(Uang1),
    Uang1 >= Biaya,
    UangBaru1 is Uang1 - Biaya,
    retract(uangP1(Uang1)),
    asserta(uangP1(UangBaru1)),
    uangP2(Uang2),
    UangBaru2 is Uang2 + Biaya,
    retract(uangP2(Uang2)),
    asserta(uangP2(UangBaru2)),
    write('Anda berada di '), write(Loc), write(' yang dimiliki oleh Player 2.'), nl,
    write('Anda harus membayar sewa sebesar '), write(Biaya),nl,
    write('Uang Anda sekarang adalah '), write(UangBaru1),nl, !.

sewaBangunan3 :-
    aksi(Aksi),
    Aksi = 1,
    cekIsOwnedBangunan3,
    player1(Loc),
    elemenBoard(Loc,ID),
    biaya_sewa_bangunan3(ID,Biaya),
    uangP1(Uang1),
    Uang1 < Biaya,
    write('Uang Anda tidak cukup untuk membayar sewa bangunan!'),nl,
    write('Anda harus menjual properti Anda!'),nl,
    displayAset.

sewaBangunan3 :-
    aksi(Aksi),
    Aksi = 2,
    cekIsOwnedBangunan3,
    player2(Loc),  
    elemenBoard(Loc,ID),
    biaya_sewa_bangunan3(ID,Biaya),
    uangP2(Uang2),
    Uang2 >= Biaya,
    UangBaru2 is Uang2 - Biaya,
    retract(uangP2(Uang2)),
    asserta(uangP2(UangBaru2)),
    uangP1(Uang1),
    UangBaru1 is Uang1 + Biaya,
    retract(uangP1(Uang1)),
    asserta(uangP1(UangBaru1)),
    write('Anda berada di '), write(Loc), write(' yang dimiliki oleh Player 1.'), nl,
    write('Anda harus membayar sewa sebesar '), write(Biaya),nl,
    write('Uang Anda sekarang adalah '), write(UangBaru2),nl, !.

sewaBangunan3 :-
    aksi(Aksi),
    Aksi = 2,
    cekIsOwnedBangunan3,
    player2(Loc),
    elemenBoard(Loc,ID),
    biaya_sewa_bangunan3(ID,Biaya),
    uangP2(Uang2),
    Uang2 < Biaya,
    write('Uang Anda tidak cukup untuk membayar sewa bangunan!'),nl,
    write('Anda harus menjual properti Anda!'),nl,
    displayAset.

sewaLandmark :-
    aksi(Aksi),
    Aksi = 1,
    cekIsOwnedLandmark,
    player1(Loc),  
    elemenBoard(Loc,ID),
    biaya_sewa_landmark(ID,Biaya),
    uangP1(Uang1),
    Uang1 >= Biaya,
    UangBaru1 is Uang1 - Biaya,
    retract(uangP1(Uang1)),
    asserta(uangP1(UangBaru1)),
    uangP2(Uang2),
    UangBaru2 is Uang2 + Biaya,
    retract(uangP2(Uang2)),
    asserta(uangP2(UangBaru2)),
    write('Anda berada di '), write(Loc), write(' yang dimiliki oleh Player 2.'), nl,
    write('Anda harus membayar sewa sebesar '), write(Biaya),nl,
    write('Uang Anda sekarang adalah '), write(UangBaru1),nl, !.

sewaLandmark :-
    aksi(Aksi),
    Aksi = 1,
    cekIsOwnedLandmark,
    player1(Loc),
    elemenBoard(Loc,ID),
    biaya_sewa_landmark(ID,Biaya),
    uangP1(Uang1),
    Uang1 < Biaya,
    write('Uang Anda tidak cukup untuk membayar sewa landmark!'),nl,
    write('Anda harus menjual properti Anda!'),nl,
    displayAset.

sewaLandmark :-
    aksi(Aksi),
    Aksi = 2,
    cekIsOwnedLandmark,
    player2(Loc),  
    elemenBoard(Loc,ID),
    biaya_sewa_landmark(ID,Biaya),
    uangP2(Uang2),
    Uang2 >= Biaya,
    UangBaru2 is Uang2 - Biaya,
    retract(uangP2(Uang2)),
    asserta(uangP2(UangBaru2)),
    uangP1(Uang1),
    UangBaru1 is Uang1 + Biaya,
    retract(uangP1(Uang1)),
    asserta(uangP1(UangBaru1)),
    write('Anda berada di '), write(Loc), write(' yang dimiliki oleh Player 1.'), nl,
    write('Anda harus membayar sewa sebesar '), write(Biaya),nl,
    write('Uang Anda sekarang adalah '), write(UangBaru2),nl, !.

sewaLandmark :-
    aksi(Aksi),
    Aksi = 2,
    cekIsOwnedLandmark,
    player2(Loc),
    elemenBoard(Loc,ID),
    biaya_sewa_landmark(ID,Biaya),
    uangP2(Uang2),
    Uang2 < Biaya,
    write('Uang Anda tidak cukup untuk membayar sewa landmark!'),nl,
    write('Anda harus menjual properti Anda!'),nl,
    displayAset.