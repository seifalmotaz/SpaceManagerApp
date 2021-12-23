import 'dart:convert';

Price priceFromMap(String str) => Price.fromMap(json.decode(str));
String priceToMap(Price data) => json.encode(data.toMap());

class Price {
  Price({
    this.id,
    this.description,
    this.rate,
    this.isDefault,
  });

  final int? id;
  final bool? description;
  final double? rate;
  final bool? isDefault;

  Price copyWith({
    int? id,
    bool? description,
    double? rate,
    bool? isDefault,
  }) =>
      Price(
        id: id ?? this.id,
        description: description ?? this.description,
        rate: rate ?? this.rate,
        isDefault: isDefault ?? this.isDefault,
      );

  factory Price.fromMap(Map<String, dynamic> json) => Price(
        id: json["id"],
        description: json["description"],
        rate: json["rate"].toDouble(),
        isDefault: json["is_default"] == 1 ? true : false,
      );

  Map<String, dynamic> toMap() => {
        "description": description,
        "rate": rate,
        "is_default": isDefault == null
            ? null
            : isDefault!
                ? 1
                : 0,
      };
}
