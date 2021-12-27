import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/pages/home/controller.dart';
import 'package:spacemanager/screens/rooms/widgets/room_reservations/room_reservations.dart';

class ListRoomsWidget extends StatelessWidget {
  const ListRoomsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();
    return Obx(
      () => Wrap(
        spacing: 23,
        runSpacing: 23,
        children: [
          for (var item in controller.rooms)
            RoomReservations(
              item,
              onUpdate: controller.restart,
            ),
        ],
      ),
    );
  }
}
