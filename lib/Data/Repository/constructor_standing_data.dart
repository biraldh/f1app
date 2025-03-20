import 'dart:convert';

import '../Model/constructor_standing.dart';
import 'package:http/http.dart' as http;

class ConstructorStandingData{
  Future<List<ConstructorStanding>> getConstructorStanding(year) async {
    final response = await http.get(Uri.parse('http://ergast.com/api/f1/$year/constructorStandings.json'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);

      List<dynamic> standingsList = jsonData['MRData']['StandingsTable']['StandingsLists'][0]['ConstructorStandings'];
      List<ConstructorStanding> constructorStandings = standingsList.map((json) => ConstructorStanding.fromJson(json)).toList();
      return constructorStandings;

    } else {
      throw Exception('Failed to load constructor standings');
    }
  }

}