import 'package:flutter/material.dart';

import 'package:jiffy/jiffy.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/models/reservations/src.dart';

class ReservationTileWidget extends StatefulWidget {
  const ReservationTileWidget(this.index, this.reservation, {Key? key})
      : super(key: key);

  final int index;
  final ReservationWithGuest reservation;

  @override
  State<ReservationTileWidget> createState() => _ReservationTileWidgetState();
}

class _ReservationTileWidgetState extends State<ReservationTileWidget> {
  Future taped() async {
    // if (widget.session != null) {
    //   Get.find<HomeController>().endUserSession({'session': widget.session!['id']});
    // } else {
    //   SessionTable sessionTable = SessionTable();
    //   RoomsTable roomsTable = RoomsTable();
    //   Map? room = await roomsTable.get(widget.reservation!['room_id']);
    //   if (room != null) {
    //     sessionTable.start(
    //       id: widget.reservation!['user_id'],
    //       room: widget.reservation!['room_id'],
    //       reservation: widget.reservation!['id'],
    //       arrivalsCount: room['capacity'],
    //     );
    //     Get.find<HomeController>().restart();
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: taped,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: -33,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                decoration: BoxDecoration(
                  color: BaseColorss.darkLightest,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    (widget.index + 1).toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      'From:  ',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      Jiffy(widget.reservation.reservation.startTime).jm,
                      style: TextStyle(
                        color: Colors.blueGrey.shade800,
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'To:  ',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      Jiffy(widget.reservation.reservation.endTime).jm,
                      style: TextStyle(
                        color: Colors.blueGrey.shade800,
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
