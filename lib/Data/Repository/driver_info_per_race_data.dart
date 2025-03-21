
import 'dart:convert';
import 'dart:core';

import 'package:http/http.dart' as http;

import '../Model/driver_info_per_race.dart';

class DriverInfoPerRaceData{
  Future<List<DriverInfoPerRace>> getDriverInfo(driverId,year) async {
    final response = await http.get(Uri.parse('http://ergast.com/api/f1/$year/drivers/$driverId/results.json'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final List races = jsonData['MRData']['RaceTable']['Races'];

      List<DriverInfoPerRace> driverInfo = races.map((race) {
        final results = race['Results'][0];

        return DriverInfoPerRace(
          session: race['season'],
          trackName: race['raceName'],
          driverName: "${results['Driver']['givenName']} ${results['Driver']['familyName']}",
          driverPosition: results['position'],
          points: results['points']
        );
      }).toList();

      return driverInfo;
    } else {
      throw Exception('Error fetching data');
    }
  }

}