/* Tanah */
bkrpt:-
    player1(Loc),
    uangP1(Money),
    uangPropP1(PropMoney),
    TotAset is Money + PropMoney,
    /* Mengecek asetnya cukup ga buat bayar */
    elemenBoard(Loc,ID),
    biaya_sewa_tanah(ID,Price),
    Bankrupt is TotAset - Price,
    Bankrupt < 0,
    write('Anda Bangkrut'),nl,
    write('Player 2 menang!'),nl,
    quit.

bkrpt:-
    player2(Loc),
    uangP2(Money),
    uangPropP2(PropMoney),
    TotAset is Money + PropMoney,
    /* Mengecek asetnya cukup ga buat bayar */
    elemenBoard(Loc,ID),
    biaya_sewa_tanah(ID,Price),
    Bankrupt is TotAset - Price,
    Bankrupt < 0,
    write('Anda Bangkrut'),nl,
    write('Player 1 menang!'),nl,
    quit.

/* Bangunan 1 */
bkrpt:-
    player1(Loc),
    uangP1(Money),
    uangPropP1(PropMoney),
    TotAset is Money + PropMoney,
    /* Mengecek asetnya cukup ga buat bayar */
    elemenBoard(Loc,ID),
    biaya_sewa_bangunan1(ID,Price),
    Bankrupt is TotAset - Price,
    Bankrupt < 0,
    write('Anda Bangkrut'),nl,
    write('Player 2 menang!'),nl,
    quit.

bkrpt:-
    player2(Loc),
    uangP2(Money),
    uangPropP2(PropMoney),
    TotAset is Money + PropMoney,
    /* Mengecek asetnya cukup ga buat bayar */
    elemenBoard(Loc,ID),
    biaya_sewa_bangunan1(ID,Price),
    Bankrupt is TotAset - Price,
    Bankrupt < 0,
    write('Anda Bangkrut'),nl,
    write('Player 1 menang!'),nl,
    quit.    

/* Bangunan 2 */
bkrpt:-
    player1(Loc),
    uangP1(Money),
    uangPropP1(PropMoney),
    TotAset is Money + PropMoney,
    /* Mengecek asetnya cukup ga buat bayar */
    elemenBoard(Loc,ID),
    biaya_sewa_bangunan2(ID,Price),
    Bankrupt is TotAset - Price,
    Bankrupt < 0,
    write('Anda Bangkrut'),nl,
    write('Player 2 menang!'),nl,
    quit.

bkrpt:-
    player2(Loc),
    uangP2(Money),
    uangPropP2(PropMoney),
    TotAset is Money + PropMoney,
    /* Mengecek asetnya cukup ga buat bayar */
    elemenBoard(Loc,ID),
    biaya_sewa_bangunan2(ID,Price),
    Bankrupt is TotAset - Price,
    Bankrupt < 0,
    write('Anda Bangkrut'),nl,
    write('Player 1 menang!'),nl,
    quit.

/* Bangunan 3 */
bkrpt:-
    player1(Loc),
    uangP1(Money),
    uangPropP1(PropMoney),
    TotAset is Money + PropMoney,
    /* Mengecek asetnya cukup ga buat bayar */
    elemenBoard(Loc,ID),
    biaya_sewa_bangunan3(ID,Price),
    Bankrupt is TotAset - Price,
    Bankrupt < 0,
    write('Anda Bangkrut'),nl,
    write('Player 2 menang!'),nl,
    quit.

bkrpt:-
    player2(Loc),
    uangP2(Money),
    uangPropP2(PropMoney),
    TotAset is Money + PropMoney,
    /* Mengecek asetnya cukup ga buat bayar */
    elemenBoard(Loc,ID),
    biaya_sewa_bangunan3(ID,Price),
    Bankrupt is TotAset - Price,
    Bankrupt < 0,
    write('Anda Bangkrut'),nl,
    write('Player 1 menang!'),nl,
    quit.

/* Landmark */
bkrpt:-
    player1(Loc),
    uangP1(Money),
    uangPropP1(PropMoney),
    TotAset is Money + PropMoney,
    /* Mengecek asetnya cukup ga buat bayar */
    elemenBoard(Loc,ID),
    biaya_sewa_landmark(ID,Price),
    Bankrupt is TotAset - Price,
    Bankrupt < 0,
    write('Anda Bangkrut'),nl,
    write('Player 2 menang!'),nl,
    quit.

bkrpt:-
    player2(Loc),
    uangP2(Money),
    uangPropP2(PropMoney),
    TotAset is Money + PropMoney,
    /* Mengecek asetnya cukup ga buat bayar */
    elemenBoard(Loc,ID),
    biaya_sewa_landmark(ID,Price),
    Bankrupt is TotAset - Price,
    Bankrupt < 0,
    write('Anda Bangkrut'),nl,
    write('Player 1 menang!'),nl,
    quit.

bkrpt.