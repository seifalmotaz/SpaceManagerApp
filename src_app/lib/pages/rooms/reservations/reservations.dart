import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/models/courses/src.dart';
import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/pages/base_nav.dart';
import 'package:spacemanager/pages/home/controllers/controller.dart';
import 'package:spacemanager/pages/rooms/home/rooms.dart';
import 'package:spacemanager/pages/rooms/reservations/controller.dart';
import 'package:spacemanager/pages/rooms/reservations/widgets/reservation_tile.dart';

class ReservationsPage extends StatelessWidget {
  const ReservationsPage(this.guest, this.course, {Key? key}) : super(key: key);

  final Course? course;
  final GuestWithSession? guest;

  @override
  Widget build(BuildContext context) {
    ReservationsController controller =
        Get.put(ReservationsController(guest, course));
    return Scaffold(
      body: Row(
        children: [
          Flexible(
              flex: 1,
              child: BaseNav(
                top: [
                  XButtonData(
                    iconData: Icons.room_preferences,
                    ontap: () async {
                      await Get.to(() => RoomsPage(
                            controller.guestData,
                            controller.courseData,
                          ));
                      HomeController.to.restart();
                    },
                  ),
                ],
              )),
          Flexible(
            flex: 6,
            child: Center(
              child: SizedBox(
                width: Get.width * .51,
                child: Padding(
                  padding: const EdgeInsets.all(17),
                  child: Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Reservations:',
                          style: TextStyle(
                            color: Colors.blueGrey.shade900,
                            fontWeight: FontWeight.bold,
                            fontSize: 27,
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(13),
                            itemCount: controller.reservations.length,
                            itemBuilder: (context, index) {
                              var res = controller.reservations[index];
                              return ReservationTileWidget(res);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
