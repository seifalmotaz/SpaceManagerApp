import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/pages/rooms/home/controller.dart';
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
          () => SizedBox(
            width: double.infinity,
            child: Wrap(
              spacing: 27,
              runSpacing: 27,
              alignment: WrapAlignment.center,
              children: controller.rooms.map((element) {
                if (controller.room.value != null) {
                  if (element.room.id == controller.room.value!.id) {
                    return GestureDetector(
                      onTap: () {
                        controller.room.value = element.room;
                        controller.selectedAppointment.value = 0;
                        controller.appointmentsList.value = {};
                      },
                      child: RoomReservations(
                        element,
                        bg: BaseColorss.darkLighter,
                        nameTextColor: Colors.white,
                        semiTextColor: Colors.white,
                        titlesTextColor: Colors.grey.shade200,
                      ),
                    );
                  }
                }
                return GestureDetector(
                  onTap: () {
                    controller.room.value = element.room;
                    controller.selectedAppointment.value = 0;
                    controller.appointmentsList.value = {};
                  },
                  child: RoomReservations(element),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
