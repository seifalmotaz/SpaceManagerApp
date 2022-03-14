extension XString on String {
  String? getStringOrNull() {
    if (isEmpty) {
      return null;
    } else if (isNotEmpty) {
      return this;
    }
    return null;
  }

  String? getStringIfChanged(String? main) {
    if (main == null && isNotEmpty) {
      return this;
    }

    if (isEmpty || main == this) {
      return null;
    } else if (isNotEmpty && main != this) {
      return this;
    }
    return null;
  }
}
