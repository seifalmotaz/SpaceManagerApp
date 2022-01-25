import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/constant/base_colors.dart';
import 'package:spaceapp/pages/dashboard/screens/start_room/start_room.dart';
import 'package:spaceapp/pages/dashboard/screens/start_session/start_session.dart';

class GuestItem extends StatefulWidget {
  const GuestItem(this.result, {Key? key}) : super(key: key);

  final Guest$Session result;

  @override
  State<GuestItem> createState() => _GuestItemState();
}

class _GuestItemState extends State<GuestItem> {
  late Guest guest;
  int? session;

  @override
  void initState() {
    guest = widget.result.guest;
    session = widget.result.session;
    super.initState();
  }

  endSession() {}

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
                    Container(
                      padding: const EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        color: colorWhiteBased,
                        borderRadius: BorderRadius.circular(23),
                      ),
                      child: const Text(
                        '9',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: colorText,
                        ),
                      ),
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
                      onTap: () => Get.dialog(StartSessionScreen(
                        guest,
                        key: GlobalKey(),
                      )),
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
                                setState(() {
                                  if (results.sessionId != null) {
                                    session = results.sessionId!;
                                  }
                                  guest = results.guest;
                                });
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
                          last: true,
                          onTap: () => Get.dialog(StartSessionScreen(
                            guest,
                            key: GlobalKey(),
                          )),
                        ),
                      ),
                      const SizedBox(width: 3),
                      Flexible(
                        child: containerButton(
                          'Edit',
                          last: true,
                          color: colorLightBittersweet,
                          onTap: () {},
                        ),
                      ),
                    ],
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
