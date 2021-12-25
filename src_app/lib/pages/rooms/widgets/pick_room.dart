import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/pages/rooms/controller.dart';
import 'package:spacemanager/screens/rooms/widgets/room_reservations/room_reservations.dart';

class PickRoomWidget extends StatefulWidget {
  const PickRoomWidget({Key? key}) : super(key: key);

  @override
  _PickRoomWidgetState createState() => _PickRoomWidgetState();
}

class _PickRoomWidgetState extends State<PickRoomWidget> {
  @override
  Widget build(BuildContext context) {
    RoomsController controller = Get.find<RoomsController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose room:',
          style: TextStyle(
            color: Colors.blueGrey.shade800,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 21),
        Obx(
          () => Wrap(
            spacing: 27,
            runSpacing: 27,
            children: controller.rooms
                .map((element) => GestureDetector(
                      onTap: () {},
                      child: RoomReservations(element),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
