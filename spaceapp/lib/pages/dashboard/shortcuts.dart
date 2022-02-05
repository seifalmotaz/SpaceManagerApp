import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:spaceapp/pages/dashboard/controllers/controller.dart';
import 'package:spaceapp/pages/dashboard/controllers/searching.dart';

class SearchUsersIntent extends Intent {}

class SearchUsersAction extends Action<SearchUsersIntent> {
  @override
  Future<Object?> invoke(covariant SearchUsersIntent intent) async {
    final SearchingController controller = Get.find<SearchingController>();
    if (!controller.searching.value) {
      controller.searching.value = true;
      controller.searchingFocus.requestFocus();
    } else {
      controller.searching.value = false;
      SearchingController.to.searchingController.text = '';
      SearchingController.to.guests.value = [];
      SearchingController.to.searching.value = false;
      DashboardController.to.shortcutChildFocus.requestFocus();
    }
    return null;
  }
}

class DashboardShortcuts extends StatelessWidget {
  const DashboardShortcuts({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    DashboardController controller = Get.find<DashboardController>();
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
