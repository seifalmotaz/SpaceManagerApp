import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  FocusNode phoneFocus = FocusNode();
  FocusNode passFocus = FocusNode();

  TextEditingController phone = TextEditingController();
  TextEditingController pass = TextEditingController();
}
