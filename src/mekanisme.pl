/* filename mekanisme.pl */
/* Berisi mekanisme tx, wt, cc, dsb. */

/* 
Note : 
    - Mekanisme beli tanah, bangunan, landmark udah berhasil jalan dan mindahin dari uang cash ke aset
    - Buat tambahan yg paling deket bisa benerin buat persyaratan beli bangunan (harus punya tanah dulu, landmark harus punya bangunan 3 dulu, dll)
    - Buat Syarat klo udah punya gabisa beli lg
    - Tambahin notifikasi buat beli 
*/
:- dynamic(temp/1).

/* Mekanisme tax */
taxP1 :- 
    uangP1(Money),
    uangPropP1(PropMoney),
    TotAset is Money + PropMoney,
    TaxedMoney is Money - TotAset*0.10,
    P is TotAset*0.10,
    retract(uangP1(Money)),
    asserta(uangP1(TaxedMoney)),
    /*TLG BENERIN TAMPILAN INI DONG JELEK SOALNYA HEHE :)*/
    write(' -----------------------------------'),nl,
    write(' Anda telah tiba di kantor pajak !'),nl,
    write(' Berhasil membayar pajak sebesar '), write(P),nl,
    write(' -----------------------------------').

taxP2 :- 
    uangP2(Money),
    uangPropP2(PropMoney),
    TotAset is Money + PropMoney,
    TaxedMoney is Money - TotAset*0.10,
    P is TotAset*0.10,
    retract(uangP2(Money)),
    asserta(uangP2(TaxedMoney)),
    write('-----------------------------------'),nl,
    write(' Anda telah tiba di kantor pajak !'),nl,
    write(' Berhasil membayar pajak sebesar  '), write(P),nl,
    write('-----------------------------------').

/*Kondisi ketika*/
/*wt(X) -> X adalah tempat untuk berpindah, harus di cek apakah lokasi ada di WT
penggunaan wt harus cek apakah player 1 atau player 2*/

wt(X):-
    player1(Loc),
    Loc = wt,
    turn(T),
    T = 1,
    uangP1(Money),
    distance(X,D),
    D > 7,
    N is Money - 300 +5000,
    retract(player1(Loc)),
    asserta(player1(X)),
    retract(uangP1(Money)),
    asserta(uangP1(N)),
    write('Berhasil berpindah ke '),write(X),nl,
    write('Anda melalui Go, uang bertambah sebesar 5000').

wt(X):-
    player1(Loc),
    Loc = wt,
    turn(T),
    T = 1,
    uangP1(Money),
    distance(X,D),
    D < 8,
    N is Money - 300,
    N>0,
    retract(player1(Loc)),
    asserta(player1(X)),
    retract(uangP1(Money)),
    asserta(uangP1(N)),
    write('Berhasil berpindah ke '),write(X),nl.

wt(X):-
    player1(Loc),
    Loc = wt,
    turn(T),
    T = 1,
    uangP1(Money),
    distance(X,D),
    D < 8,
    N is Money - 300,
    N<0,
    write('Maaf uang anda tidak mencukupi untuk menggunakan World Tour'),nl,
    write('Silahkan berpindah ke posisi Go atau lebih untuk menggunakan World Tour').

wt(X):-
    player2(Loc),
    Loc = wt,
    turn(T),
    T = 2,
    uangP2(Money),
    distance(X,D),
    D>7,
    N is Money - 300 + 5000,
    retract(player2(Loc)),
    asserta(player2(X)),
    retract(uangP2(Money)),
    asserta(uangP2(N)),
    write('Berhasil berpindah ke '),write(X),nl,
    write('Anda melalui Go, uang bertambah sebesar 5000').

wt(X):-
    player2(Loc),
    Loc = wt,
    turn(T),
    T = 2,
    uangP2(Money),
    distance(X,D),
    D<8,
    N is Money - 300,
    N>0,
    retract(player2(Loc)),
    asserta(player2(X)),
    retract(uangP2(Money)),
    asserta(uangP2(N)),
    write('Berhasil berpindah ke '),write(X),nl.

wt(X):-
    player2(Loc),
    Loc = wt,
    turn(T),
    T = 2,
    uangP2(Money),
    distance(X,D),
    D<8,
    N is Money - 300,
    N<0,
    write('Maaf uang anda tidak mencukupi untuk menggunakan World Tour'),nl,
    write('Silahkan berpindah ke posisi Go atau lebih untuk menggunakan World Tour').
/* Mekanisme Akuisisi*/

/*Mekanisme akuisisi tanah*/
% ERROR MESSAGE HARUS DIBENERIN
cekAkuisiTanahP1(Loc) :-
    propTanahP1(Loc).

cekAkuisiTanahP2(Loc) :-
    propTanahP2(Loc).

cekAkuisiBang1P1(Loc) :-
    propBangunan1P1(Loc).

cekAkuisiBang1P2(Loc) :-
    propBangunan1P2(Loc).

cekAkuisiBang2P1(Loc) :-
    propBangunan2P1(Loc).

cekAkuisiBang2P2(Loc) :-
    propBangunan2P2(Loc).

cekAkuisiBang3P1(Loc) :-
    propBangunan3P1(Loc).

cekAkuisiBang3P2(Loc) :-
    propBangunan3P2(Loc).

cekAkuisiLandmarkP1(Loc) :-
    propLandmarkP1(Loc).

cekAkuisiLandmarkP2(Loc) :-
    propLandmarkP2(Loc).

cekAkuisisiPropertiP1(Loc) :-
    listOfPropsP1(Loc).

