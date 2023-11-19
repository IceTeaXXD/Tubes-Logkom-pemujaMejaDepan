/*buat teleport harus dibikin masukan yang lengkap buat beberapa lokasi yang lebih dari satu
contoh : cc1, cc2, dll*/

teleport(X,Y):-
    player1(Loc),
    Y is 1,
    retract(player1(Loc)),
    asserta(player1(X)).

teleport(X,Y):-
    player2(Loc),
    Y is 2,
    retract(player2(Loc)),
    asserta(player2(X)).