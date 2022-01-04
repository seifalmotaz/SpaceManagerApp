import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/models/guests/model.dart';
import 'package:spacemanager/pages/home/controllers/controller.dart';
import 'package:spacemanager/screens/dark_out.dart';
import 'package:spacemanager/screens/guests/widgets/guest_form_card.dart';

import 'shortcuts.dart';
import 'widgets/content/courses_section.dart';
import 'widgets/content/list_rooms.dart';
import 'widgets/side/side.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return HomeShortcuts(
      child: Scaffold(
        key: controller.scaffoldKey,
        extendBodyBehindAppBar: true,
        drawerEnableOpenDragGesture: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        drawer: const Side(),
        onDrawerChanged: (isOpened) {
          if (!isOpened) {
            controller.guestsSearching.value = false;
            controller.shortcutChildFocus.requestFocus();
          }
        },
        body: Stack(
          children: [
            SizedBox.expand(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Stack(
                  children: [
                    Obx(
                      () => DarkOutWithIgnoreWidget(
                        isDarkOut: controller.isCourseGuest,
                        onTap: () {
                          controller.courseGuest.value = null;
                          controller.guestsSearching.value = false;
                        },
                        widget: ImageFiltered(
                          imageFilter: ImageFilter.blur(
                            sigmaX: 3,
                            sigmaY: 3,
                          ),
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/backgrounds/SideBG.jpg'),
                                fit: BoxFit.fill,
                                colorFilter: ColorFilter.mode(
                                  Colors.white70,
                                  BlendMode.dstATop,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(33),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Flexible(
                            flex: 2,
                            child: CoursesSection(),
                          ),
                          Flexible(
                            child: Obx(
                              () => DarkOutWithIgnoreWidget(
                                isDarkOut: controller.isCourseGuest,
                                onTap: () {
                                  controller.courseGuest.value = null;
                                  controller.guestsSearching.value = false;
                                },
                                widget: const ListRoomsWidget(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(
              () => !controller.isCourseGuest
                  ? const SizedBox()
                  : Positioned(
                      bottom: 23,
                      right: 23,
                      width: Get.width * .23,
                      child: Column(
                        children: [
                          EditGuestFormCardWidget(
                            controller.courseGuest.value ?? Guest(),
                            enablePass: false,
                            validDelete: false,
                          ),
                          GFButton(
                            fullWidthButton: true,
                            text: 'Close mode',
                            color: BaseColors.primary,
                            onPressed: () {
                              controller.courseGuest.value = null;
                              controller.guestsSearching.value = false;
                            },
                          )
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