cekAkuisisiPropertiP2(Loc) :-
    listOfPropsP2(Loc).

akutanah :-
    aksi(A),
    A = 1,
    player1(Loc),
    cekAkuisiTanahP1(Loc), write('Anda sudah memiliki tanah ini!'),nl.

akutanah :-
    aksi(A),
    A = 2,
    player2(Loc),
    cekAkuisiTanahP2(Loc), write('Anda sudah memiliki tanah ini!'),nl.

akutanah :-
    aksi(A),
    A = 1,
    player1(Loc),

    % CEK SUDAH DIAKUISISI ATAU BELUM
    \+ cekAkuisiTanahP1(Loc),
    \+ cekAkuisisiPropertiP2(Loc),

    elemenBoard(Loc, ID),
    uangP1(Money),
    uangPropP1(TotalPropP1),
    harga_tanah(ID, PropMoney),
    Money >= PropMoney,
    MoneyAfter is Money - PropMoney,
    TotAset is TotalPropP1 + PropMoney,
    retract(uangP1(Money)),
    asserta(uangP1(MoneyAfter)),
    retract(uangPropP1(TotalPropP1)),
    asserta(uangPropP1(TotAset)),
    /* masukin ke fakta bahwa skrg lokasi ini punya P1 */
    asserta(propTanahP1(Loc)),
    asserta(listOfPropsP1(Loc)),
    /* masukin ke map klo dah dibeli */
    retractall(temp(_)),
    asserta(temp('Q0')),
    temp(Temp),
    writeProperty(Loc,Temp), write('Sukses'), nl, retractEmptyProp,
    /* Update Kepemilikan */
    kepemilikan(Loc,X),
    retract(kepemilikan(Loc,X)),
    asserta(kepemilikan(Loc,'Pemain 1')),
    /* Update Tingkat Properti */
    tingkatProperti(Loc,X),
    retract(tingkatProperti(Loc,X)),
    asserta(tingkatProperti(Loc,'Tanah')).

akutanah :- 
    aksi(A),
    A = 1,
    player1(Loc),
    elemenBoard(Loc,ID),
    uangP1(Money),
    harga_tanah(ID,PropMoney),
    Money<PropMoney,
    write('Maaf uang anda tidak cukup untuk membeli tanah').

akutanah :-
    aksi(A),
    A = 2,
    player2(Loc),

    % CEK SUDAH DIAKUISISI ATAU BELUM
    \+ cekAkuisiTanahP2(Loc),
    \+ cekAkuisisiPropertiP1(Loc),

    elemenBoard(Loc, ID),
    uangP2(Money),
    uangPropP2(TotalPropP2),
    harga_tanah(ID, PropMoney),
    Money >= PropMoney,
    MoneyAfter is Money - PropMoney,
    TotAset is TotalPropP2 + PropMoney,
    retract(uangP2(Money)),
    asserta(uangP2(MoneyAfter)),
    retract(uangPropP2(TotalPropP2)),
    asserta(uangPropP2(TotAset)),
    /* masukin ke fakta bahwa skrg lokasi ini punya P2 */
    asserta(propTanahP2(Loc)),
    asserta(listOfPropsP2(Loc)),
    /* masukin ke map klo dah dibeli */
    retractall(temp(_)),
    asserta(temp('R0')),
    temp(Temp),
    writeProperty(Loc,Temp), write('Sukses'), nl, retractEmptyProp,
    /* Update Kepemilikan */
    kepemilikan(Loc,X),
    retract(kepemilikan(Loc,X)),
    asserta(kepemilikan(Loc,'Pemain 2')),
    /* Update Tingkat Properti */
    tingkatProperti(Loc,X),
    retract(tingkatProperti(Loc,X)),
    asserta(tingkatProperti(Loc,'Tanah')).

akutanah :- 
    aksi(A),
    A = 2,
    player2(Loc),
    elemenBoard(Loc,ID),
    uangP2(Money),
    harga_tanah(ID,PropMoney),
    Money<PropMoney,
    write('Maaf uang anda tidak cukup untuk membeli tanah').

akubang1 :- 
    aksi(A),
    A = 1,
    player1(Loc),
    \+ cekAkuisiTanahP1(Loc), write('Anda belum memiliki tanah ini'), nl.

akubang1 :-
    aksi(A),
    A = 1,
    player1(Loc),
    cekAkuisiTanahP1(Loc),
    cekAkuisiBang1P1(Loc), write('Anda sudah memiliki bangunan 1 pada properti ini!'),nl.

akubang1 :-
    aksi(A),
    A = 1,
    player1(Loc),
    cekAkuisiTanahP1(Loc),
    \+ cekAkuisiBang1P1(Loc),
    cekAkuisisiPropertiP2(Loc), write('Properti ini sudah diakuisisi Player 2!'),nl.

