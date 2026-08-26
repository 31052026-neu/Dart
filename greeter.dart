import 'dart:io';

//--------------------------------Vorname angeben----------------------------------------//
String? vornameEingabe() {
  String? vorName = stdin.readLineSync()!;
  return textEingabePruefen(vorName, 'Wie lautet dein Vorname?');
}

//--------------------------------Nachname angeben---------------------------------------//
String? nachNameEingabe() {
  String? nachName = stdin.readLineSync()!;
  return textEingabePruefen(nachName, 'Wie lautet dein Nachname?');
}

//-------------------------------Tageszeit Begrüßung-------------------------------------//
String? tageszeitBegruessung() {
  int stunde = DateTime.now().hour;
  String begruessung;

  if (stunde < 10) {
    begruessung = 'Guten morgen';
  } else if (stunde < 18) {
    begruessung = 'Guten Tag';
  } else {
    begruessung = 'Guten abend';
  }
  return begruessung;
}

//--------------------------------Altersprüfung------------------------------------------//
String AltersPruefung(int jetzigesAlter, String geschlecht) {
  if (jetzigesAlter > 40 && geschlecht == 'maenlich') {
    return 'Herr';
  } else if (jetzigesAlter > 40 && geschlecht == 'weiblich') {
    return 'Frau';
  }

  return '';
}

//--------------------------------Alter Funktion-----------------------------------------//
int alterEingabeUser() {
  int? alter;

  while (alter == null) {
    stdout.write("Wie alt bist du? ");

    String? alterEingabe = stdin.readLineSync();

    if (alterEingabe != null) {
      alter = int.tryParse(alterEingabe);
    }
    if (alter != null) {
      if (alter < 0 || alter > 150) {
        alter = null;
      }
    }
  }
  return alter;
}

//-------------------------------Geschlechtseingabe--------------------------------------//
String geschlechtsEingabe() {
  String? geschlecht;

  while (geschlecht == null) {
    stdout.write('Welches Geschlecht hast du? ');

    geschlecht = stdin.readLineSync();
  }

  return geschlecht;
}

//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^Funktionen^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^//

//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<Fehlerprüfung>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>//
String? textEingabePruefen(String eingabe, String frage) {
  while (eingabe == null || eingabe.isEmpty) {
    stdout.write(frage);
    eingabe = stdin.readLineSync()!;
  }
  print(eingabe);
  return eingabe;
}

void main() {
  // final vorName = vornameEingabe();
  // Abfrtage der name

  final vorName = vornameEingabe();
  print(vorName);
  final nachName = nachNameEingabe();

  final alter = alterEingabeUser();
  final geschlecht = geschlechtsEingabe();

  final begruessen = tageszeitBegruessung();

  final anrede = AltersPruefung(alter, geschlecht);

  print(
    '$begruessen $anrede $vorName $nachName Du bist $alter Jahre alt und du bist $geschlecht.',
  );
}
