import 'package:engine_sql_annotation/engine_sql_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sqflite_common/sqlite_api.dart';

import '../func.dart';
part 'bill.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
@EngineSQL(name: 'bill')
class Bill {
  @FieldSQL(primary: true)
  final int id;
  int takedCount;
  int guestId;
  int itemId;

  @dateNullTimeKey
  @FieldSQL(haveDefault: true)
  DateTime? createdDate;

  Bill({
    required this.id,
    required this.guestId,
    required this.takedCount,
    required this.itemId,
    this.createdDate,
  });

  factory Bill.fromJson(Map<String, dynamic> json) => _$BillFromJson(json);
  Map<String, dynamic> toJson() => _$BillToJson(this);
}