akubang1 :-
    aksi(A),
    A = 1,
    player1(Loc),

    % CEK SUDAH DIAKUISISI ATAU BELUM
    cekAkuisiTanahP1(Loc),
    \+ cekAkuisiBang1P1(Loc),
    \+ cekAkuisisiPropertiP2(Loc),

    elemenBoard(Loc, ID),
    uangP1(Money),
    uangPropP1(TotalPropP1),
    harga_bangunan1(ID, PropMoney),
    Money >= PropMoney,
    MoneyAfter is Money - PropMoney,
    TotAset is TotalPropP1 + PropMoney,
    retract(uangP1(Money)),
    asserta(uangP1(MoneyAfter)),
    retract(uangPropP1(TotalPropP1)),
    asserta(uangPropP1(TotAset)),
    /*Ini masih harus dibenerin, mungkin buat proptanahP1 nya diisi id aja biar bisa dibedain*/
    /*retract(propBangunan1P1(Bangunan1)),*/
    /* masukin ke fakta bahwa skrg lokasi ini punya P1 */
    asserta(propBangunan1P1(Loc)),
    % asserta(listOfPropsP1(Loc)),
    /* masukin ke map klo dah dibeli */
    retractall(temp(_)),
    asserta(temp('Q1')),
    temp(Temp),
    writeProperty(Loc,Temp), write('Sukses'), nl,
    /* Update Tingkat Properti */
    tingkatProperti(Loc,X),
    retract(tingkatProperti(Loc,X)),
    asserta(tingkatProperti(Loc,'Bangunan 1')).

akubang1 :- 
    aksi(A),
    A = 1,
    player1(Loc),
    elemenBoard(Loc,ID),
    uangP1(Money),
    harga_bangunan1(ID,PropMoney),
    Money<PropMoney,
    write('Maaf uang anda tidak cukup untuk membeli bangunan').

akubang1 :-
    aksi(A),
    A = 2,
    player2(Loc),
    \+ cekAkuisiTanahP2(Loc), write('Anda belum memiliki tanah ini'), nl.

akubang1 :-
    aksi(A),
    A = 2,
    player2(Loc),
    cekAkuisiTanahP2(Loc),
    cekAkuisiBang1P2(Loc), write('Anda sudah memiliki bangunan 1 pada properti ini!'),nl.

akubang1 :-
    aksi(A),
    A = 2,
    player2(Loc),
    cekAkuisiTanahP2(Loc),
    \+ cekAkuisiBang1P2(Loc),
    cekAkuisisiPropertiP1(Loc), write('Properti ini sudah diakuisisi Player 1!'),nl.

akubang1 :-
    aksi(A),
    A = 2,
    player2(Loc),

    % CEK SUDAH DIAKUISISI ATAU BELUM
    cekAkuisiTanahP2(Loc),
    \+ cekAkuisiBang1P2(Loc),
    \+ cekAkuisisiPropertiP1(Loc),

    elemenBoard(Loc, ID),
    uangP2(Money),
    uangPropP2(TotalPropP2),
    harga_bangunan1(ID, PropMoney),
    Money >= PropMoney,
    MoneyAfter is Money - PropMoney,
    TotAset is TotalPropP2 + PropMoney,
    retract(uangP2(Money)),
    asserta(uangP2(MoneyAfter)),
    retract(uangPropP2(TotalPropP2)),
    asserta(uangPropP2(TotAset)),
    /* masukin ke fakta bahwa skrg lokasi ini punya P2 */
    asserta(propBangunan1P2(Loc)),
    % asserta(listOfPropsP2(Loc)),
    /* masukin ke map klo dah dibeli */
    retractall(temp(_)),
    asserta(temp('R1')),
    temp(Temp),
    writeProperty(Loc,Temp), write('Sukses'), nl,
    /* Update Tingkat Properti */
    tingkatProperti(Loc,X),
    retract(tingkatProperti(Loc,X)),
    asserta(tingkatProperti(Loc,'Bangunan 1')).

akubang1 :- 
    aksi(A),
    A = 2,
    player2(Loc),
    elemenBoard(Loc,ID),
    uangP2(Money),
    harga_bangunan1(ID,PropMoney),
    Money<PropMoney,
    write('Maaf uang anda tidak cukup untuk membeli bangunan').

/* AKUBANG 2 */
akubang2 :- 
    aksi(A),
    A = 1,
    player1(Loc),
    \+ cekAkuisiBang1P1(Loc), write('Anda belum memiliki bangunan ini'), nl.

akubang2 :-
    aksi(A),
    A = 1,
    player1(Loc),
    cekAkuisiBang1P1(Loc),
    cekAkuisiBang2P1(Loc), write('Anda sudah memiliki bangunan 2 pada properti ini!'),nl.

akubang2 :-
    aksi(A),
    A = 1,
    player1(Loc),
    cekAkuisiBang1P1(Loc),
    \+ cekAkuisiBang2P1(Loc),
    cekAkuisisiPropertiP2(Loc), write('Properti ini sudah diakuisisi Player 2!'),nl.

akubang2 :-
    aksi(A),
    A = 1,
    player1(Loc),

    % CEK SUDAH DIAKUISISI ATAU BELUM
    cekAkuisiBang1P1(Loc),
    \+ cekAkuisiBang2P1(Loc),
    \+ cekAkuisisiPropertiP2(Loc),

    elemenBoard(Loc, ID),
    uangP1(Money),
    uangPropP1(TotalPropP1),
    harga_bangunan2(ID, PropMoney),
    Money >= PropMoney,
    MoneyAfter is Money - PropMoney,
    TotAset is TotalPropP1 + PropMoney,
    retract(uangP1(Money)),
    asserta(uangP1(MoneyAfter)),
    retract(uangPropP1(TotalPropP1)),
    asserta(uangPropP1(TotAset)),
    /* masukin ke fakta bahwa skrg lokasi ini punya P1 */
    asserta(propBangunan2P1(Loc)),
    % asserta(listOfPropsP1(Loc)),
    /* masukin ke map klo dah dibeli */
    retractall(temp(_)),
    asserta(temp('Q2')),
    temp(Temp),
    writeProperty(Loc,Temp), write('Sukses'), nl,
    /* Update Tingkat Properti */
    tingkatProperti(Loc,X),
    retract(tingkatProperti(Loc,X)),
    asserta(tingkatProperti(Loc,'Bangunan 2')).

