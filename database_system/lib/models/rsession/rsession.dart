import 'package:database_system/generators/src/engine_sql.dart';
import 'package:database_system/models/func.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rsession.freezed.dart';
part 'rsession.g.dart';

@freezed
class RSession with _$RSession {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory RSession({
    int? id,
    // pricing data
    int? guestId,
    int? roomId,
    double? paidAmount,
    // main data
    @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
        DateTime? timeIn,
    @JsonKey(fromJson: DataCompiler.fromDBDate, toJson: DataCompiler.toDBDate)
        DateTime? timeOut,
  }) = _RSession;

  factory RSession.fromJson(Map<String, dynamic> json) =>
      _$RSessionFromJson(json);
}

@EngineSQL('rsession')
class RSessionFields {
  String? id;
  String? guestId;
  String? roomId;
  String? paidAmount;
  String? timeIn;
  String? timeOut;
}
