import 'dart:io';

void main() {
  print("wie lautet dein Vorname?");
  String? vorname = stdin.readLineSync();

  print("Wie lautet dein Nachname?");
  String? Nachname = stdin.readLineSync();

  print("Wie alt bist du?");
  int? alter = int.tryParse();

  print("Welches Geschlecht hast du?");
  String? geschlecht = stdin.readLineSync();
}
