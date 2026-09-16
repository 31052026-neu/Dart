//-------------------------------Datum erkennen---------------------------------//
DateTime datum() {
  DateTime datumHeute = DateTime.now();
  return datumHeute;
}

//-----------------------------Wochentag im Monat-------------------------------//
int wochentagNummer(DateTime datum) {
  int tagDesMonats = datum.day;
  int nummer = ((tagDesMonats - 1) ~/ 7) + 1;

  return nummer;
}

//------------------------------Wochentag als Text------------------------------//
String wochentagNummerAlsText(int nummer) {
  List<String> nummerAlsText = [
    'erste',
    'zweite',
    'dritte',
    'vierte',
    'fünfte',
  ];
  return nummerAlsText[nummer - 1];
}

//-------------------------------Datum ausgabe----------------------------------//
void datumAusgeben(DateTime heute, String wochenTagText) {
  List<String> wochenTag = [
    'Montag',
    'Dienstag',
    'Mittwoch',
    'Donnerstag',
    'Freitag',
    'Samstag',
    'Sonntag',
  ];

  List<String> monatsName = [
    'Januar',
    'Februar',
    'März',
    'April',
    'Mai',
    'Juni',
    'Juli',
    'August',
    'September',
    'Oktober',
    'November',
    'Dezember',
  ];
  print(
    'Heute ist ${wochenTag[heute.weekday - 1]}, der ${heute.day}. ${monatsName[heute.month - 1]} ${heute.year}. Es ist der $wochenTagText ${wochenTag[heute.weekday - 1]} im Monat',
  );
}

//--------------------------------Tage im Monat------------------------------------//
int tageImMonat(DateTime datum) {
  DateTime letzterTag = DateTime(datum.year, datum.month + 1, 0);
  return letzterTag.day;
}

//---------------------------Erster Wochentag im Monat-------------------------------//
int ersterWochentagImMonat(DateTime datum) {
  DateTime ersterTag = DateTime(datum.year, datum.month, 1);

  return ersterTag.weekday;
}

//-----------------------------Kalenderfelder erstellen-------------------------------//
List<int?> kalenderFelderErstellen(DateTime datum) {
  List<int?> kalenderFelder = [];

  int leereFelder = ersterWochentagImMonat(datum) - 1;
  int anzahlTage = tageImMonat(datum);
  int gesamtFelder = leereFelder + anzahlTage;

  // zählt alle Kalendertage bzw. Felder für den Monat)
  for (int i = 0; i < gesamtFelder; ++i) {
    // fügt einen leeren platz hinzu solange i kleiner als leereFelder ist//
    if (i < leereFelder) {
      kalenderFelder.add(null);
    }
    //Die Rechnung entfernt also zuerst die Verschiebung durch die Leerfelder
    //und wandelt danach den bei
    // 0 beginnenden Listenindex in einen bei 1 beginnenden Kalendertag um.
    else {
      int tag = i - leereFelder + 1;
      kalenderFelder.add(tag);
    }
  }

  return kalenderFelder;
}

void main() {
  final datumNow = datum();

  final nummer = wochentagNummer(datumNow);
  final wochenTagText = wochentagNummerAlsText(nummer);
  final anzahlTage = tageImMonat(datumNow);
  final ersterWochenTag = ersterWochentagImMonat(datumNow);
  final leereFelder = ersterWochenTag - 1;
  final kalenderFelder = kalenderFelderErstellen(datumNow);

  datumAusgeben(datumNow, wochenTagText);
}
