import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:jiffy/jiffy.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/models/reservations/src.dart';
import 'package:spacemanager/models/sessions/ref.dart';
import 'package:spacemanager/screens/sessions/end_session/end_session.dart';

class RunningReservationTile extends StatefulWidget {
  const RunningReservationTile(this.session, this.onUpdate, {Key? key})
      : super(key: key);
  final ReservationWithSessionWithGuest session;
  final Function? onUpdate;

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
      startTime = Jiffy(session.session!.session.startTime!).jm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
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
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          GFButton(
            text: 'End it',
            color: BaseColors.primary,
            onPressed: () async {
              bool? wait = await Get.bottomSheet(
                EndSessionScreen(
                  GuestWithSession(
                    guest: await widget.session.session!.session.guest(),
                    session: widget.session.session!.session,
                    sessionId: widget.session.session!.session.id,
                  ),
                ),
              );
              if (wait != null && wait) {
                if (widget.onUpdate != null) {
                  widget.onUpdate!();
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
