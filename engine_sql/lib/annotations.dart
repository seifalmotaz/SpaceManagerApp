class EngineSQL {
  final String name;
  final Object sqlite;
  const EngineSQL({
    required this.name,
    required this.sqlite,
  });
}

class FieldSQL {
  /// Do not add this field to create/update function
  final bool primary;
  const FieldSQL({
    this.primary = false,
  });
}
