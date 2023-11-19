:- include('map.pl').
:- include('property.pl').
:- include('move.pl').
:- include('dadu.pl').
:- include('location.pl').
:- include('playerdetail.pl').
:- include('mekanisme.pl').
:- include('start.pl').
:- include('quit.pl').
:- include('teleport.pl').
:- include('money.pl').
:- include('cheat.pl').
:- include('turn.pl').
:- include('chancecard.pl').
:- include('jail.pl').
:- include('sewa.pl').
:- include('coinflip.pl').
:- include('bankrupt.pl').

/* Posisi Player */
:- dynamic(player1/1).
:- dynamic(player2/1).
:- dynamic(turn/1).
:- dynamic(aksi/1).
:- dynamic(count/1).
:- dynamic(prev/1).
:- dynamic(jailp1/1).
:- dynamic(jailp2/1).

/* Properti player lainnya */
:- dynamic(idPlayer/1).

/* Total Uang Masing-Masing Player */
:- dynamic(uangP1/1).
:- dynamic(uangP2/1).

/* Total Uang Properti Masing-Masing Player */
:- dynamic(uangPropP1/1).
:- dynamic(uangPropP2/1).

/* List of Props of Players */
:- dynamic(listOfPropsP1/1).
:- dynamic(listOfPropsP2/1).

:- dynamic(propTanahP1/1).
:- dynamic(propTanahP2/1).

:- dynamic(propBangunan1P1/1).
:- dynamic(propBangunan1P2/1).

:- dynamic(propBangunan2P1/1).
:- dynamic(propBangunan2P2/1).

:- dynamic(propBangunan3P1/1).
:- dynamic(propBangunan3P2/1).

:- dynamic(propLandmarkP1/1).
:- dynamic(propLandmarkP2/1).

/* List of Cards of Players */
:- dynamic(listofCardsP1/1).
:- dynamic(listofCardsP2/1).

/* Total Kartu Get Out of Jail */
:- dynamic(numGetOutOfJailP1/1).
:- dynamic(numGetOutOfJailP2/1).

retractEmptyProp :-
    listOfPropsP1([]), retract(listOfPropsP1([])).

retractEmptyProp :-
    listOfPropsP2([]), retract(listOfPropsP2([])).

retractEmptyCard :-
    aksi(T), T is 1, listofCardsP1([]), retract(listofCardsP1([])).

retractEmptyCard :-
    aksi(T), T is 2, listofCardsP2([]), retract(listofCardsP2([])).

/* Coin Flip */
:- dynamic(guessCoinFlipP1/1).
guessCoinFlipP1(3).
:- dynamic(guessCoinFlipP2/1).
guessCoinFlipP2(3).
:- dynamic(cekCoinFlipP1/1).
cekCoinFlipP1(0).
:- dynamic(cekCoinFlipP2/1).
cekCoinFlipP2(0).
:- dynamic(randomCoin/1).
randomCoin(1).

/* help */
help :-
    write('List of Commands:'), nl,
    write('start. -> Start game'), nl,
    write('quit. -> Quit game'), nl,
    write('throwDice. -> Melempar dadu'), nl,
    write('akutanah. -> Membeli tanah'), nl,
    write('akubang1. -> Membeli bangunan 1'), nl,
    write('akubang2. -> Membeli bangunan 2'), nl,
    write('akubang3. -> Membeli bangunan 3'), nl,
    write('akulandmark. -> Membeli landmark'), nl,
    write('map. -> Show the map'), nl,
    write('checkPlayerDetail(player). -> Memeriksa detail pemain'), nl,
    write('checkLocationDetail(location). -> Memeriksa detail lokasi'), nl,
    write('turn(player). -> Memeriksa giliran pemain melempar dadu'), nl,
    write('aksi(player). -> Memeriksa aksi pemain membeli bangunan'), nl,
    write('teleport(player, location). -> Memindahkan pemain ke lokasi'), nl,
    write('uangP1(uang). -> Memeriksa uang pemain 1'), nl,
    write('uangP2(uang). -> Memeriksa uang pemain 2'), nl,
    write('uangPropP1(uang). -> Memeriksa uang properti pemain 1'), nl,
    write('uangPropP2(uang). -> Memeriksa uang properti pemain 2'), nl,
    write('listOfPropsP1(list). -> Memeriksa list properti pemain 1'), nl,
    write('listOfPropsP2(list). -> Memeriksa list properti pemain 2'), nl,
    write('listofCardsP1(list). -> Memeriksa list kartu pemain 1'), nl,
    write('listofCardsP2(list). -> Memeriksa list kartu pemain 2'), nl,
    write('numGetOutOfJailP1(num). -> Memeriksa jumlah kartu get out of jail pemain 1'), nl,
    write('numGetOutOfJailP2(num). -> Memeriksa jumlah kartu get out of jail pemain 2'), nl,
    write('cf(guess). -> Memeriksa tebakan pemain 1'), nl,
    write('wt(loc). -> Menggunakan fitur world tour'), nl,
    write('useGetOutChanceCard. -> Menggunakan kartu kesempatan untuk keluar dari penjara'), nl,
    write('sewaTanah -> Membayar sewa tanah kepada lawan.'), nl,
    write('sewaBangunan1 -> Membayar sewa bangunan 1 kepada lawan.'), nl,
    write('sewaBangunan2 -> Membayar sewa bangunan 2 kepada lawan.'), nl,
    write('sewaBangunan3 -> Membayar sewa bangunan 3 kepada lawan.'), nl,
    write('sewaLandmark -> Membayar sewa landmark kepada lawan.'), nl,
    write('getOutOfJail. -> Keluar dari penjara.'), nl,
    write('taxP1. -> Membayar pajak player 1.'), nl,
    write('taxP2. -> Membayar pajak player 2.'), nl,
    write('jualP1(properti). -> Jual propreti player 1.'), nl,
    write('jualP2(properti). -> Jual propreti player 2.'), nl,
    write('goBuildBang1. -> Membangun bangunan 1 saat tiba di GO.'), nl,
    write('goBuildBang2. -> Membangun bangunan 2 saat tiba di GO.'), nl,
    write('goBuildBang3. -> Membangun bangunan 3 saat tiba di GO.'), nl,
    write('goBuildLandmark. -> Membangun landmark saat tiba di GO.'), nl.