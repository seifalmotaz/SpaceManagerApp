library engine_sql_annotation;

class EngineSQL {
  final String name;
  const EngineSQL({
    required this.name,
  });
}

class FieldSQL {
  /// Do not add this field to create/update function
  final bool primary;
  final bool haveDefault;
  const FieldSQL({
    this.primary = false,
    this.haveDefault = false,
  });
}
