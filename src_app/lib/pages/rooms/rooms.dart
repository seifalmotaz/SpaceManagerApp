import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/constants/error_snack.dart';
import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/models/sessions/src.dart';
import 'package:spacemanager/pages/base_nav.dart';
import 'package:spacemanager/pages/home/controller.dart';
import 'package:spacemanager/pages/rooms/controller.dart';
import 'package:spacemanager/pages/rooms/sheet/checkout.dart';
import 'package:spacemanager/pages/rooms/widgets/freq.dart';
import 'package:spacemanager/pages/rooms/widgets/hours.dart';
import 'package:spacemanager/pages/rooms/widgets/pick_room.dart';
import 'package:spacemanager/screens/guests/widgets/guest_form_card.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'widgets/mini_time_chip.dart';
import 'widgets/time.dart';

class RoomsPage extends StatelessWidget {
  const RoomsPage(this.guest, {Key? key}) : super(key: key);

  final GuestWithSession? guest;

  @override
  Widget build(BuildContext context) {
    RoomsController controller = Get.put(RoomsController(guest));
    return Scaffold(
      appBar: AppBar(
        elevation: 0.51,
        backgroundColor: BaseColors.primary,
        leading: Container(
          margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
          decoration: BoxDecoration(
            color: BaseColors.white,
            borderRadius: BorderRadius.circular(13),
          ),
          child: BackButton(
            color: BaseColors.primary,
            onPressed: () => Get.back(),
          ),
        ),
        title: const Text('Rooms management'),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.clear_all,
              color: Colors.white,
            ),
            onPressed: () {
              controller.appointmentsList.value = {};
              controller.frequency.value = [];
              controller.selectedAppointment.value = 0;
            },
          ),
          const SizedBox(width: 27),
          IconButton(
            icon: const Icon(
              Icons.clear,
              color: Colors.white,
            ),
            onPressed: () {
              controller
                  .removeFromAppointments(controller.selectedAppointment.value);
              controller.frequency.value = [];
            },
          ),
          const SizedBox(width: 7),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseNav(
            canBack: false,
            bottom: [
              XButtonData(
                iconData: Icons.date_range,
                ontap: () {
                  if (controller.guest.value != null &&
                      controller.room.value != null &&
                      controller.appointmentsList.isNotEmpty) {
                    Get.bottomSheet(const CheckOutSheet());
                  }
                },
              ),
              XButtonData(
                iconData: Icons.watch_later_outlined,
                ontap: () async {
                  if (controller.guest.value != null &&
                      controller.room.value != null) {
                    Session session = Session(
                      guestId: controller.guest.value!.guest.id,
                      guestsCount: controller.room.value!.capacity!,
                      roomId: controller.room.value!.id,
                    );
                    try {
                      await session.start();
                      HomeController.to.restart();
                      Get.back(closeOverlays: true);
                    } catch (e) {
                      errorSnack('Code error', e.toString());
                    }
                  }
                },
              ),
            ],
          ),
          Flexible(
            flex: 2,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: BaseColors.lightPrimary,
              child: guest == null
                  ? const Text("You didn't choose guest.")
                  : SingleChildScrollView(
                      controller: controller.sideScrollController,
                      child: Column(
                        children: [
                          EditGuestFormCardWidget(
                            guest!.guest,
                            enablePass: false,
                            validDelete: false,
                            bg: Colors.transparent,
                            titleColor: Colors.blueGrey.shade900,
                            fieldColor: Colors.white38,
                            hintColor: Colors.black38,
                            textColor: Colors.black,
                          ),
                          GFButton(
                            text: 'Add another time',
                            hoverElevation: .23,
                            color: BaseColors.lightPrimary,
                            textStyle: const TextStyle(
                              color: BaseColors.textColor,
                              fontWeight: FontWeight.bold,
                            ),
                            onPressed: () {
                              if ((controller.selectedAppointment.value ==
                                      controller.appointmentsList.length - 1) ||
                                  (controller.selectedAppointment.value == 0 &&
                                      controller.appointmentsList.length > 1)) {
                                controller.selectedAppointment.value =
                                    controller.appointmentsList.length;
                                controller.frequency.value = [];
                              }
                            },
                          ),
                          Obx(
                            () => ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.appointmentsList.length,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 21),
                              itemBuilder: (context, index) {
                                List<Appointment> list =
                                    controller.appointmentsList[index]!;
                                return GestureDetector(
                                  onTap: () => controller
                                      .selectedAppointment.value = index,
                                  child: MiniTimeChipWidget(list),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
            ),
          ),
          Flexible(
            flex: 6,
            child: SingleChildScrollView(
              controller: controller.contentScrollController,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 27),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PickRoomWidget(),
                  const SizedBox(height: kToolbarHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const ReservationHoursWidget(),
                      FrequencyWidget(controller.setFreq),
                    ],
                  ),
                  const SizedBox(height: kToolbarHeight * .51),
                  Obx(
                    () => ReservationTimeWidget(
                      controller.appointmentsList[
                              controller.selectedAppointment.value] ??
                          [],
                      ignore: controller.hours.value == null ||
                          controller.room.value == null,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
