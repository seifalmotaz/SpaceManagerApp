import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xwidgets/xwidgets.dart';
import 'package:spaceapp/pages/reservation/create/controller.dart';
import 'package:spaceapp/pages/dashboard/widgets/background.dart';
import 'package:spaceapp/pages/reservation/create/widgets/calender_picker.dart';
import 'package:spaceapp/pages/reservation/create/widgets/topbar.dart';

import 'widgets/appointment_groups/appointment_groups.dart';
import 'widgets/appointment_groups/room_item.dart';

class CreateReservationPage extends UIResponsiveless {
  const CreateReservationPage(this.guest, this.course, {Key? key})
      : super(key: key);

  final Guest? guest;
  final Course? course;

  @override
  Widget xBuild(BuildContext context, Size size) => _build(2, 4);

  @override
  Widget? largeBuild(BuildContext context, Size size) => _build(1, 3);

  @override
  Widget customBuild(BuildContext context, Size size) => _build(2, 4);

  @override
  Widget mediumBuild(BuildContext context, Size size) => _build(3, 4);

  @override
  Widget smallBuild(BuildContext context, Size size) => _build(4, 4);

  Scaffold _build(int flex1, int flex2) {
    CreateReservationController controller =
        Get.put(CreateReservationController(guest, course));
    return Scaffold(
      body: DashboardBackground(
        Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: kToolbarHeight * 1.7),
                  Obx(
                    () => Wrap(
                      spacing: 11,
                      runSpacing: 11,
                      children: [
                        for (Room room in controller.rooms)
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: controller.selectedRoom_ == room.id
                                ? RoomItemWidget(
                                    room,
                                    bg: colorDarkLightest,
                                    nameTextColor: colorWhite,
                                    semiTextColor: colorWhite,
                                    titlesTextColor: colorWhiteBased,
                                  )
                                : InkWell(
                                    onTap: () {
                                      controller.selectedRoom.value = room.id;
                                      controller.getRoomReservations(room.id);
                                    },
                                    child: RoomItemWidget(
                                      room,
                                      bg: colorWhite,
                                      nameTextColor: Colors.blueGrey.shade800,
                                      semiTextColor: colorText,
                                      titlesTextColor: colorSemiText,
                                    ),
                                  ),
                          )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: flex1,
                        child: const AppointmentGroups(),
                      ),
                      Obx(() {
                        return Flexible(
                          flex: flex2,
                          child: CalenderPickerWidget(
                            appointments: controller.appointmentsList,
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
            const TopBarWidget(),
          ],
        ),
      ),
    );
  }
}
