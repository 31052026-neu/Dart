import 'dart:io';

//------------------------------Maximal Zahl--------------------------------//
int maximalZahl() {
  stdout.write('Bis zu welcher Zahl sollen Primzahlen gesucht werden? ');

  String? eingabe = stdin.readLineSync();

  int? maxZahl = int.tryParse(eingabe ?? '');

  while (maxZahl == null || maxZahl < 2) {
    print('Ungültige Eingabe. Bitte gib eine Zahl ab 2 ein. ');

    stdout.write('Bis zu welcher Zahl sollen Primzahlen gesucht werden? ');

    eingabe = stdin.readLineSync();

    maxZahl = int.tryParse(eingabe ?? '');
  }
  return maxZahl;
}

//-------------------------------Teilbarkeit--------------------------------//
bool istPrimzahl(int zahl) {
  int anzahlTeiler = 0;

  for (int teiler = 1; teiler <= zahl; teiler++) {
    if (zahl % teiler == 0) {
      anzahlTeiler++;
    }
  }
  return anzahlTeiler == 2;
}
//-----------------------------Primzahlen Sammeln----------------------------//

List<int> primzahlenSammeln(int maxZahl) {
  List<int> primzahlen = [];

  for (int zahl = 2; zahl <= maxZahl; zahl++) {
    if (istPrimzahl(zahl)) {
      print(zahl);
    }
  }
  return primzahlen;
}

void main() {
  int maxZahl = maximalZahl();

  List<int> primzahlen = primzahlenSammeln(maxZahl);

  print('Die Maximal Zahl ist : $maxZahl');
  print('$primzahlen');
}
