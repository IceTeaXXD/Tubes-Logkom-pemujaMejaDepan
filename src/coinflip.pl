/*Kurang cek di awal yang cekCoinFlip dan update di dadu, + driver buat head and tail*/

/*PUTARAN PERTAMA*/ 
/*PLAYER 1*/
/* Koin benar di putaran pertama  */
cf(Guess):- 
    player1(Loc), 
    guessCoinFlipP1(C),
    random(0, 2, U),
    randomCoin(R),
    retract(randomCoin(R)),
    asserta(randomCoin(U)),
    Loc = fc, 
    C = 3,
    U = Guess,!,
    C1 is C - 1,
    write('Tebakan anda benar, tebak 2 kali benar lagi untuk mendapatkan hadiah maksimal'),
    retract(guessCoinFlipP1(C)), 
    asserta(guessCoinFlipP1(C1)).

/* Koin salah di putaran pertama, semua salah */
cf(Guess):- 
    player1(Loc), 
    guessCoinFlipP1(C),
    randomCoin(U),
    Loc = fc, 
    C = 3,
    \+ U = Guess,!,
    write('Sayang sekali tebakan Anda salah'),
    cekCoinFlipP1(P),
    retract(cekCoinFlipP1(P)),
    asserta(cekCoinFlipP1(0)).

/*PLAYER 2*/
/*Koin benar di putaran pertama*/
cf(Guess):- 
    player2(Loc), 
    guessCoinFlipP2(C),
    random(0, 2, U),
    randomCoin(R),
    retract(randomCoin(R)),
    asserta(randomCoin(U)),
    Loc = fc, 
    C is 3,
    U is Guess,!,
    C1 is C - 1, 
    write('Tebakan anda benar, tebak 2 kali benar lagi untuk mendapatkan hadiah maksimal'),
    retract(guessCoinFlipP2(C)), 
    asserta(guessCoinFlipP2(C1)).

/*Koin salah di putaran pertama, semua salah*/
cf(Guess):- 
    player2(Loc), 
    guessCoinFlipP2(C),
    randomCoin(U),
    Loc = fc, 
    C = 3,
    \+ U = Guess,!,
    cekCoinFlipP2(P),
    write('Sayang sekali tebakan Anda salah'),
    retract(cekCoinFlipP2(P)),
    asserta(cekCoinFlipP2(0)).

/*PUTARAN KEDUA*/
/*PLAYER 1*/
/* Koin benar di putaran kedua */
cf(Guess):- 
    player1(Loc), 
    guessCoinFlipP1(C),
    random(0, 2, U),
    randomCoin(R),
    retract(randomCoin(R)),
    asserta(randomCoin(U)),
    Loc = fc,
    C = 2,
    U = Guess,!,
    C1 is C - 1,
    write('Selamat, tebakan kedua Anda benar. tebak satu kali benar untuk mendapat hadiah maksimal'),
    retract(guessCoinFlipP1(C)), 
    asserta(guessCoinFlipP1(C1)).

/*Koin salah di putaran kedua, benar satu, uang bertambah*/
cf(Guess):- 
    player1(Loc), 
    guessCoinFlipP1(C),
    randomCoin(U),
    Loc = fc,
    C = 2,
    \+ U is Guess,!,
    uangP1(Money),
    write('Sayang sekali tebakan Anda salah'),nl,
    write('Anda mendapatkan 200 koin'),nl,
    U1 is Money + 200,
    retract(uangP1(Money)),
    asserta(uangP1(U1)),
    cekCoinFlipP1(P),
    retract(cekCoinFlipP1(P)),
    asserta(cekCoinFlipP1(0)),
    retract(guessCoinFlipP1(C)),
    asserta(guessCoinFlipP1(3)).

/*PLAYER 2*/
/*Koin benar di putaran kedua*/
cf(Guess):- 
    player2(Loc),
    guessCoinFlipP2(C),
    random(0, 2, U),
    randomCoin(R),
    retract(randomCoin(R)),
    asserta(randomCoin(U)),
    Loc = fc, 
    C = 2,
    U = Guess,!,
    C1 = C - 1,
    write('Selamat, tebakan kedua Anda benar. tebak satu kali benar untuk mendapat hadiah maksimal'),
    retract(guessCoinFlipP2(C)), 
    asserta(guessCoinFlipP2(C1)).

