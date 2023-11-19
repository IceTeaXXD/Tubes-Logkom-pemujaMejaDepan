/* filename: chancecard.pl */
/*
Misalkan 
1. Kartu Tax
2. Kartu Hadiah
3. Kartu Get Out of Jail
4. Kartu Go to Jail
*/

/* Mengeluarkan chancecard */
chancecard :-
    /* Randomize */
    player1(Loc),
    Loc = cc1,!,
    random(1,6,X),
    getCard(X).

chancecard :-
    /* Randomize */
    player1(Loc),
    Loc = cc2,!,
    random(1,6,X),
    getCard(X).

chancecard :-
    /* Randomize */
    player1(Loc),
    Loc = cc3,!,
    random(1,6,X),
    getCard(X).

chancecard :-
    /* Randomize */
    player2(Loc),
    Loc = cc1,!,
    random(1,6,X),
    getCard(X).

chancecard :-
    /* Randomize */
    player2(Loc),
    Loc = cc2,!,
    random(1,6,X),
    getCard(X).

chancecard :-
    /* Randomize */
    player2(Loc),
    Loc = cc3,!,
    random(1,6,X),
    getCard(X).

chancecard :- write('Anda tidak berada di area chance card!'), nl.
    
/* Fungsi Get Card. Melihat nilai X, disesuaikan
dengan pemisalan */

/* Untuk kartu Tax. (BLM DIIMPLEMENTASIKAN: HARUS PINDAH KE TEMPAT TAX TERDEKAT!) */
getCard(X) :-
    X = 1,
    turn(Turn),
    Turn is 2,!,
    write('Anda telah tiba di Chance Card'),nl,
    write('Anda mendapatkan kartu pajak dan dipindahkan ke lokasi pajak'),nl,
    player1(Pos),
    retract(player1(Pos)),
    asserta(player1(tx1)),
    taxP1,!.

getCard(X) :- 
    X = 1,
    turn(Turn),
    Turn is 1,!,
    write('Anda telah tiba di Chance Card'),nl,
    write('Anda mendapatkan kartu pajak dan dipindahkan ke lokasi pajak'),nl,
    player2(Pos),
    retract(player2(Pos)),
    asserta(player2(tx1)),
    taxP2,!.

/* Untuk kartu hadiah */
/* Proses: Uang nambah */
getCard(X) :-
    X = 2,
    turn(Turn),
    Turn is 2,!,
    random(1,5,Utemp),
    uangP1(UangSkrg),
    UangAkhir is UangSkrg + Utemp * 10000,
    retract(uangP1(UangSkrg)),
    asserta(uangP1(UangAkhir)),nl,
    write('Anda telah tiba di Chance Card'),nl,
    write('Anda mendapatkan kartu hadiah'),!.

getCard(X) :-
    X = 2,
    turn(Turn),
    Turn is 1,!,
    random(1,6,Utemp),
    uangP2(UangSkrg),
    UangAkhir is UangSkrg + Utemp * 10000,
    retract(uangP2(UangSkrg)),
    asserta(uangP2(UangAkhir)), nl,
    write('Anda telah tiba di Chance Card'),nl,
    write('Anda mendapatkan kartu hadiah'),!.

/* Kartu Get out of Jail */
/* Proses: Jumlah kartu get out of jail nambah 1 */
getCard(X) :-
    X = 3,
    aksi(Aksi),
    Aksi is 1,!,
    numGetOutOfJailP1(Num),
    NumAkhir is Num + 1,
    retract(numGetOutOfJailP1(Num)),
    asserta(numGetOutOfJailP1(NumAkhir)),
    retractEmptyCard,
    asserta(listofCardsP1(getoutofjail)), 
    write('Anda telah tiba di Chance Card'),nl,
    write('Anda mendapatkan kartu Get Out Of Jail'),!.

