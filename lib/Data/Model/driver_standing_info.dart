class DriverStandingInfo {
  final String position;
  final String driverName;
  final String points;
  DriverStandingInfo({
    required this.position,
    required this.driverName,
    required this.points
  });

  factory DriverStandingInfo.fromJson(Map<String, dynamic> json) {
    return DriverStandingInfo(
      position: json['position'] ?? '',
      driverName: json['driverName'] ?? '',
      points: json['points'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'position': position,
      'driverName': driverName,
      'points' : points
    };
  }
}
