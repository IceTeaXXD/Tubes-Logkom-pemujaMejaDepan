/*
Setiap masuk penjara akan ada countdown 3 kali turn
semisal bayar maka countdownnya bakal langsung habis
semisal punya chance card juga bisa
atau dapet dadu dobel
*/

/*Pertama buat cek dadu double disini dulu*/
/*Player 1*/
updateTurn(Turn,NewTurn,Z,1):-
    /*Cek lokasi player*/
    Turn is 1,
    player1(Loc),
    prev(Prev),
    Prev = 0,
    count(Count),
    /*Apapun value dari jail maka akan dikeluarkan dan diganti oleh 0*/
    jailp1(J),
    retract(jailp1(J)),
    asserta(jailp1(0)),
    moveX(Loc,Z,NewLoc),
    retract(player1(Loc)),
    asserta(player1(NewLoc)),
    retract(count(Count)),
    asserta(count(1)),
    retract(prev(Prev)),
    asserta(prev(1)),
    write('Anda berhasil mendapatkan dadu double !'),nl,
    write('Berhasil berpindah sejauh '), write(Z),write(' langkah.'),nl,
    cekJailP1(NewLoc,NT),
    newTurnUpdateP1(NT,YY),
    NewTurn is YY,!.

/*Kondisi ketika player 1 double dadu kedua kalinya*/
updateTurn(Turn,NewTurn,Z,1):-
    Turn = 1,
    count(Count),
    prev(Prev),
    Prev = 1,
    Count = 1,
    player1(Loc),
    moveX(Loc,Z,NewLoc),
    retract(player1(Loc)),
    asserta(player1(NewLoc)),
    write(NewLoc),nl,
    retract(count(Count)),
    asserta(count(2)),
    write('Anda berhasil mendapatkan dadu double !'),nl,
    write('Berhasil berpindah sejauh '), write(Z),write(' langkah.'),nl,
    cekJailP1(NewLoc,NT),
    newTurnUpdateP1(NT,YY),
    NewTurn is YY,!.

/*Player 1 ketika dadu double ke 3 kalinya*/
updateTurn(Turn,NewTurn,_,1):-
    Turn = 1,
    count(Count),
    prev(Prev),
    Prev = 1,
    Count = 2,
    jailp1(J),
    retract(count(Count)),
    asserta(count(0)),
    retract(prev(Prev)),
    asserta(prev(0)),
    teleport(jl,1),
    retract(jailp1(J)),
    asserta(jailp1(2)),
    write('Anda mendapat 3 kali dadu double'),nl,
    write('Anda akan berpindah ke penjara.'),nl,
    NewTurn is 2,!. 

/*Player 1 ketika dadu tidak double dan masih di penjara*/
updateTurn(Turn, NewTurn,_, 0):-
    jailp1(J),
    J>0,
    Turn = 1,
    count(Count),
    prev(Prev),
    retract(prev(Prev)),
    asserta(prev(0)),
    retract(count(Count)),
    asserta(count(0)),
    retract(jailp1(J)),
    J1 is J-1,
    asserta(jailp1(J1)),
    write('Sayang sekali Anda masih belum bisa keluar dari penjara :('),nl,
    NewTurn is 2,!.

/*Player 1 ketika dadu tidak double dan tidak dipenjara (ada move)*/
updateTurn(Turn, NewTurn,Z, 0):-
    player1(Loc),
    jailp1(J),
    J = 0,
    Turn = 1,
    moveX(Loc,Z,NewLoc),
    count(Count),
    prev(Prev),
    retract(player1(Loc)),
    asserta(player1(NewLoc)),
    retract(prev(Prev)),
    asserta(prev(0)),
    retract(count(Count)),
    asserta(count(0)),
    write('Berhasil berpindah sejauh '), write(Z),write(' langkah.'),nl,
    cekJailP1(NewLoc,_),
    NewTurn is 2,!.

/*Update Player 2*/
/*Kondisi ketika player 2 mengalami dadu double untuk pertama kali*/
updateTurn(Turn,NewTurn,Z,1):-
    /*Cek lokasi player*/
    player2(Loc),
    Turn is 2,
    count(Count),
    jailp2(J),
    prev(Prev),
    Prev = 0,
    retract(jailp2(J)),
    asserta(jailp2(0)),
    moveX(Loc,Z,NewLoc),
    retract(player2(Loc)),
    asserta(player2(NewLoc)),
    /*karna dadu double maka bisa lepas dari penjara (intinya reset jail ke 0) */
    retract(count(Count)),
    asserta(count(1)),
    retract(prev(Prev)),
    asserta(prev(2)),
    write('Anda berhasil mendapatkan dadu double !'),nl,
    write('Berhasil berpindah sejauh '), write(Z),write(' langkah.'),nl,
    cekJailP2(NewLoc,NT),
    newTurnUpdateP2(NT,YY),
    NewTurn is YY,!.

