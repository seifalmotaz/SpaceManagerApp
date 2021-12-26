import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/models/reservations/src.dart';
import 'package:spacemanager/models/rooms/src.dart';
import 'package:spacemanager/screens/rooms/widgets/room_reservations/basic_room_data.dart';
import 'package:spacemanager/screens/rooms/widgets/room_reservations/reservation_tile.dart';

import 'running_reservation.dart';

class RoomReservations extends StatelessWidget {
  const RoomReservations(
    this.room, {
    Key? key,
    this.bg = Colors.white,
    this.nameTextColor = BaseColors.textColor,
    this.semiTextColor = BaseColors.semiTextColor,
    this.titlesTextColor = Colors.grey,
    this.hideNextReservation = false,
  }) : super(key: key);

  final RoomWithReservations room;
  // other
  final Color bg;
  final Color nameTextColor;
  final Color semiTextColor;
  final Color titlesTextColor;
  final bool hideNextReservation;

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
          if (!hideNextReservation)
            if (room.running != null)
              Padding(
                padding: const EdgeInsets.only(
                  left: 21,
                  right: 21,
                  top: 13,
                ),
                child: RunningReservationTile(room.running!),
              ),
          if (!hideNextReservation)
            if (room.reservations != null && room.reservations!.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 21, vertical: 7),
                itemCount: room.reservations!.length > 2
                    ? 3
                    : room.reservations!.length,
                itemBuilder: (context, index) {
                  ReservationWithGuest res = room.reservations![index];
                  return ReservationTileWidget(index, res);
                },
              ),
        ],
      ),
    );
  }
}