akubang2 :- 
    aksi(A),
    A = 1,
    player1(Loc),
    elemenBoard(Loc,ID),
    uangP1(Money),
    harga_bangunan2(ID,PropMoney),
    Money<PropMoney,
    write('Maaf uang anda tidak cukup untuk membeli bangunan').

akubang2 :-
    aksi(A),
    A = 2,
    player2(Loc),
    \+ cekAkuisiBang1P2(Loc), write('Anda belum memiliki bangunan ini'), nl.

akubang2 :-
    aksi(A),
    A = 2,
    player2(Loc),
    cekAkuisiBang1P2(Loc),
    cekAkuisiBang2P2(Loc), write('Anda sudah memiliki bangunan 2 pada properti ini!'),nl.

akubang2 :-
    aksi(A),
    A = 2,
    player2(Loc),
    cekAkuisiBang1P2(Loc),
    \+ cekAkuisiBang2P2(Loc),
    cekAkuisisiPropertiP1(Loc), write('Properti ini sudah diakuisisi Player 1!'),nl.

akubang2 :-
    aksi(A),
    A = 2,
    player2(Loc),

    % CEK SUDAH DIAKUISISI ATAU BELUM
    cekAkuisiBang1P2(Loc),
    \+ cekAkuisiBang2P2(Loc),
    \+ cekAkuisisiPropertiP1(Loc),

    elemenBoard(Loc, ID),
    uangP2(Money),
    uangPropP2(TotalPropP2),
    harga_bangunan2(ID, PropMoney),
    Money >= PropMoney,
    MoneyAfter is Money - PropMoney,
    TotAset is TotalPropP2 + PropMoney,
    retract(uangP2(Money)),
    asserta(uangP2(MoneyAfter)),
    retract(uangPropP2(TotalPropP2)),
    asserta(uangPropP2(TotAset)),
    /* masukin ke fakta bahwa skrg lokasi ini punya P2 */
    asserta(propBangunan2P2(Loc)),
    % asserta(listOfPropsP2(Loc)),
    /* masukin ke map klo dah dibeli */
    retractall(temp(_)),
    asserta(temp('R2')),
    temp(Temp),
    writeProperty(Loc,Temp), write('Sukses'), nl,
    /* Update Tingkat Properti */
    tingkatProperti(Loc,X),
    retract(tingkatProperti(Loc,X)),
    asserta(tingkatProperti(Loc,'Bangunan 2')).

akubang2 :- 
    aksi(A),
    A = 2,
    player2(Loc),
    elemenBoard(Loc,ID),
    uangP2(Money),
    harga_bangunan2(ID,PropMoney),
    Money<PropMoney,
    write('Maaf uang anda tidak cukup untuk membeli bangunan').

akubang3 :- 
    aksi(A),
    A = 1,
    player1(Loc),
    \+ cekAkuisiBang2P1(Loc), write('Anda belum memiliki bangunan ini'), nl.

akubang3 :-
    aksi(A),
    A = 1,
    player1(Loc),
    cekAkuisiBang2P1(Loc),
    cekAkuisiBang3P1(Loc), write('Anda sudah memiliki bangunan 3 pada properti ini!'),nl.

akubang3 :-
    aksi(A),
    A = 1,
    player1(Loc),
    cekAkuisiBang2P1(Loc),
    \+ cekAkuisiBang3P1(Loc),
    cekAkuisisiPropertiP2(Loc), write('Properti ini sudah diakuisisi Player 2!'),nl.

akubang3 :-
    aksi(A),
    A = 1,
    player1(Loc),

    % CEK SUDAH DIAKUISISI ATAU BELUM
    cekAkuisiBang2P1(Loc),
    \+ cekAkuisiBang3P1(Loc),
    \+ cekAkuisisiPropertiP2(Loc),

    elemenBoard(Loc, ID),
    uangP1(Money),
    uangPropP1(TotalPropP1),
    harga_bangunan3(ID, PropMoney),
    Money >= PropMoney,
    MoneyAfter is Money - PropMoney,
    TotAset is TotalPropP1 + PropMoney,
    retract(uangP1(Money)),
    asserta(uangP1(MoneyAfter)),
    retract(uangPropP1(TotalPropP1)),
    asserta(uangPropP1(TotAset)),
    /* masukin ke fakta bahwa skrg lokasi ini punya P1 */
    asserta(propBangunan3P1(Loc)),
    % asserta(listOfPropsP1(Loc)),
    /* masukin ke map klo dah dibeli */
    retractall(temp(_)),
    asserta(temp('Q3')),
    temp(Temp),
    writeProperty(Loc,Temp), write('Sukses'), nl,
    /* Update Tingkat Properti */
    tingkatProperti(Loc,X),
    retract(tingkatProperti(Loc,X)),
    asserta(tingkatProperti(Loc,'Bangunan 3')).


akubang3 :- 
    aksi(A),
    A = 1,
    player1(Loc),
    elemenBoard(Loc,ID),
    uangP1(Money),
    harga_bangunan3(ID,PropMoney),
    Money<PropMoney,
    write('Maaf uang anda tidak cukup untuk membeli bangunan').

akubang3 :-
    aksi(A),
    A = 2,
    player2(Loc),
    \+ cekAkuisiBang2P2(Loc), write('Anda belum memiliki bangunan ini'), nl.

