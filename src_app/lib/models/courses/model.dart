import 'dart:convert';

Course courseFromMap(String str) => Course.fromMap(json.decode(str));
String courseToMap(Course data) => json.encode(data.toMap());

class Course {
  Course({
    this.id,
    this.name,
    this.rate,
  });

  final int? id;
  final String? name;
  final double? rate;

  Course copyWith({
    int? id,
    String? name,
    double? rate,
  }) =>
      Course(
        id: id ?? this.id,
        name: name ?? this.name,
        rate: rate ?? this.rate,
      );

  factory Course.fromMap(Map<String, dynamic> json) => Course(
        id: json["id"],
        name: json["name"],
        rate: json["rate"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "rate": rate,
      };
}
