class DriverStandingInfo {
  final String position;
  final String driverName;
  final String points;
  final String driverId;
  DriverStandingInfo({
    required this.position,
    required this.driverName,
    required this.points,
    required this.driverId
  });

  factory DriverStandingInfo.fromJson(Map<String, dynamic> json) {
    return DriverStandingInfo(
      position: json['position'] ?? '',
      driverName: json['driverName'] ?? '',
      points: json['points'] ?? '',
      driverId: json['driverId'] ?? ''
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'position': position,
      'driverName': driverName,
      'points' : points,
      'driverId' : driverId
    };
  }
}
