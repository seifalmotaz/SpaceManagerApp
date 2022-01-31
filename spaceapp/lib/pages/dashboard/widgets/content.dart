import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/pages/dashboard/controllers/searching.dart';
import 'package:spaceapp/widgets/resposive.dart';

import 'current_courses/current_courses.dart';
import 'reservationsWillStart/reservations.dart';
import 'room_sessions/room_sessions.dart';
import 'searching/searching.dart';
import 'topbar/topbar.dart';

class ContentWidget extends UIResponsiveless {
  const ContentWidget({Key? key}) : super(key: key);

  @override
  Widget largeBuild(BuildContext context, Size size) => _build(4);

  @override
  Widget customBuild(BuildContext context, Size size) => _build(3);

  @override
  Widget mediumBuild(BuildContext context, Size size) => _build(2);

  @override
  Widget smallBuild(BuildContext context, Size size) => _build(1);

  Widget _build(int crossAxisCount) {
    SearchingController searching = SearchingController.to;
    return Obx(
      () => AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: searching.searching.value
            ? searchingResults(searching, crossAxisCount)
            : CustomScrollView(
                slivers: [
                  paddingFromTopBar,
                  ...reservationsWillStart(),
                  ...roomSessions(),
                  ...currentCourses(),
                ],
              ),
      ),
    );
  }
}
