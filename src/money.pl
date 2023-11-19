/*Segala yang berkaitan dengan uang ditaruh disini ye*/

/*Tambah uang saat melalui go*/
/*
Ketika 1 maka melalui go dan uang bertambah 5000
Ketika 0 maka tidak melalui go dan uang tidak bertambah
*/
incGo(1,5000):-!.
incGo(0,0):-!.