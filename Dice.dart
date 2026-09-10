import 'dart:io';
import 'dart:math';

//--------------------------Eingabe der Zahl-------------------------------------//
int anzahlWuerfeEingaben() {
  stdout.write('Wie viele Würfe sollen maximal durchgeführt werden? ');

  String? eingabe = stdin.readLineSync();
  int? anzahlWuerfe = int.tryParse(eingabe ?? '');

  while (anzahlWuerfe == null || anzahlWuerfe <= 0) {
    print('Ungültige Eingabe.');

    stdout.write('Wie viele Würfe sollen maximal durchgeführt werden? ');
    eingabe = stdin.readLineSync();
    anzahlWuerfe = int.tryParse(eingabe ?? '');
  }

  return anzahlWuerfe;
}

//---------------------------Random Zahl------------------------------------------//
int wuerfeln() {
  Random zufall = Random();
  int wurf = zufall.nextInt(6) + 1;
  return wurf;
}

//--------------------------Zahl speichern in der Liste--------------------------//
List<int> mehrfachWuerfeln(int anzahlWuerfe) {
  List<int> wuerfelErgebnisse = [];
  int zaehler = 0;

  while (zaehler < anzahlWuerfe) {
    int ergebnis = wuerfeln();

    wuerfelErgebnisse.add(ergebnis);

    zaehler++;

    if (zweiSechsenHintereinander(wuerfelErgebnisse)) {
      break;
    }
  }
  return wuerfelErgebnisse;
}

//---------------------------Zwei Sechsen Hintereinander------------------------//
bool zweiSechsenHintereinander(List<int> wuerfelErgebnisse) {
  if (wuerfelErgebnisse.length < 2) {
    return false;
  }

  int letzterWurf = wuerfelErgebnisse[wuerfelErgebnisse.length - 1];

  int vorletzterWurf = wuerfelErgebnisse[wuerfelErgebnisse.length - 2];

  return letzterWurf == 6 && vorletzterWurf == 6;
}

//--------------------------Ergebnisausgabe----------------------------------//
void ergebnisAusgabe(List<int> wuerfelErgebnisse, int limit) {
  if (zweiSechsenHintereinander(wuerfelErgebnisse)) {
    print(
      'Der Computer brauchte ${wuerfelErgebnisse.length} Würfe für zwei Sechsen hintereinander.',
    );
  } else {
    print('Limit von $limit Würfen erreicht.');
  }
  print('Alle Wurfergebnisse: $wuerfelErgebnisse');
}

void main() {
  int anzahlWuerfe = anzahlWuerfeEingaben();

  List<int> wuerfelErgebnisse = mehrfachWuerfeln(anzahlWuerfe);

  ergebnisAusgabe(wuerfelErgebnisse, anzahlWuerfe);
}
