import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/models/rooms/src.dart';
import 'package:spacemanager/screens/rooms/widgets/room_reservations/basic_room_data.dart';

class RoomReservations extends StatelessWidget {
  const RoomReservations(
    this.room, {
    Key? key,
    this.bg = Colors.white,
    this.nameTextColor = BaseColors.textColor,
    this.semiTextColor = BaseColors.semiTextColor,
    this.titlesTextColor = Colors.grey,
  }) : super(key: key);

  final RoomWithReservations room;
  // other
  final Color bg;
  final Color nameTextColor;
  final Color semiTextColor;
  final Color titlesTextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * .19,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(21),
        boxShadow: [
          BoxShadow(
            spreadRadius: 3,
            blurRadius: 3,
            color: Colors.grey.shade200,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BasicRoomDataWidget(
            room.room,
            bg: bg,
            nameTextColor: nameTextColor,
            semiTextColor: semiTextColor,
            titlesTextColor: titlesTextColor,
          ),
        ],
      ),
    );
  }
}
