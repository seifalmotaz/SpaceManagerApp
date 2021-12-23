import 'dart:convert';

Room roomFromMap(String str) => Room.fromMap(json.decode(str));
String roomToMap(Room data) => json.encode(data.toMap());

class Room {
  Room({
    this.id,
    this.name,
    this.capacity,
    this.rate,
  });

  final int? id;
  final String? name;
  final int? capacity;
  final double? rate;

  Room copyWith({
    int? id,
    String? name,
    int? capacity,
    double? rate,
  }) =>
      Room(
        id: id ?? this.id,
        name: name ?? this.name,
        capacity: capacity ?? this.capacity,
        rate: rate ?? this.rate,
      );

  factory Room.fromMap(Map<String, dynamic> json) => Room(
        id: json["id"],
        name: json["name"],
        capacity: json["capacity"],
        rate: json["rate"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "capacity": capacity,
        "rate": rate,
      };
}
