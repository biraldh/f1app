import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/driver_standing_info.dart';

class DriverStandingData{

  Future<List<DriverStandingInfo>> getDriverStanding(year) async {
    final response = await http.get(Uri.parse('http://ergast.com/api/f1/$year/driverStandings.json'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final standingsJson = jsonData['MRData']['StandingsTable']['StandingsLists'] as List;
      List<DriverStandingInfo> driverStandings = standingsJson
          .expand((standings) => standings['DriverStandings'])
          .map((driverStanding) => DriverStandingInfo(
        position: driverStanding['position'],
        driverName:
        "${driverStanding['Driver']['givenName']} ${driverStanding['Driver']['familyName']}",
        points: driverStanding['points'],
        driverId: driverStanding['Driver']['driverId'],
      ))
          .toList();


      return driverStandings;
    } else {
      throw Exception('Failed to load driver standings');
    }
  }
}