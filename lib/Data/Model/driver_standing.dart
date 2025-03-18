class Standing {
  final String xmlns;
  final String series;
  final String limit;
  final String offset;
  final String total;
  final List<StandingsTable> standingsTable;

  Standing({
    required this.xmlns,
    required this.series,
    required this.limit,
    required this.offset,
    required this.total,
    required this.standingsTable,
  });

  factory Standing.fromJson(Map<String, dynamic> json) {
    var standingsTableJson = json['StandingsTable'] as List;
    List<StandingsTable> standingsTableList =
    standingsTableJson.map((e) => StandingsTable.fromJson(e)).toList();

    return Standing(
      xmlns: json['xmlns'],
      series: json['series'],
      limit: json['limit'],
      offset: json['offset'],
      total: json['total'],
      standingsTable: standingsTableList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'xmlns': xmlns,
      'series': series,
      'limit': limit,
      'offset': offset,
      'total': total,
      'StandingsTable': standingsTable.map((e) => e.toJson()).toList(),
    };
  }
}

class StandingsTable {
  final String season;
  final List<StandingsList> standingsLists;

  StandingsTable({
    required this.season,
    required this.standingsLists,
  });

  factory StandingsTable.fromJson(Map<String, dynamic> json) {
    var standingsListsJson = json['StandingsLists'] as List;
    List<StandingsList> standingsList =
    standingsListsJson.map((e) => StandingsList.fromJson(e)).toList();

    return StandingsTable(
      season: json['season'],
      standingsLists: standingsList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'season': season,
      'StandingsLists': standingsLists.map((e) => e.toJson()).toList(),
    };
  }
}

class StandingsList {
  final String season;
  final String round;
  final List<DriverStanding> driverStandings;

  StandingsList({
    required this.season,
    required this.round,
    required this.driverStandings,
  });

  factory StandingsList.fromJson(Map<String, dynamic> json) {
    var driverStandingsJson = json['DriverStandings'] as List;
    List<DriverStanding> driverStandings =
    driverStandingsJson.map((e) => DriverStanding.fromJson(e)).toList();

    return StandingsList(
      season: json['season'],
      round: json['round'],
      driverStandings: driverStandings,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'season': season,
      'round': round,
      'DriverStandings': driverStandings.map((e) => e.toJson()).toList(),
    };
  }
}

class DriverStanding {
  final String position;
  final String positionText;
  final String points;
  final String wins;
  final Driver driver;
  final List<Constructor> constructors;

  DriverStanding({
    required this.position,
    required this.positionText,
    required this.points,
    required this.wins,
    required this.driver,
    required this.constructors,
  });

  factory DriverStanding.fromJson(Map<String, dynamic> json) {
    var constructorsJson = json['Constructors'] as List;
    List<Constructor> constructors =
    constructorsJson.map((e) => Constructor.fromJson(e)).toList();

    return DriverStanding(
      position: json['position'],
      positionText: json['positionText'],
      points: json['points'],
      wins: json['wins'],
      driver: Driver.fromJson(json['Driver']),
      constructors: constructors,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'position': position,
      'positionText': positionText,
      'points': points,
      'wins': wins,
      'Driver': driver.toJson(),
      'Constructors': constructors.map((e) => e.toJson()).toList(),
    };
  }
}

class Driver {
  final String driverId;
  final String permanentNumber;
  final String code;
  final String url;
  final String givenName;
  final String familyName;
  final String dateOfBirth;
  final String nationality;

  Driver({
    required this.driverId,
    required this.permanentNumber,
    required this.code,
    required this.url,
    required this.givenName,
    required this.familyName,
    required this.dateOfBirth,
    required this.nationality,
  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      driverId: json['driverId'],
      permanentNumber: json['permanentNumber'],
      code: json['code'],
      url: json['url'],
      givenName: json['givenName'],
      familyName: json['familyName'],
      dateOfBirth: json['dateOfBirth'],
      nationality: json['nationality'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'driverId': driverId,
      'permanentNumber': permanentNumber,
      'code': code,
      'url': url,
      'givenName': givenName,
      'familyName': familyName,
      'dateOfBirth': dateOfBirth,
      'nationality': nationality,
    };
  }
}

class Constructor {
  final String constructorId;
  final String url;
  final String name;
  final String nationality;

  Constructor({
    required this.constructorId,
    required this.url,
    required this.name,
    required this.nationality,
  });

  factory Constructor.fromJson(Map<String, dynamic> json) {
    return Constructor(
      constructorId: json['constructorId'],
      url: json['url'],
      name: json['name'],
      nationality: json['nationality'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'constructorId': constructorId,
      'url': url,
      'name': name,
      'nationality': nationality,
    };
  }
}
