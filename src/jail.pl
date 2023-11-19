/* Mekanisme Untuk keluar dari jail */
getOutJailBail :-
    player1(Loc),
    Loc = jl,!,
    /* BAYAR JAIL */
    uangP1(Money),
    Money >= 5000,!,
    NewMoney is Money - 5000,
    retract(uangP1(Money)),
    asserta(uangP1(NewMoney)),
    jailp1(A),
    retract(jailp1(A)),
    asserta(jailp1(0)),
    count(B),
    retract(count(B)),
    asserta(count(0)),
    prev(C),
    retract(prev(C)),
    asserta(prev(0)),
    /* GERAK SETELAH GET OUT */
    write('Berhasil membayar bail'),nl,
    write('Anda otomatis boleh melakukan role dice'),nl.

getOutJailBail :-
    player2(Loc),
    Loc = jl,!,
    /* BAYAR JAIL */
    uangP2(Money),
    Money >= 5000,!,
    NewMoney is Money - 5000,
    retract(uangP2(Money)),
    asserta(uangP2(NewMoney)),
    jailp2(A),
    retract(jailp2(A)),
    asserta(jailp2(0)),
    count(B),
    retract(count(B)),
    asserta(count(0)),
    prev(C),
    retract(prev(C)),
    asserta(prev(0)),
    /* GERAK SETELAH GET OUT */
    write('Berhasil membayar bail'),nl,
    write('Anda otomatis boleh melakukan role dice'),nl.

getOutJailBail :- uangP2(Money), Money<5000, write('Uang Anda tidak cukup'),nl.
getOutJailBail :- uangP1(Money), Money<5000, write('Uang Anda tidak cukup'),nl.


/* Get out tapi pake chancecard */
useGetOutChanceCard :-
    player1(Loc),
    Loc = jl,
    /* Cek punya kartunya ato gak */
    listofCardsP1(getoutofjail),!,
    retract(listofCardsP1(getoutofjail)),
    jailp1(A),
    retract(jailp1(A)),
    asserta(jailp1(0)),
    count(B),
    retract(count(B)),
    asserta(count(0)),
    prev(C),
    retract(prev(C)),
    asserta(prev(0)),
    /* GERAK */
    write('Berhasil menggunakan kartu getoutofjail.'),nl,
    write('Anda sudah keluar dari penjara'),nl,
    write('Anda boleh throwdice untuk bergerak'),nl.

useGetOutChanceCard :-
    player2(Loc),
    Loc = jl,
    /* Cek punya kartunya ato gak */
    listofCardsP2(getoutofjail),!,
    retract(listofCardsP2(getoutofjail)),
    jailp2(A),
    retract(jailp2(A)),
    asserta(jailp2(0)),
    count(B),
    retract(count(B)),
    asserta(count(0)),
    prev(C),
    retract(prev(C)),
    asserta(prev(0)),
    /* GERAK */
    write('Berhasil menggunakan kartu getoutofjail.'),nl,
    write('Anda sudah keluar dari penjara'),nl,
    write('Anda boleh throwdice untuk bergerak'),nl.