akubang3 :-
    aksi(A),
    A = 2,
    player2(Loc),
    cekAkuisiBang2P2(Loc),
    cekAkuisiBang3P2(Loc), write('Anda sudah memiliki bangunan 3 pada properti ini!'),nl.

akubang3 :-
    aksi(A),
    A = 2,
    player2(Loc),
    cekAkuisiBang2P2(Loc),
    \+ cekAkuisiBang3P2(Loc),
    cekAkuisisiPropertiP1(Loc), write('Properti ini sudah diakuisisi Player 1!'),nl.

akubang3 :-
    aksi(A),
    A = 2,
    player2(Loc),

    % CEK SUDAH DIAKUISISI ATAU BELUM
    cekAkuisiBang2P2(Loc),
    \+ cekAkuisiBang3P2(Loc),
    \+ cekAkuisisiPropertiP1(Loc),

    elemenBoard(Loc, ID),
    uangP2(Money),
    uangPropP2(TotalPropP2),
    harga_bangunan3(ID, PropMoney),
    Money >= PropMoney,
    MoneyAfter is Money - PropMoney,
    TotAset is TotalPropP2 + PropMoney,
    retract(uangP2(Money)),
    asserta(uangP2(MoneyAfter)),
    retract(uangPropP2(TotalPropP2)),
    asserta(uangPropP2(TotAset)),
    /* masukin ke fakta bahwa skrg lokasi ini punya P2 */
    asserta(propBangunan3P2(Loc)),
    % asserta(listOfPropsP2(Loc)),
    /* masukin ke map klo dah dibeli */
    retractall(temp(_)),
    asserta(temp('R3')),
    temp(Temp),
    writeProperty(Loc,Temp), write('Sukses'), nl,
    /* Update Tingkat Properti */
    tingkatProperti(Loc,X),
    retract(tingkatProperti(Loc,X)),
    asserta(tingkatProperti(Loc,'Bangunan 3')).

akubang3 :- 
    aksi(A),
    A = 2,
    player2(Loc),
    elemenBoard(Loc,ID),
    uangP2(Money),
    harga_bangunan3(ID,PropMoney),
    Money<PropMoney,
    write('Maaf uang anda tidak cukup untuk membeli bangunan').


akulandmark :- 
    aksi(A),
    A = 1,
    player1(Loc),
    \+ cekAkuisiBang3P1(Loc), write('Anda belum memiliki landmark ini'), nl.

akulandmark :-
    aksi(A),
    A = 1,
    player1(Loc),
    cekAkuisiBang3P1(Loc),
    cekAkuisiLandmarkP1(Loc), write('Anda sudah memiliki landmark pada properti ini!'),nl.

akulandmark :-
    aksi(A),
    A = 1,
    player1(Loc),
    cekAkuisiBang3P1(Loc),
    \+ cekAkuisiLandmarkP1(Loc),
    cekAkuisisiPropertiP2(Loc), write('Properti ini sudah diakuisisi Player 2!'),nl.

akulandmark :-
    aksi(A),
    A = 1,
    player1(Loc),

    % CEK SUDAH DIAKUISISI ATAU BELUM
    cekAkuisiBang3P1(Loc),
    \+ cekAkuisiLandmarkP1(Loc),
    \+ cekAkuisisiPropertiP2(Loc),

    elemenBoard(Loc, ID),
    uangP1(Money),
    uangPropP1(TotalPropP1),
    harga_landmark(ID, PropMoney),
    Money >= PropMoney,
    MoneyAfter is Money - PropMoney,
    TotAset is TotalPropP1 + PropMoney,
    retract(uangP1(Money)),
    asserta(uangP1(MoneyAfter)),
    retract(uangPropP1(TotalPropP1)),
    asserta(uangPropP1(TotAset)),
    /* masukin ke fakta bahwa skrg lokasi ini punya P2 */
    asserta(propLandmarkP1(Loc)),
    % asserta(listOfPropsP1(Loc)),
    /* masukin ke map klo dah dibeli */
    retractall(temp(_)),
    asserta(temp('QL')),
    temp(Temp),
    writeProperty(Loc,Temp), write('Sukses'), nl,
    /* Update Tingkat Properti */
    tingkatProperti(Loc,X),
    retract(tingkatProperti(Loc,X)),
    asserta(tingkatProperti(Loc,'Landmark')).

akulandmark :- 
    aksi(A),
    A = 1,
    player1(Loc),
    elemenBoard(Loc,ID),
    uangP1(Money),
    harga_landmark(ID,PropMoney),
    Money<PropMoney,
    write('Maaf uang anda tidak cukup untuk membeli Landmark').

akulandmark :-
    aksi(A),
    A = 2,
    player2(Loc),
    \+ cekAkuisiBang3P2(Loc), write('Anda belum memiliki landmark ini'), nl.

akulandmark :-
    aksi(A),
    A = 2,
    player2(Loc),
    cekAkuisiBang3P2(Loc),
    cekAkuisiLandmarkP2(Loc), write('Anda sudah memiliki landmark pada properti ini!'),nl.

akulandmark :-
    aksi(A),
    A = 2,
    player2(Loc),
    cekAkuisiBang3P1(Loc),
    \+ cekAkuisiLandmarkP2(Loc),
    cekAkuisisiPropertiP1(Loc), write('Properti ini sudah diakuisisi Player 1!'),nl.

