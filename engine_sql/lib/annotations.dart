class EngineSQL {
  final String tableName;
  const EngineSQL(this.tableName);
}

class FieldSQL {
  /// Do not add this field to create/update function
  final bool primary;
  const FieldSQL({
    this.primary = false,
  });
}
