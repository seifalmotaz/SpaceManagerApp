import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:spacemanager/models/reservations/src.dart';

class RunningReservationTile extends StatefulWidget {
  const RunningReservationTile(this.session, {Key? key}) : super(key: key);
  final ReservationWithSessionWithGuest session;

  @override
  State<RunningReservationTile> createState() => _RunningReservationTileState();
}

class _RunningReservationTileState extends State<RunningReservationTile> {
  late ReservationWithSessionWithGuest session;
  String startTime = '';

  @override
  void initState() {
    session = widget.session;
    super.initState();
    setState(() {
      startTime = Jiffy(session.session!.session.startTime!).format('hh:mm');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
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
                  startTime,
                  style: TextStyle(
                    color: Colors.blueGrey.shade800,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            // GFButton(
            //   text: 'End it',
            //   color: BaseColors.secondPrimary,
            //   onPressed: taped,
            // ),
          ],
        ),
      ],
    );
  }
}