akulandmark :-
    aksi(A),
    A = 2,
    player2(Loc),

    % CEK SUDAH DIAKUISISI ATAU BELUM
    cekAkuisiBang3P2(Loc),
    \+ cekAkuisiLandmarkP2(Loc),
    \+ cekAkuisisiPropertiP1(Loc),

    elemenBoard(Loc, ID),
    uangP2(Money),
    uangPropP2(TotalPropP2),
    harga_landmark(ID, PropMoney),
    Money >= PropMoney,
    MoneyAfter is Money - PropMoney,
    TotAset is TotalPropP2 + PropMoney,
    retract(uangP2(Money)),
    asserta(uangP2(MoneyAfter)),
    retract(uangPropP2(TotalPropP2)),
    asserta(uangPropP2(TotAset)),
        /* masukin ke fakta bahwa skrg lokasi ini punya P1s */
    asserta(propLandmarkP1(Loc)),
    % asserta(listOfPropsP1(Loc)),
    /* masukin ke map klo dah dibeli */
    retractall(temp(_)),
    asserta(temp('RL')),
    temp(Temp),
    writeProperty(Loc,Temp), write('Sukses'), nl,
    /* Update Tingkat Properti */
    tingkatProperti(Loc,X),
    retract(tingkatProperti(Loc,X)),
    asserta(tingkatProperti(Loc,'Landmark')).

akulandmark :- 
    aksi(A),
    A = 2,
    player2(Loc),
    elemenBoard(Loc,ID),
    uangP2(Money),
    harga_landmark(ID,PropMoney),
    Money<PropMoney,
    write('Maaf uang anda tidak cukup untuk membeli Landmark').

/* Build di GO */
goBuildBang1(Location) :- 
    aksi(A),
    A = 1,
    player1(Loc),
    Loc \= go,
    Location = go,
    write('Anda tidak berada di GO!'), nl.

goBuildBang1(Location) :-
    aksi(A),
    A = 2,
    player2(Loc),
    Loc \= go,
    Location = go,
    write('Anda tidak berada di GO!'), nl.

goBuildBang1(Location) :-
    aksi(A),
    A = 1,
    player1(Loc),
    Loc = go,
    retract(player1(Loc)),
    asserta(player1(Location)),
    akubang1,
    retract(player1(Location)),
    asserta(player1(Loc)).

goBuildBang1(Location) :-
    aksi(A),
    A = 2,
    player2(Loc),
    Loc = go,
    retract(player2(Loc)),
    asserta(player2(Location)),
    akubang1,
    retract(player2(Location)),
    asserta(player2(go)).

goBuildBang2(Location) :-
    aksi(A),
    A = 1,
    player1(Loc),
    Loc \= go,
    Location = go,
    write('Anda tidak berada di GO!'), nl.

goBuildBang2(Location) :-
    aksi(A),
    A = 2,
    player2(Loc),
    Loc \= go,
    Location = go,
    write('Anda tidak berada di GO!'), nl.

goBuildBang2(Location) :-
    aksi(A),
    A = 1,
    player1(Loc),
    Loc = go,
    retract(player1(Loc)),
    asserta(player1(Location)),
    akubang2,
    retract(player1(Location)),
    asserta(player1(Loc)).

goBuildBang2(Location) :-
    aksi(A),
    A = 2,
    player2(Loc),
    Loc = go,
    retract(player2(Loc)),
    asserta(player2(Location)),
    akubang2,
    retract(player2(Location)),
    asserta(player2(go)).

goBuildBang3(Location) :-
    aksi(A),
    A = 1,
    player1(Loc),
    Loc \= go,
    Location = go,
    write('Anda tidak berada di GO!'), nl.

goBuildBang3(Location) :-
    aksi(A),
    A = 2,
    player2(Loc),
    Loc \= go,
    Location = go,
    write('Anda tidak berada di GO!'), nl.

goBuildBang3(Location) :-
    aksi(A),
    A = 1,
    player1(Loc),
    Loc = go,
    retract(player1(Loc)),
    asserta(player1(Location)),
    akubang3,
    retract(player1(Location)),
    asserta(player1(Loc)).

goBuildBang3(Location) :-
    aksi(A),
    A = 2,
    player2(Loc),
    Loc = go,
    retract(player2(Loc)),
    asserta(player2(Location)),
    akubang3,
    retract(player2(Location)),
    asserta(player2(go)).

goBuildLandmark(Location) :-
    aksi(A),
    A = 1,
    player1(Loc),
    Loc \= go,
    Location = go,
    write('Anda tidak berada di GO!'), nl.

goBuildLandmark(Location) :-
    aksi(A),
    A = 2,
    player2(Loc),
    Loc \= go,
    Location = go,
    write('Anda tidak berada di GO!'), nl.

goBuildLandmark(Location) :-
    aksi(A),
    A = 1,
    player1(Loc),
    Loc = go,
    retract(player1(Loc)),
    asserta(player1(Location)),
    akulandmark,
    retract(player1(Location)),
    asserta(player1(Loc)).

goBuildLandmark(Location) :-
    aksi(A),
    A = 2,
    player2(Loc),
    Loc = go,
    retract(player2(Loc)),
    asserta(player2(Location)),
    akulandmark,
    retract(player2(Location)),
    asserta(player2(go)).

/* Jual Properti */
jualTanah(Loc) :-
    aksi(A),
    A = 1,
    \+ cekAkuisiTanahP1(Loc).

jualTanah(Loc) :-
    aksi(A),
    A = 1,
    cekAkuisiTanahP1(Loc),
    retract(propTanahP1(Loc)),
    retract(listOfPropsP1(Loc)),
    retract(tingkatProperti(Loc,_)),
    elemenBoard(Loc,ID),
    harga_tanah(ID, Harga),
    uangP2(Money),
    uangPropP1(TotalPropP1),
    MoneyAfter is Money + Harga*0.8,
    TotAset is TotalPropP1 - Harga,
    retract(uangP2(Money)),
    asserta(uangP2(MoneyAfter)),
    retract(uangPropP1(TotalPropP1)),
    asserta(uangPropP1(TotAset)),
    write('Berhasil menjual properti'), nl.

