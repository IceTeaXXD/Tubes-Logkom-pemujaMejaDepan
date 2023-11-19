% Property Values
:- dynamic(propertyA1/1).
propertyA1('  ').
:- dynamic(propertyA2/1).
propertyA2('  ').
:- dynamic(propertyA3/1).
propertyA3('  ').
:- dynamic(propertyB1/1).
propertyB1('  ').
:- dynamic(propertyB2/1).
propertyB2('  ').
:- dynamic(propertyB3/1).
propertyB3('  ').
:- dynamic(propertyC1/1).
propertyC1('  ').
:- dynamic(propertyC2/1).
propertyC2('  ').
:- dynamic(propertyC3/1).
propertyC3('  ').
:- dynamic(propertyD1/1).
propertyD1('  ').
:- dynamic(propertyD2/1).
propertyD2('  ').
:- dynamic(propertyD3/1).
propertyD3('  ').
:- dynamic(propertyE1/1).
propertyE1('  ').
:- dynamic(propertyE2/1).
propertyE2('  ').
:- dynamic(propertyE3/1).
propertyE3('  ').
:- dynamic(propertyF1/1).
propertyF1('  ').
:- dynamic(propertyF2/1).
propertyF2('  ').
:- dynamic(propertyF3/1).
propertyF3('  ').
:- dynamic(propertyG1/1).
propertyG1('  ').
:- dynamic(propertyG2/1).
propertyG2('  ').
:- dynamic(propertyG3/1).
propertyG3('  ').
:- dynamic(propertyH1/1).
propertyH1('  ').
:- dynamic(propertyH2/1).
propertyH2('  ').

map :-
    propertyA1(A1), propertyA2(A2), propertyA3(A3), propertyB1(B1), propertyB2(B2), propertyB3(B3), propertyC1(C1), propertyC2(C2), propertyC3(C3), propertyD1(D1), propertyD2(D2), propertyD3(D3), propertyE1(E1), propertyE2(E2), propertyE3(E3), propertyF1(F1), propertyF2(F2), propertyF3(F3), propertyG1(G1), propertyG2(G2), propertyG3(G3), propertyH1(H1), propertyH2(H2),
    write('            '), write(E1), write('   '), write(E2), write('   '), write(E3), write('        '), write(F1), write('   '), write(F2), write('   '), write(F3), nl,
    write('     ----------------------------------------------'), nl,
    write('     | FP | E1 | E2 | E3 | CC | F1 | F2 | F3 | WT |'), nl,
    write('  '),write(D3),write(' | D3 |----------------------------------| G1 | '),write(G1), nl,
    write('  '),write(D2),write(' | D2 |                                  | G2 | '),write(G2), nl,
    write('  '),write(D1),write(' | D1 |                                  | G3 | '),write(G3), nl,
    write('     | TX |          M O N O P O L Y         | FC |'), nl,
    write('  '),write(C3),write(' | C3 |                                  | CC | '), nl,
    write('  '),write(C2),write(' | C2 |                                  | H1 | '),write(H1), nl,
    write('  '),write(C1),write(' | C1 |----------------------------------| H2 | '),write(H2), nl,
    write('     | JL | B3 | B2 | B1 | CC | A3 | A2 | A1 | GO |'), nl,
    write('     ----------------------------------------------'), nl,
    write('            '), write(B3), write('   '), write(B2), write('   '), write(B1), write('        '), write(A3), write('   '), write(A2), write('   '), write(A1), nl, nl,
    write('     Posisi pemain:'), nl,
    player1(P1),display1(P1),
    player2(P2),display2(P2).

