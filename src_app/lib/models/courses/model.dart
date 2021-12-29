import 'dart:convert';

Course courseFromMap(String str) => Course.fromMap(json.decode(str));
String courseToMap(Course data) => json.encode(data.toMap());

class Course {
  Course({
    this.id,
    this.name,
    this.rate,
    this.capacity,
  });

  final int? id;
  final String? name;
  final double? rate;
  final int? capacity;

  Course copyWith({
    int? id,
    String? name,
    double? rate,
    int? capacity,
  }) =>
      Course(
        id: id ?? this.id,
        name: name ?? this.name,
        rate: rate ?? this.rate,
        capacity: capacity ?? this.capacity,
      );

  factory Course.fromMap(Map<String, dynamic> json) => Course(
        id: json["id"],
        name: json["name"],
        rate: json["rate"]?.toDouble(),
        capacity: json["capacity"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "rate": rate,
        "capacity": capacity,
      };
}
