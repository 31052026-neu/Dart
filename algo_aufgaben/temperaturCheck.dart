import 'dart:io';

class temperatureService {
  static List<int> getTemperaturesByDays(int week, int year) {
    return [-12, -18, -9, -21, -15, -27, -11];
  }
}

void findMinTemperature(int week, int year) {
  List<int> temperatures = temperatureService.getTemperaturesByDays(week, year);

  int minTemperature = temperatures[0];
  int minDay = 0;

  for (int day = 1; day < temperatures.length; day++) {
    if (temperatures[day] < minTemperature) {
      minTemperature = temperatures[day];
      minDay = day;
    }
  }
  print('Niedrigste Temperatur: $minTemperature am Tag $minDay');
}

void main() {
  findMinTemperature(38, 2026);
}
