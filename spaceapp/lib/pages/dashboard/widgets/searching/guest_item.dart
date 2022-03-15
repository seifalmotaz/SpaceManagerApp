import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/widgets/xwidgets.dart';

import 'package:spaceapp/pages/guest/edit_guest.dart';
import 'package:spaceapp/pages/dashboard/screens/end_room/end_room.dart';
import 'package:spaceapp/pages/dashboard/screens/end_session/end_session.dart';
import 'package:spaceapp/pages/dashboard/screens/end_session_custom/end_session_custom.dart';
import 'package:spaceapp/pages/dashboard/screens/start_room/start_room.dart';
import 'package:spaceapp/pages/dashboard/screens/start_session/start_session.dart';
import 'package:spaceapp/pages/reservation/create/create.dart';
import 'package:spaceapp/services/guests.dart';

class GuestItem extends StatefulWidget {
  const GuestItem(this.result, {Key? key}) : super(key: key);

  final Guest$Session result;

  @override
  State<GuestItem> createState() => _GuestItemState();
}

class _GuestItemState extends State<GuestItem> {
  late Guest guest;
  int? session;
  bool isSecondToday = false;

  @override
  void initState() {
    guest = widget.result.guest;
    session = widget.result.session;
    isSecondToday = MemoryGuestsService.to.readGuest(guest.id);
    super.initState();
  }

  endSession() => MonitoringApp.errorTrack(() async {
        Map<String, dynamic>? _session = await sessionQuery.read(session!);
        if (_session != null) {
          _session = Map.of(_session);
          _session.removeWhere((key, value) => value == null);
          // room sessiom
          RoomSession? roomSession = RoomSessionTable.schemaToJson(_session);
          if (roomSession != null) {
            await Get.dialog(EndRoomScreen(
              guest: guest,
              session: roomSession,
            ));
            return;
          }

          // guest sessiom
          GuestSession? guestSession = GuestSessionTable.schemaToJson(_session);
          if (guestSession != null) {
            if (guestSession.customPaid) {
              bool? wait = await Get.dialog(EndSessionScreen$Custom(
                guest: guest,
                session: guestSession,
              ));
              if (wait != null && wait && mounted) {
                setState(() {
                  session = null;
                });
              }
              return;
            } else {
              bool? wait = await Get.dialog(EndSessionScreen(
                guest: guest,
                session: guestSession,
              ));
              if (wait != null && wait) {
                setState(() {
                  session = null;
                });
              }
              return;
            }
          }
        }
      });

  containerButton(
    String title, {
    bool last = false,
    required Function() onTap,
    Color? color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(9),
        margin: last ? null : const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          color: color ?? colorWhite,
          border: Border.all(
            color: colorWhiteBased.withOpacity(.61),
          ),
          borderRadius: BorderRadius.circular(11),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: colorText,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(23),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(17),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '@' + (guest.name ?? 'Unknown'),
                      style: const TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    isSecondToday
                        ? const Icon(
                            Icons.circle_outlined,
                            color: Colors.blue,
                            size: 30,
                          )
                        : const Icon(
                            Icons.circle_outlined,
                            color: colorDarkLightest,
                            size: 30,
                          ),
                  ],
                ),
                const SizedBox(height: 7),
                Text(
                  'gender: ' + (guest.gender ?? 'unknown'),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: colorSemiText,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'phone: ' + (guest.phone ?? 'none'),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: colorSemiText,
                  ),
                ),
                Text(
                  'email: ' + (guest.email ?? 'none'),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: colorSemiText,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'National ID: ' + (guest.readableNationalId() ?? 'none'),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: colorSemiText,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              padding: const EdgeInsets.all(9),
              decoration: const BoxDecoration(
                color: colorWhiteBased2,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(13),
                ),
              ),
              child: Column(
                children: [
                  if (session != null)
                    containerButton(
                      'End session',
                      color: colorLightBittersweet,
                      onTap: endSession,
                    ),
                  if (session == null)
                    Row(
                      children: [
                        Flexible(
                          child: containerButton(
                            'Start session',
                            onTap: () async {
                              StartSessionResults? results =
                                  await Get.dialog(StartSessionScreen(
                                guest,
                                key: GlobalKey(),
                              ));
                              if (results != null) {
                                if (mounted) {
                                  setState(() {
                                    if (results.sessionId != null) {
                                      session = results.sessionId!;
                                    }
                                    guest = results.guest;
                                  });
                                }
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 3),
                        Flexible(
                          child: containerButton(
                            'Start room',
                            onTap: () async {
                              StartRoomReturnResults? results =
                                  await Get.dialog(StartRoomSessionScreen(
                                guest,
                                key: GlobalKey(),
                              ));

                              if (results != null) {
                                setState(() {
                                  session = results.sessionId;
                                  guest = results.guest;
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: containerButton(
                          'Reservation',
                          onTap: () => Get.dialog(EditGuestScreen(
                            guest: guest,
                            onSave: (_guest) {
                              setState(() => guest = _guest);
                              Get.back();
                              Get.to(() => CreateReservationPage(_guest, null));
                            },
                          )),
                        ),
                      ),
                      const SizedBox(width: 3),
                      Flexible(
                        child: containerButton(
                          'Edit',
                          color: colorLightBittersweet,
                          onTap: () => Get.dialog(EditGuestScreen(
                            guest: guest,
                            onSave: (_guest) {
                              setState(() => guest = _guest);
                              Get.back();
                            },
                          )),
                        ),
                      ),
                    ],
                  ),
                  containerButton(
                    'Buy item',
                    last: true,
                    onTap: () => Get.dialog(EditGuestScreen(
                      guest: guest,
                      onSave: (_guest) {
                        setState(() => guest = _guest);
                        Get.back();
                        Get.to(() => CreateReservationPage(_guest, null));
                      },
                    )),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