display1(tx1):- write('          Q = tx'),nl.
display1(fc):- write('          Q = fc'),nl.
display1(cc1):- write('          Q = cc'),nl.
display1(cc2):- write('          Q = cc'),nl.
display1(cc3):- write('          Q = cc'),nl.
display1(P1):- write('          Q = '),write(P1),nl.
display2(tx1):- write('          R = tx'),nl.
display2(fc):- write('          R = fc'),nl.
display2(cc1):- write('          R = cc'),nl.
display2(cc2):- write('          R = cc'),nl.
display2(cc3):- write('          R = cc'),nl.
display2(P2):- write('          R = '),write(P2),nl.

writeProperty(Loc, BoardProp) :-
    (Loc = a1 ->
        propertyA1(X),
        % Update property
        retract(propertyA1(X)),
        asserta(propertyA1(BoardProp)));
    (Loc = a2 ->
        propertyA2(X),
        % Update property
        retract(propertyA2(X)),
        asserta(propertyA2(BoardProp)));
    (Loc = a3 ->
        propertyA3(X),
        % Update property
        retract(propertyA3(X)),
        asserta(propertyA3(BoardProp)));
    (Loc = b1 ->
        propertyB1(X),
        % Update property
        retract(propertyB1(X)),
        asserta(propertyB1(BoardProp)));
    (Loc = b2 ->
        propertyB2(X),
        % Update property
        retract(propertyB2(X)),
        asserta(propertyB2(BoardProp)));
    (Loc = b3 ->
        propertyB3(X),
        % Update property
        retract(propertyB3(X)),
        asserta(propertyB3(BoardProp)));
    (Loc = c1 ->
        propertyC1(X),
        % Update property
        retract(propertyC1(X)),
        asserta(propertyC1(BoardProp)));
    (Loc = c2 ->
        propertyC2(X),
        % Update property
        retract(propertyC2(X)),
        asserta(propertyC2(BoardProp)));
    (Loc = c3 ->
        propertyC3(X),
        % Update property
        retract(propertyC3(X)),
        asserta(propertyC3(BoardProp)));
    (Loc = d1 ->
        propertyD1(X),
        % Update property
        retract(propertyD1(X)),
        asserta(propertyD1(BoardProp)));
    (Loc = d2 ->
        propertyD2(X),
        % Update property
        retract(propertyD2(X)),
        asserta(propertyD2(BoardProp)));
    (Loc = d3 ->
        propertyD3(X),
        % Update property
        retract(propertyD3(X)),
        asserta(propertyD3(BoardProp)));
    (Loc = e1 ->
        propertyE1(X),
        % Update property
        retract(propertyE1(X)),
        asserta(propertyE1(BoardProp)));
    (Loc = e2 ->
        propertyE2(X),
        % Update property
        retract(propertyE2(X)),
        asserta(propertyE2(BoardProp)));
    (Loc = e3 ->
        propertyE3(X),
        % Update property
        retract(propertyE3(X)),
        asserta(propertyE3(BoardProp)));
    (Loc = f1 ->
        propertyF1(X),
        % Update property
        retract(propertyF1(X)),
        asserta(propertyF1(BoardProp)));
    (Loc = f2 ->
        propertyF2(X),
        % Update property
        retract(propertyF2(X)),
        asserta(propertyF2(BoardProp)));
    (Loc = f3 ->
        propertyF3(X),
        % Update property
        retract(propertyF3(X)),
        asserta(propertyF3(BoardProp)));
    (Loc = g1 ->
        propertyG1(X),
        % Update property
        retract(propertyG1(X)),
        asserta(propertyG1(BoardProp)));
    (Loc = g2 ->
        propertyG2(X),
        % Update property
        retract(propertyG2(X)),
        asserta(propertyG2(BoardProp)));
    (Loc = g3 ->
        propertyG3(X),
        % Update property
        retract(propertyG3(X)),
        asserta(propertyG3(BoardProp)));
    (Loc = h1 ->
        propertyH1(X),
        % Update property
        retract(propertyH1(X)),
        asserta(propertyH1(BoardProp)));
    (Loc = h2 ->
        propertyH2(X),
        % Update property
        retract(propertyH2(X)),
        asserta(propertyH2(BoardProp))).