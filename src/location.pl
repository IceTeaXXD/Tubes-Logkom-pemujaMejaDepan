% Untuk Property
checkLocationDetail(X) :-
    elemenBoard(X,ID),
    write('Nama Lokasi         : '), nama_properti(ID, Nama), write(Nama), nl,
    write('Deskripsi Lokasi    : '), deskripsi_properti(ID, Deskripsi), write(Deskripsi), nl, nl,
    write('Kepemilikan         : '), kepemilikan(X, Kepemilikan), write(Kepemilikan), nl,
    write('Biaya Sewa Saat Ini : '), /*biayaSewa(ID, BiayaSewa), write(BiayaSewa),*/ nl,
    write('Biaya Akuisisi      : '), /*biayaAkuisisi(ID, BiayaAkuisisi), write(BiayaAkuisisi),*/ nl,
    write('Tingkatan Properti  : '), tingkatProperti(X, TingkatProperti), write(TingkatProperti), nl.

checkLocationDetail(X) :-
    X = wt,
    write('Nama Lokasi       : World Tour'), nl,
    write('Deskripsi Lokasi  : Anda dapat berpindah kemana saja, tentunya dengan membayar uang sebesar X% aset Anda.'), nl.

checkLocationDetail(X) :-
    X = cc,
    write('Nama Lokasi       : Chance Card'), nl,
    write('Deskripsi Lokasi  : Apakah Anda sedang merasa beruntung? Disinilah tempatnya! Anda berhak mendapatkan salah satu dari kartu berikut :'), nl,
    write('1. Deskripsi kartu 1'), nl,
    write('2. Deskripsi kartu 2'), nl,
    write('3. Deskripsi kartu 3'), nl,
    write('...'), nl.

checkLocationDetail(X) :-
    X = tx,
    write('Nama Lokasi       : Tax'), nl,
    write('Deskripsi Lokasi  : Anda harus membayar pajak sebesar 10% dari aset Anda.'), nl.

checkLocationDetail(X) :-
    X = go,
    write('Nama Lokasi       : Go'), nl,
    write('Deskripsi Lokasi  : Anda mendapatkan uang sebesar X.'), nl.

checkLocationDetail(X) :-
    X = jl,
    write('Nama Lokasi       : Jail'), nl,
    write('Deskripsi Lokasi  : Ini deskripsi penjara.'), nl.

checkLocationDetail(X) :-
    X = fp,
    write('Nama Lokasi       : Free Parking'), nl,
    write('Deskripsi Lokasi  : Ini deskripsi free parking.'), nl.

checkLocationDetail(X) :-
    write(X), write(' bukan merupakan lokasi yang valid! Silahkan masukkan lokasi yang tepat.'), nl.

/* Rule Kepemilikan*/
:- dynamic(kepemilikan/2).
kepemilikan(a1, 'Belum Diakuisisi').
kepemilikan(a2, 'Belum Diakuisisi').
kepemilikan(a3, 'Belum Diakuisisi').
kepemilikan(b1, 'Belum Diakuisisi').
kepemilikan(b2, 'Belum Diakuisisi').
kepemilikan(b3, 'Belum Diakuisisi').
kepemilikan(c1, 'Belum Diakuisisi').
kepemilikan(c2, 'Belum Diakuisisi').
kepemilikan(c3, 'Belum Diakuisisi').
kepemilikan(d1, 'Belum Diakuisisi').
kepemilikan(d2, 'Belum Diakuisisi').
kepemilikan(d3, 'Belum Diakuisisi').
kepemilikan(e1, 'Belum Diakuisisi').
kepemilikan(e2, 'Belum Diakuisisi').
kepemilikan(e3, 'Belum Diakuisisi').
kepemilikan(f1, 'Belum Diakuisisi').
kepemilikan(f2, 'Belum Diakuisisi').
kepemilikan(f3, 'Belum Diakuisisi').
kepemilikan(g1, 'Belum Diakuisisi').
kepemilikan(g2, 'Belum Diakuisisi').
kepemilikan(g3, 'Belum Diakuisisi').
kepemilikan(h1, 'Belum Diakuisisi').
kepemilikan(h2, 'Belum Diakuisisi').

/* Rule Tingkat Properti*/
:- dynamic(tingkatProperti/2).
tingkatProperti(a1, 'Belum Dibangun').
tingkatProperti(a2, 'Belum Dibangun').
tingkatProperti(a3, 'Belum Dibangun').
tingkatProperti(b1, 'Belum Dibangun').
tingkatProperti(b2, 'Belum Dibangun').
tingkatProperti(b3, 'Belum Dibangun').
tingkatProperti(c1, 'Belum Dibangun').
tingkatProperti(c2, 'Belum Dibangun').
tingkatProperti(c3, 'Belum Dibangun').
tingkatProperti(d1, 'Belum Dibangun').
tingkatProperti(d2, 'Belum Dibangun').
tingkatProperti(d3, 'Belum Dibangun').
tingkatProperti(e1, 'Belum Dibangun').
tingkatProperti(e2, 'Belum Dibangun').
tingkatProperti(e3, 'Belum Dibangun').
tingkatProperti(f1, 'Belum Dibangun').
tingkatProperti(f2, 'Belum Dibangun').
tingkatProperti(f3, 'Belum Dibangun').
tingkatProperti(g1, 'Belum Dibangun').
tingkatProperti(g2, 'Belum Dibangun').
tingkatProperti(g3, 'Belum Dibangun').
tingkatProperti(h1, 'Belum Dibangun').
tingkatProperti(h2, 'Belum Dibangun').

/* Rule biaya sewa */
:-dynamic(biayaSewa/2).
biayaSewa(a1, 0).
biayaSewa(a2, 0).
biayaSewa(a3, 0).
biayaSewa(b1, 0).
biayaSewa(b2, 0).
biayaSewa(b3, 0).
biayaSewa(c1, 0).
biayaSewa(c2, 0).
biayaSewa(c3, 0).
biayaSewa(d1, 0).
biayaSewa(d2, 0).
biayaSewa(d3, 0).
biayaSewa(e1, 0).
biayaSewa(e2, 0).
biayaSewa(e3, 0).
biayaSewa(f1, 0).
biayaSewa(f2, 0).
biayaSewa(f3, 0).
biayaSewa(g1, 0).
biayaSewa(g2, 0).
biayaSewa(g3, 0).
biayaSewa(h1, 0).
biayaSewa(h2, 0).

/* Rule biaya sewa */
:-dynamic(biayaAkuisisi/2).
biayaAkuisisi(a1, 0).
biayaAkuisisi(a2, 0).
biayaAkuisisi(a3, 0).
biayaAkuisisi(b1, 0).
biayaAkuisisi(b2, 0).
biayaAkuisisi(b3, 0).
biayaAkuisisi(c1, 0).
biayaAkuisisi(c2, 0).
biayaAkuisisi(c3, 0).
biayaAkuisisi(d1, 0).
biayaAkuisisi(d2, 0).
biayaAkuisisi(d3, 0).
biayaAkuisisi(e1, 0).
biayaAkuisisi(e2, 0).
biayaAkuisisi(e3, 0).
biayaAkuisisi(f1, 0).
biayaAkuisisi(f2, 0).
biayaAkuisisi(f3, 0).
biayaAkuisisi(g1, 0).
biayaAkuisisi(g2, 0).
biayaAkuisisi(g3, 0).
biayaAkuisisi(h1, 0).
biayaAkuisisi(h2, 0).