jualTanah(Loc) :-
    aksi(A),
    A = 2,
    \+ cekAkuisiTanahP2(Loc).

jualTanah(Loc) :-
    aksi(A),
    A = 2,
    cekAkuisiTanahP2(Loc),
    retract(propTanahP2(Loc)),
    retract(listOfPropsP2(Loc)),
    retract(tingkatProperti(Loc,_)),
    elemenBoard(Loc,ID),
    harga_tanah(ID, Harga),
    uangP1(Money),
    uangPropP2(TotalPropP2),
    MoneyAfter is Money + Harga*0.8,
    TotAset is TotalPropP2 - Harga,
    retract(uangP1(Money)),
    asserta(uangP1(MoneyAfter)),
    retract(uangPropP2(TotalPropP2)),
    asserta(uangPropP2(TotAset)),
    write('Berhasil menjual properti'), nl.

jualBangunan1(Loc) :-
    aksi(A),
    A = 1,
    \+ cekAkuisiBang1P1(Loc).

jualBangunan1(Loc) :-
    aksi(A),
    A = 1,
    cekAkuisiBang1P1(Loc),
    retract(propBangunan1P1(Loc)),
    retract(listOfPropsP1(Loc)),
    retract(tingkatProperti(Loc,_)),
    elemenBoard(Loc,ID),
    harga_bangunan1(ID, Harga),
    uangP2(Money),
    uangPropP1(TotalPropP1),
    MoneyAfter is Money + Harga*0.8,
    TotAset is TotalPropP1 - Harga,
    retract(uangP2(Money)),
    asserta(uangP2(MoneyAfter)),
    retract(uangPropP1(TotalPropP1)),
    asserta(uangPropP1(TotAset)),
    write('Berhasil menjual properti'), nl.

jualBangunan1(Loc) :-
    aksi(A),
    A = 2,
    \+ cekAkuisiBang1P2(Loc).

jualBangunan1(Loc) :-
    aksi(A),
    A = 2,
    cekAkuisiBang1P2(Loc),
    retract(propBangunan1P2(Loc)),
    retract(listOfPropsP2(Loc)),
    retract(tingkatProperti(Loc,_)),
    elemenBoard(Loc,ID),
    harga_bangunan1(ID, Harga),
    uangP1(Money),
    uangPropP2(TotalPropP2),
    MoneyAfter is Money + Harga*0.8,
    TotAset is TotalPropP2 - Harga,
    retract(uangP1(Money)),
    asserta(uangP1(MoneyAfter)),
    retract(uangPropP2(TotalPropP2)),
    asserta(uangPropP2(TotAset)),
    write('Berhasil menjual properti'), nl.

jualBangunan2(Loc) :-
    aksi(A),
    A = 1,
    \+ cekAkuisiBang2P1(Loc).

jualBangunan2(Loc) :-
    aksi(A),
    A = 1,
    cekAkuisiBang2P1(Loc),
    retract(propBangunan2P1(Loc)),
    retract(listOfPropsP1(Loc)),
    retract(tingkatProperti(Loc,_)),
    elemenBoard(Loc,ID),
    harga_bangunan2(ID, Harga),
    uangP2(Money),
    uangPropP1(TotalPropP1),
    MoneyAfter is Money + Harga*0.8,
    TotAset is TotalPropP1 - Harga,
    retract(uangP2(Money)),
    asserta(uangP2(MoneyAfter)),
    retract(uangPropP1(TotalPropP1)),
    asserta(uangPropP1(TotAset)),
    write('Berhasil menjual properti'), nl.

jualBangunan2(Loc) :-
    aksi(A),
    A = 2,
    \+ cekAkuisiBang2P2(Loc).

jualBangunan2(Loc) :-
    aksi(A),
    A = 2,
    cekAkuisiBang2P2(Loc),
    retract(propBangunan2P2(Loc)),
    retract(listOfPropsP2(Loc)),
    retract(tingkatProperti(Loc,_)),
    elemenBoard(Loc,ID),
    harga_bangunan2(ID, Harga),
    uangP1(Money),
    uangPropP2(TotalPropP2),
    MoneyAfter is Money + Harga*0.8,
    TotAset is TotalPropP2 - Harga,
    retract(uangP1(Money)),
    asserta(uangP1(MoneyAfter)),
    retract(uangPropP2(TotalPropP2)),
    asserta(uangPropP2(TotAset)),
    write('Berhasil menjual properti'), nl.

jualBangunan3(Loc) :-
    aksi(A),
    A = 1,
    \+ cekAkuisiBang3P1(Loc).

jualBangunan3(Loc) :-
    aksi(A),
    A = 1,
    cekAkuisiBang3P1(Loc),
    retract(propBangunan3P1(Loc)),
    retract(listOfPropsP1(Loc)),
    retract(tingkatProperti(Loc,_)),
    elemenBoard(Loc,ID),
    harga_bangunan3(ID, Harga),
    uangP2(Money),
    uangPropP1(TotalPropP1),
    MoneyAfter is Money + Harga*0.8,
    TotAset is TotalPropP1 - Harga,
    retract(uangP2(Money)),
    asserta(uangP2(MoneyAfter)),
    retract(uangPropP1(TotalPropP1)),
    asserta(uangPropP1(TotAset)),
    write('Berhasil menjual properti'), nl.

