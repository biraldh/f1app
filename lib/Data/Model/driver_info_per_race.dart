
class DriverInfoPerRace {
  final String session;
  final String trackName;
  final String driverName;
  final String driverPosition;
  final String points;

  DriverInfoPerRace({
    required this.session,
    required this.trackName,
    required this.driverName,
    required this.driverPosition,
    required this.points,
  });

  factory DriverInfoPerRace.fromJson(Map<String, dynamic> json) {
    return DriverInfoPerRace(
      session: json['season'] ?? '',
      trackName: json['Circuit']['circuitName'] ?? '',
      driverName:
      "${json['Results'][0]['Driver']['givenName']} ${json['Results'][0]['Driver']['familyName']}",
      driverPosition: json['Results'][0]['position'] ?? '',
      points: json['date'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'season': session,
      'trackName': trackName,
      'driverName': driverName,
      'driverPosition': driverPosition,
      'dateOfRace': points,
    };
  }
}
