class ConstructorStanding {
  final String position;
  final String points;
  final String constructor; // Stores only the name of the constructor

  ConstructorStanding({
    required this.position,
    required this.points,
    required this.constructor, // Now storing only the name
  });

  factory ConstructorStanding.fromJson(Map<String, dynamic> json) {
    return ConstructorStanding(
      position: json['position'].toString(),
      points: json['points'].toString(),
      constructor: json['Constructor']['name'], // Extracts only the name
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'position': position,
      'points': points,
      'constructor': constructor,
    };
  }
}