/*Koin salah di putaran kedua, benar satu, uang bertambah*/
cf(Guess):- 
    player2(Loc), 
    guessCoinFlipP2(C),
    randomCoin(U),
    Loc = fc,
    C = 2,
    \+ U is Guess,!,
    uangP2(Money),
    U1 is Money + 200,
    write('Sayang sekali tebakan Anda salah'),nl,
    write('Anda mendapatkan 200 koin'),nl,
    retract(uangP2(Money)),
    asserta(uangP2(U1)),
    cekCoinFlipP2(P),
    retract(cekCoinFlipP2(P)),
    asserta(cekCoinFlipP2(0)),
    retract(guessCoinFlipP2(C)),
    asserta(guessCoinFlipP2(3)).

/*PUTARAN KETIGA*/
/*PLAYER 1*/
/* Koin benar di putaran ketiga */
cf(Guess):- 
    player1(Loc), 
    guessCoinFlipP1(C),
    random(0, 2, U),
    randomCoin(R),
    retract(randomCoin(R)),
    asserta(randomCoin(U)),
    Loc = fc, 
    C = 1,
    U = Guess,!,
    write('Selamat, Anda menebak benar 3 kali berturut - turut'),nl,
    write('Anda mendapat 600 koin'),nl,
    uangP1(Money),
    TotAset is Money + 600,
    retract(uangP1(Money)),
    asserta(uangP1(TotAset)),
    retract(guessCoinFlipP1(C)),
    asserta(guessCoinFlipP1(3)),
    cekCoinFlipP1(Cek),
    retract(cekCoinFlipP1(Cek)),
    asserta(cekCoinFlipP1(0)).

/*Koin salah di putaran ketiga*/
cf(Guess):- 
    player1(Loc),
    guessCoinFlipP1(C),
    randomCoin(U),
    Loc = fc, 
    C is 1,
    \+ U is Guess,!,
    write('Sayang sekali tebakan Anda salah'),nl,
    write('Anda mendapatkan 400 koin'),nl,
    uangP1(Money),
    U1 is Money + 400,
    retract(uangP1(Money)),
    asserta(uangP1(U1)),
    cekCoinFlipP1(P),
    retract(cekCoinFlipP1(P)),
    asserta(cekCoinFlipP1(0)),
    retract(guessCoinFlipP1(C)),
    asserta(guessCoinFlipP1(3)).

/*PLAYER 2*/
/*Koin benar di putaran ketiga*/
cf(Guess):- 
    player2(Loc), 
    guessCoinFlipP2(C),
    random(0, 2, U),
    randomCoin(R),
    retract(randomCoin(R)),
    asserta(randomCoin(U)),
    Loc = fc, 
    C is 1,
    U is Guess,!,
    write('Selamat, Anda menebak benar 3 kali berturut - turut'),nl,
    write('Anda mendapat 600 koin'),nl,
    uangP2(Money),
    TotAset is Money + 600,
    retract(uangP2(Money)),
    asserta(uangP2(TotAset)),
    retract(guessCoinFlipP2(C)),
    asserta(guessCoinFlipP2(3)),
    cekCoinFlipP2(Cek),
    retract(cekCoinFlipP2(Cek)),
    asserta(cekCoinFlipP2(0)).

/*Koin salah di putaran ke 3, dapat hadiah*/
cf(Guess):- 
    player2(Loc), 
    guessCoinFlipP2(C),
    randomCoin(U),
    Loc = fc,
    C is 1,
    \+ U is Guess,!,
    write('Sayang sekali tebakan Anda salah'),nl,
    write('Anda mendapatkan 400 koin'),nl,
    uangP2(Money),
    U1 is Money + 400,
    retract(uangP2(Money)),
    asserta(uangP2(U1)),
    cekCoinFlipP2(P),
    retract(cekCoinFlipP2(P)),
    asserta(cekCoinFlipP2(0)),
    retract(guessCoinFlipP2(C)),
    asserta(guessCoinFlipP2(3)).