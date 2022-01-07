import 'package:database_system/generators/src/engine_sql.dart';
import 'package:database_system/models/func.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
class Session with _$Session {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Session({
    int? id,
    // pricing data
    int? guestId,
    int? priceId,
    double? paidAmount,
    // extra info
    int? guestCount,
    // main data
    @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
        DateTime? timeIn,
    @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
        DateTime? timeOut,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}

@EngineSQL('session')
class SessionFields {
  String? id;
  String? guestId;
  String? priceId;
  String? paidAmount;
  String? guestCount;
  String? timeIn;
  String? timeOut;
}
