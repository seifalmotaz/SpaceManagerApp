import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/constants/error_snack.dart';
import 'package:spacemanager/models/bills/src.dart';
import 'package:spacemanager/models/courses/src.dart';
import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/models/prices/src.dart';
import 'package:spacemanager/models/reservations/src.dart';
import 'package:spacemanager/models/rooms/src.dart';
import 'package:spacemanager/models/sessions/src.dart';
import 'package:spacemanager/screens/sessions/end_session/labels_side.dart';
import 'package:spacemanager/screens/sessions/end_session/shortcuts.dart';
import 'package:spacemanager/services/auth.dart';

/// Dialog
class EndSessionScreen extends StatefulWidget {
  const EndSessionScreen(this.guest, {Key? key}) : super(key: key);

  final GuestWithSession guest;

  @override
  _EndSessionScreenState createState() => _EndSessionScreenState();
}

class _EndSessionScreenState extends State<EndSessionScreen> {
  FocusNode focus = FocusNode();
  //
  late Guest guest;
  late Session session;
  String total = '0';

  int timeMin = 0;
  int timeHour = 0;
  //
  Reservation? reservation;
  Room? room;
  Course? course;
  Price? price;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    guest = widget.guest.guest;
    session = widget.guest.session!;
    setState(() {});
    session = await widget.guest.fullSession;
    setState(() {});
    int? v = await session.getTotal();
    if (v != null) {
      setState(() {
        total = v.toString();
      });
    }
    DateTimeRange t = DateTimeRange(
      start: session.startTime!,
      end: DateTime.now(),
    );
    Duration time = t.duration;
    setState(() {
      timeMin = time.inMinutes;
      timeHour = time.inHours;
    });
    if (session.roomId != null) room = await session.room;
    if (session.courseId != null) course = await session.course;
    if (session.priceId != null) price = await session.price;
    if (session.reservationId != null) reservation = await session.reservation;
    setState(() {});
  }

  endSession() async {
    Bill? bill;
    if (session.reservationId != null) {
      bill = await BillQuery.lastReservation(session.reservationId!);
    }
    try {
      await session.end();
      if (bill == null && session.reservationId == null) {
        bill = Bill(
          sessionId: session.id!,
          staffId: AuthService.to.guest!.id,
          total: double.parse(total),
          reservationId: session.reservationId,
        );
        if (double.parse(total) > 0) await bill.create();
      } else if (session.reservationId == null) {
        bill!.total = double.parse(total);
        await bill.update();
      }
      Get.back(result: true);
    } catch (e) {
      errorSnack('Code error', e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => focus.requestFocus(),
      child: Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.enter): CheckOutIntent(),
        },
        child: Actions(
          actions: {
            CheckOutIntent: CallbackAction(
              onInvoke: (intent) => endSession(),
            )
          },
          child: Focus(
            autofocus: true,
            focusNode: focus,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 23),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LabelsSideWidget(
                        session: session,
                        course: course,
                        price: price,
                        reservation: reservation,
                        room: room,
                        timeHour: timeHour,
                        timeMin: timeMin,
                      ),
                      SizedBox(
                        width: Get.width * .21,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 17),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text(
                                  'Total:',
                                  style: TextStyle(
                                    fontSize: 27,
                                    color: BaseColors.primary.withOpacity(.81),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: Text(
                                  '$total\$',
                                  style: const TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              GFButton(
                                text: 'Check out',
                                fullWidthButton: true,
                                color: BaseColors.primary,
                                onPressed: endSession,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