/*Kondisi ketika player 2 double dadu kedua kalinya*/
updateTurn(Turn,NewTurn,Z,1):-
    player2(Loc),
    Turn = 2,
    count(Count),
    prev(Prev),
    Prev = 2,
    Count = 1,
    moveX(Loc,Z,NewLoc),
    retract(player2(Loc)),
    asserta(player2(NewLoc)),
    retract(count(Count)),
    asserta(count(2)),
    write('Anda berhasil mendapatkan dadu double !'),nl,
    write('Berhasil berpindah sejauh '), write(Z),write(' langkah.'),nl,
    cekJailP2(NewLoc,NT),
    newTurnUpdateP2(NT,YY),
    NewTurn is YY,!.

/*Kondisi ketika player 2 mengalami double 3 kali dan teleport ke penjara*/
updateTurn(Turn,NewTurn,_,1):-
    Turn = 2,
    count(Count),
    prev(Prev),
    Prev = 2,
    Count = 2,
    jailp2(J),
    retract(count(Count)),
    asserta(count(0)),
    retract(prev(Prev)),
    asserta(prev(0)),
    teleport(jl,2),
    retract(jailp2(J)),
    asserta(jailp2(2)),
    write('Anda mendapat 3 kali dadu double'),nl,
    write('Anda akan berpindah ke penjara.'),nl,
    NewTurn is 1,!.

/*Player 2 ketika masih di penjara tapi tidak dapat dadu double*/
updateTurn(Turn,NewTurn,_,0):-
    jailp2(J),
    J>0,
    Turn = 2,
    count(Count),
    prev(Prev),
    retract(prev(Prev)),
    asserta(prev(0)),
    retract(count(Count)),
    asserta(count(0)),
    retract(jailp2(J)),
    J1 is J-1,
    asserta(jailp2(J1)),
    write('Sayang sekali Anda masih belum bisa keluar dari penjara :('),nl,
    NewTurn is 1,!.

/*Kondisi ketika player 2 tidak dipenjara dan dadu tidak double*/
updateTurn(Turn,NewTurn,Z,0):-
    player2(Loc),
    jailp2(J),
    J = 0,
    Turn = 2,
    count(Count),
    prev(Prev),
    moveX(Loc,Z,NewLoc),
    retract(player2(Loc)),
    asserta(player2(NewLoc)),
    retract(count(Count)),
    asserta(count(0)),
    retract(prev(Prev)),
    asserta(prev(0)),
    write('Berhasil berpindah sejauh '), write(Z),write(' langkah.'),nl,
    cekJailP2(NewLoc,_),
    NewTurn is 1,!.

/*Fungsi cekJailP1(X,Y), apabila ke jail maka Y akan bernilai 1*/
cekJailP1(jl,1):-
    jailp1(J),
    write('Anda telah tiba di Jail'),nl,
    write('Dapatkan dadu double untuk keluar secara gratis'),
    prev(Prev),
    count(Count),
    retract(prev(Prev)),
    asserta(prev(0)),
    retract(count(Count)),
    asserta(count(0)),
    retract(jailp1(J)),
    asserta(jailp1(2)),!.

cekJailP1(_,0).

cekJailP2(jl,1):-
    jailp2(J),
    prev(Prev),
    count(Count),
    retract(prev(Prev)),
    asserta(prev(0)),
    retract(count(Count)),
    asserta(count(0)),
    write('Anda telah tiba di Jail'),nl,
    write('Dapatkan dadu double untuk keluar secara gratis'),
    retract(jailp2(J)),
    asserta(jailp2(2)).

cekJailP2(_,0).

/*Untuk cek turn apabila dadu double tapi menuju ke jail maka turn akan berpindah
Fungsi ini berhubungan dengan fungsi cek jail
newTurnUpdateP1(1,2) artinya jika benar menuju jail maka turn akan berpindah ke p2 walau dadu double*/
newTurnUpdateP1(1,2):-!.
newTurnUpdateP1(0,1):-!.
newTurnUpdateP2(1,1):-!.
newTurnUpdateP2(0,2):-!.

/*Fungsi untuk cek apakah posisi pemain di tax*/
cekTaxP1(tx1):- 
    taxP1,!.
cekTaxP1(tx2):- 
    taxP1,!.
cekTaxP1(_).

cekTaxP2(tx1):-
    taxP2,!.
cekTaxP2(tx2):-
    taxP2,!.
cekTaxP2(_).

/* Rule untuk cek apakah pemain ada di daerah cc1,cc2, cc3 */
cekCCP1(cc1) :-
    chancecard, !.
cekCCP1(cc2) :-
    chancecard, !.
cekCCP1(cc3) :-
    chancecard, !.
cekCCP1(_).

cekCCP2(cc1) :-
    chancecard, !.
cekCCP2(cc2) :-
    chancecard, !.
cekCCP2(cc3) :-
    chancecard, !.
cekCCP2(_).

/*Fungsi cek flipcoin*/
cekFCP1(Loc):-
    Loc = fc,
    cekCoinFlipP1(C),
    retract(cekCoinFlipP1(C)),
    asserta(cekCoinFlipP1(1)).
cekFPP1(_). 
cekFCP2(Loc):-
    Loc = fc,
    cekCoinFlipP2(C),
    retract(cekCoinFlipP2(C)),
    asserta(cekCoinFlipP2(1)).
cekFCP2(_).