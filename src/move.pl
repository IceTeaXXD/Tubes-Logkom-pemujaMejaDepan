/* Filename: move.pl */
/* Deskripsi: Fact dan rule gerakan pada peta */

/* Facts */
/* suksesor(x,y) artinya setelah y adalah x */
/* ADA MASALAH DENGAN NAMA VARIABEL YANG SAMA YAITU tx,cc 
   harus dibuat rule tambahan kalau ketemu cc dan tx */
suksesor(a1,go).
suksesor(a2,a1).
suksesor(a3,a2).
suksesor(cc1,a3).
suksesor(b1,cc1).
suksesor(b2,b1).
suksesor(b3,b2).
suksesor(jl,b3).
suksesor(c1,jl).
suksesor(c2,c1).
suksesor(c3,c2).
suksesor(tx1,c3).
suksesor(d1,tx1).
suksesor(d2,d1).
suksesor(d3,d2).
suksesor(fp,d3).
suksesor(e1,fp).
suksesor(e2,e1).
suksesor(e3,e2).
suksesor(cc2,e3).
suksesor(f1,cc2).
suksesor(f2,f1).
suksesor(f3,f2).
suksesor(wt,f3).
suksesor(g1,wt).
suksesor(g2,g1).
suksesor(g3,g2).
suksesor(fc,g3).
suksesor(cc3,fc).
suksesor(h1,cc3).
suksesor(h2,h1).
suksesor(go,h2).

/* Rules */
/* moveX(A,X,B) artinya dari titik A, bergerak sebanyak X kali, selesai di titik B */
moveX(A,0,A).
moveX(A,X,B) :- suksesor(Y,A), X>0, X1 is X-1, moveX(Y,X1,B).

/*Cek apakah setelah perpindahan melalui titik Go*/
/*Apabila melalui go maka C akan bernilai 1, C akan bernilai 0 apabila tidak melalui go*/
checkGo(go,_,1):-!.
checkGo(_,0,0) :-!.
checkGo(A,X,B) :- suksesor(Y,A), X>0, X1 is X-1, checkGo(Y,X1,B).

/*Jika O = 1 maka player melalui lokasi "Go" sehingga terjadi penambahan uang*/
/*distance(go,0):-!.
distance(A,X):- suksesor(Y,A),X1 is X+1, distance(Y,X1),\+ A = go.*/
 
/*jarak dari lokasi ke kotak go */
distance(g1,1).
distance(g2,2).
distance(g3,3).
distance(fc,4).
distance(cc3,5).
distance(h1,6).
distance(h2,7).
distance(go,8).
distance(a1,9).
distance(a2,10).
distance(a3,11).
distance(cc1,12).
distance(b1,13).
distance(b2,14).
distance(b3,15).
distance(jl,16).
distance(d1,17).
distance(d2,18).
distance(d3,19).
distance(fp,20).
distance(e1,21).
distance(e2,22).
distance(e3,23).
distance(cc2,24).
distance(f1,25).
distance(f2,26).
distance(f3,27).
distance(wt,28).