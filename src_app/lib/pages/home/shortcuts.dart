import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:spacemanager/pages/home/controllers/controller.dart';

class SearchUsersIntent extends Intent {}

class SearchUsersAction extends Action<SearchUsersIntent> {
  @override
  Future<Object?> invoke(covariant SearchUsersIntent intent) async {
    final HomeController controller = Get.find<HomeController>();
    if (!controller.guestsSearching.value) {
      controller.guestsSearching.value = true;
      controller.searchingFocus.requestFocus();
    } else {
      controller.guestsSearching.value = false;
      controller.shortcutChildFocus.requestFocus();
    }
  }
}

class HomeShortcuts extends StatelessWidget {
  const HomeShortcuts({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();
    return GestureDetector(
      onTap: () {
        Get.focusScope!.unfocus();
        controller.shortcutChildFocus.requestFocus();
      },
      child: Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyS):
              SearchUsersIntent(),
        },
        child: Actions(
          actions: {SearchUsersIntent: SearchUsersAction()},
          child: Focus(
            autofocus: true,
            focusNode: controller.shortcutChildFocus,
            child: child,
          ),
        ),
      ),
    );
  }
}
