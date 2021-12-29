import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/models/guests/model.dart';
import 'package:spacemanager/pages/home/controllers/controller.dart';
import 'package:spacemanager/screens/dark_out.dart';
import 'package:spacemanager/screens/guests/widgets/guest_form_card.dart';

import 'widgets/content/courses_section.dart';
import 'widgets/content/list_rooms.dart';
import 'widgets/side/side.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Obx(
                    () => DarkOutWithIgnoreWidget(
                      widget: const Side(),
                      isDarkOut: controller.isCourseGuest,
                      onTap: () {
                        controller.courseGuest.value = null;
                        controller.guestsSearching.value = false;
                      },
                    ),
                  ),
                ),
                Flexible(
                  flex: 6,
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
                                    image: AssetImage(
                                        'assets/backgrounds/SideBG.jpg'),
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
                              const Flexible(flex: 3, child: CoursesSection()),
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
              ],
            ),
          ),
          Obx(
            () => !controller.isCourseGuest
                ? const SizedBox()
                : Positioned(
                    bottom: 23,
                    right: 23,
                    width: Get.width * .23,
                    child: EditGuestFormCardWidget(
                      controller.courseGuest.value ?? Guest(),
                      enablePass: false,
                      validDelete: false,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