jualBangunan3(Loc) :-
    aksi(A),
    A = 2,
    \+ cekAkuisiBang3P2(Loc).

jualBangunan3(Loc) :-
    aksi(A),
    A = 2,
    cekAkuisiBang3P2(Loc),
    retract(propBangunan3P2(Loc)),
    retract(listOfPropsP2(Loc)),
    retract(tingkatProperti(Loc,_)),
    elemenBoard(Loc,ID),
    harga_bangunan3(ID, Harga),
    uangP1(Money),
    uangPropP2(TotalPropP2),
    MoneyAfter is Money + Harga*0.8,
    TotAset is TotalPropP2 - Harga,
    retract(uangP1(Money)),
    asserta(uangP1(MoneyAfter)),
    retract(uangPropP2(TotalPropP2)),
    asserta(uangPropP2(TotAset)),
    write('Berhasil menjual properti'), nl.

jualLandmark(Loc) :-
    aksi(A),
    A = 1,
    \+ cekAkuisiLandmarkP1(Loc).

jualLandmark(Loc) :-
    aksi(A),
    A = 1,
    cekAkuisiLandmarkP1(Loc),
    retract(propLandmarkP1(Loc)),
    retract(listOfPropsP1(Loc)),
    retract(tingkatProperti(Loc,_)),
    elemenBoard(Loc,ID),
    harga_landmark(ID, Harga),
    uangP2(Money),
    uangPropP1(TotalPropP1),
    MoneyAfter is Money + Harga*0.8,
    TotAset is TotalPropP1 - Harga,
    retract(uangP2(Money)),
    asserta(uangP2(MoneyAfter)),
    retract(uangPropP1(TotalPropP1)),
    asserta(uangPropP1(TotAset)),
    write('Berhasil menjual properti'), nl.

jualLandmark(Loc) :-
    aksi(A),
    A = 2,
    \+ cekAkuisiLandmarkP2(Loc).

jualLandmark(Loc) :-
    aksi(A),
    A = 2,
    cekAkuisiLandmarkP2(Loc),
    retract(propLandmarkP2(Loc)),
    retract(listOfPropsP2(Loc)),
    retract(tingkatProperti(Loc,_)),
    elemenBoard(Loc,ID),
    harga_landmark(ID, Harga),
    uangP1(Money),
    uangPropP2(TotalPropP2),
    MoneyAfter is Money + Harga*0.8,
    TotAset is TotalPropP2 - Harga,
    retract(uangP1(Money)),
    asserta(uangP1(MoneyAfter)),
    retract(uangPropP2(TotalPropP2)),
    asserta(uangPropP2(TotAset)),
    write('Berhasil menjual properti'), nl.

jualP1(Loc) :-
    aksi(A),
    A = 1,
    write('Harga Aset milik P1'),nl,
    jualTanah(Loc),
    jualBangunan1(Loc),
    jualBangunan2(Loc),
    jualBangunan3(Loc),
    jualLandmark(Loc).

jualP2(Loc) :- 
    aksi(A),
    A = 2,
    write('Harga Aset milik P2'),nl,
    jualTanah(Loc),
    jualBangunan1(Loc),
    jualBangunan2(Loc),
    jualBangunan3(Loc),
    jualLandmark(Loc).

cekHarga(Loc):-
    tingkatProperti(Loc,Tingkat),
    (Tingkat = 'Landmark' ->
        elemenBoard(Loc,ID),
        harga_landmark(ID,HargaL),
        harga_bangunan3(ID,HargaB3),
        harga_bangunan2(ID,HargaB2),
        harga_bangunan1(ID,HargaB1),
        harga_tanah(ID,HargaT),
        Total is HargaL + HargaB3 + HargaB2 + HargaB1 + HargaT,
        write(Total)
    );
    (Tingkat = 'Bangunan 3' ->
        elemenBoard(Loc,ID),
        harga_bangunan3(ID,HargaB3),
        harga_bangunan2(ID,HargaB2),
        harga_bangunan1(ID,HargaB1),
        harga_tanah(ID,HargaT),
        Total is HargaB3 + HargaB2 + HargaB1 + HargaT,
        write(Total)
    );
    (Tingkat = 'Bangunan 2' ->
        elemenBoard(Loc,ID),
        harga_bangunan2(ID,HargaB2),
        harga_bangunan1(ID,HargaB1),
        harga_tanah(ID,HargaT),
        Total is HargaB2 + HargaB1 + HargaT,
        write(Total)
    );
    (Tingkat = 'Bangunan 1' ->
        elemenBoard(Loc,ID),
        harga_bangunan1(ID,HargaB1),
        harga_tanah(ID,HargaT),
        Total is HargaB1 + HargaT,
        write(Total)
    );
    (Tingkat = 'Tanah' ->
        elemenBoard(Loc,ID),
        harga_tanah(ID,HargaT),
        Total is HargaT,
        write(Total)
    ).

displayAset:-
    aksi(A),
    A = 1,
    forall(
        listOfPropsP1(X), (write('- '), write(X), write(', '), tingkatProperti(X,Tingkat), write(Tingkat), write(' : '), cekHarga(X), nl)
    ),nl.

displayAset:-
    aksi(A),
    A = 2,
    forall(
        listOfPropsP2(X), (write('- '), write(X), write(', '), tingkatProperti(X,Tingkat), write(Tingkat), write(' : '), cekHarga(X), nl)
    ),nl.