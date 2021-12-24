import 'package:flutter/material.dart';

class JustSubmitFormWithDefaultIntent extends Intent {}

class JustSubmitFormWithDefaultAction
    extends Action<JustSubmitFormWithDefaultIntent> {
  JustSubmitFormWithDefaultAction();

  @override
  Future<Object?> invoke(
      covariant JustSubmitFormWithDefaultIntent intent) async {}
}
