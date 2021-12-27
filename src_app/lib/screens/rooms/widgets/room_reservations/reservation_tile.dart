import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';

import 'package:jiffy/jiffy.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/constants/error_snack.dart';
import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/models/reservations/src.dart';
import 'package:spacemanager/models/sessions/src.dart';
import 'package:spacemanager/screens/guests/widgets/guest_form_card.dart';
import 'package:spacemanager/screens/sessions/end_session/end_session.dart';

class ReservationTileWidget extends StatefulWidget {
  const ReservationTileWidget(
    this.index,
    this.reservation,
    this.roomCapacity, {
    Key? key,
    this.onUpdate,
  }) : super(key: key);

  final int index;
  final ReservationWithGuest reservation;
  final Function? onUpdate;
  final int? roomCapacity;

  @override
  State<ReservationTileWidget> createState() => _ReservationTileWidgetState();
}

class _ReservationTileWidgetState extends State<ReservationTileWidget> {
  taped() {
    Get.dialog(
      GestureDetector(
        onTap: () => Get.back(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(21),
              clipBehavior: Clip.antiAlias,
              child: Container(
                width: 500,
                height: 500,
                color: BaseColorss.darkLight,
                child: Column(
                  children: [
                    EditGuestFormCardWidget(
                      widget.reservation.guest,
                      enablePass: false,
                      validDelete: false,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'From:  ',
                              style: TextStyle(
                                color: Colors.white38,
                              ),
                            ),
                            Text(
                              Jiffy(widget.reservation.reservation.startTime)
                                  .jm,
                              style: const TextStyle(
                                color: Colors.white70,
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
                                color: Colors.white38,
                              ),
                            ),
                            Text(
                              Jiffy(widget.reservation.reservation.endTime).jm,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 33),
                      child: GFButton(
                        fullWidthButton: true,
                        text: 'Start session',
                        onPressed: () async {
                          ReservationWithGuest res = widget.reservation;
                          Session? lateSession =
                              await SessionFindQuery.findNotEndedForGuest(
                                  res.guest.id!);
                          try {
                            bool? wait;
                            if (lateSession != null) {
                              wait = await Get.bottomSheet(
                                  EndSessionScreen(GuestWithSession(
                                session: lateSession,
                                guest: await lateSession.guest(),
                                sessionId: lateSession.id,
                              )));
                            }
                            wait ??= false;
                            if ((lateSession != null && wait) ||
                                lateSession == null) {
                              Session session = Session(
                                reservationId: res.reservation.id,
                                guestId: res.guest.id,
                                guestsCount: widget.roomCapacity,
                                roomId: res.reservation.roomId,
                              );
                              try {
                                await session.start();
                                if (widget.onUpdate != null) widget.onUpdate!();
                                Get.back();
                              } catch (e) {
                                errorSnack(
                                    'Session create error', e.toString());
                              }
                            }
                          } catch (e) {
                            errorSnack('Session create error', e.toString());
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
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
