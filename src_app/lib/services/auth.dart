import 'package:get/get.dart';

class AuthService extends GetxService {
  // Calling func
  static AuthService get to => Get.find();
  // vars
  RxMap user = {}.obs;
  RxMap session = {}.obs;
  RxBool isAuthenticated = false.obs;
}