getCard(X) :-
    X = 3,
    aksi(Aksi),
    Aksi is 2,!,
    numGetOutOfJailP2(Num),
    NumAkhir is Num + 1,
    retract(numGetOutOfJailP2(Num)),
    asserta(numGetOutOfJailP2(NumAkhir)),
    retractEmptyCard,
    asserta(listofCardsP2(getoutofjail)), 
    write('Anda telah tiba di Chance Card'),nl,
    write('Anda mendapatkan kartu Get Out Of Jail'),!.

/* Kartu Go To Jail */
/* Proses: Pindah ke Jail */
getCard(X) :-
    X = 4,
    aksi(Aksi),
    Aksi is 1,!,
    player1(Pos),
    retract(player1(Pos)),
    asserta(player1(jl)), 
    jailp1(J),
    retract(jailp1(J)),
    asserta(jailp1(2)),
    turn(T),
    retract(turn(T)),
    asserta(turn(2)),
    prev(Prev),
    count(Count),
    retract(prev(Prev)),
    asserta(prev(0)),
    retract(count(Count)),
    asserta(count(0)),
    write('Anda telah tiba di Chance Card'),nl,
    write('Sayang sekali Anda mendapat kartu Penjara'),nl,
    write('Anda akan dipindahkan ke penjara'),!.

getCard(X) :-
    X = 4,
    aksi(Aksi),
    Aksi is 2,!,
    player2(Pos),
    retract(player2(Pos)),
    asserta(player2(jl)), 
    jailp2(J),
    retract(jailp2(J)),
    asserta(jailp2(2)),
    turn(T),
    retract(turn(T)),
    asserta(turn(1)),
    prev(Prev),
    count(Count),
    retract(prev(Prev)),
    asserta(prev(0)),
    retract(count(Count)),
    asserta(count(0)),
    write('Anda telah tiba di Chance Card'),nl,
    write('Sayang sekali Anda mendapat kartu Penjara'),nl,
    write('Anda akan dipindahkan ke penjara'),!.

/* Go to World Tour */
getCard(X) :-
    X = 5,
    aksi(Aksi),
    Aksi is 1, !,
    player1(Pos),
    retract(player1(Pos)),
    asserta(player1(wt)),
    write('Selamat Anda mendapatkan kartu world tour'),nl,
    write('Anda akan dipindahkan ke world tour'),nl.

getCard(X) :-
    X = 5,
    aksi(Aksi),
    Aksi is 2, !,
    player1(Pos),
    retract(player1(Pos)),
    asserta(player1(wt)),
    write('Selamat Anda mendapatkan kartu world tour'),nl,
    write('Anda akan dipindahkan ke world tour'),nl.

/*Penggunaan chance card*/

/*Get Out Of Jail*/
/*Player 1*/
getOutOfJailCard:-
    numGetOutOfJailP1(X),
    X>0,
    X1 is X-1,
    retract(numGetOutOfJailP1(X)),
    asserta(numGetOutOfJailP1(X1)),
    jailp1(J),
    retract(jailp1(J)),
    asserta(jailp1(0)),
    write('Menggunakan kartu Get Out Of Jail'),nl,
    write('Berhasil keluar dari jail !'),
    throwDice,!.

getOutOfJailCard :-
    numGetOutOfJailP1(X),
    X = 0,
    write('Anda tidak memiliki kartu Get Out Of Jail'),nl,!.

/*Player 2*/
getOutOfJailCard:-
    numGetOutOfJailP2(X),
    X>0,
    X1 is X-1,
    retract(numGetOutOfJailP2(X)),
    asserta(numGetOutOfJailP2(X1)),
    jailp2(J),
    retract(jailp2(J)),
    asserta(jailp2(0)),
    write('Menggunakan kartu Get Out Of Jail'),nl,
    write('Berhasil keluar dari jail !'),
    throwDice,!.

getOutOfJailCard :-
    numGetOutOfJailP2(X),
    X = 0,
    write('Anda tidak memiliki kartu Get Out Of Jail'),nl,!.