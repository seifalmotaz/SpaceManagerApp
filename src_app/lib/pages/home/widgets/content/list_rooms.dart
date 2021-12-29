import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/pages/home/controllers/controller.dart';
import 'package:spacemanager/screens/rooms/widgets/room_reservations/room_reservations.dart';

class ListRoomsWidget extends StatelessWidget {
  const ListRoomsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();
    return Obx(
      () => ListView.separated(
        itemCount: controller.rooms.length,
        padding: const EdgeInsets.all(11),
        separatorBuilder: (context, index) {
          return const SizedBox(height: 13);
        },
        itemBuilder: (context, index) {
          var item = controller.rooms[index];
          return RoomReservations(
            item,
            onUpdate: controller.restart,
          );
        },
      ),
    );
  }
}
