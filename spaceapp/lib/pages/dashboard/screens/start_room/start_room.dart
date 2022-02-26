import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:xwidgets/xwidgets.dart';

import 'package:spaceapp/pages/dashboard/controllers/controller.dart';
import 'package:spaceapp/pages/dashboard/controllers/searching.dart';
import 'package:spaceapp/pages/dashboard/screens/widgets/guest_form.dart';

import 'room_item.dart';

class StartRoomReturnResults {
  final int sessionId;
  final Guest guest;

  StartRoomReturnResults({
    required this.guest,
    required this.sessionId,
  });
}

class StartRoomSessionScreen extends StatefulWidget {
  const StartRoomSessionScreen(this.guest, {Key? key}) : super(key: key);

  final Guest guest;

  @override
  _StartRoomSessionScreenState createState() => _StartRoomSessionScreenState();
}

class _StartRoomSessionScreenState extends State<StartRoomSessionScreen> {
  bool dataEdited = false;
  final DateTime _dateTime = DateTime.now();
  List<Room> rooms = [];
  int roomSelected = 0;
  // data
  late Guest guest;
  TextEditingController guestCount = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController nationalId = TextEditingController();

  @override
  void initState() {
    guest = widget.guest;
    name.text = guest.name ?? '';
    email.text = guest.email ?? '';
    phone.text = guest.phone ?? '';
    nationalId.text = guest.nationalId ?? '';
    super.initState();
    getrooms();
  }

  setPrice(int id) => setState(() {
        roomSelected = id;
      });

  getrooms() async {
    List<Room> _rooms = await roomQuery.find(isDeleted: false);
    setState(() {
      rooms = _rooms;
    });
  }

  saveStart(Function start, Function stop, ButtonState state) async {
    start();
    try {
      late Guest _guest;
      if (guest.id == 0) {
        int newGuest = await guestQuery.create(
          name: (name.text).getStringOrNull(),
          email: (email.text).getStringOrNull(),
          phone: (phone.text).getStringOrNull(),
          nationalId: (nationalId.text).getStringOrNull(),
        );
        _guest = await guestQuery.read(newGuest);
      } else if (dataEdited) {
        int newGuest = await guestQuery.update(
          id: guest.id,
          name: (name.text).getStringIfChanged(guest.name),
          email: (email.text).getStringIfChanged(guest.email),
          phone: (phone.text).getStringIfChanged(guest.phone),
          nationalId: (nationalId.text).getStringIfChanged(guest.nationalId),
        );
        _guest = await guestQuery.read(newGuest);
      } else {
        _guest = guest;
      }

      int session = await roomSessionQuery.create(
        guestId: guest.id,
        roomId: roomSelected,
      );

      Get.back(
        result: StartRoomReturnResults(
          sessionId: session,
          guest: _guest,
        ),
      );

      SearchingController.to.searchingController.text = '';
      SearchingController.to.guests.value = [];
      SearchingController.to.searching.value = false;
      DashboardController.to.shortcutChildFocus.requestFocus();
    } catch (e) {
      codeError(e.toString());
    }

    stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Stack(
        children: [
          SizedBox.expand(
            child: GestureDetector(onTap: () => Get.back()),
          ),
          Center(
            child: Container(
              width: 500,
              padding: const EdgeInsets.all(23),
              decoration: BoxDecoration(
                color: colorDarkLight,
                borderRadius: BorderRadius.circular(27),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Start room:',
                        style: TextStyle(
                          color: colorWhite,
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        Jiffy(_dateTime).jm,
                        style: const TextStyle(
                          fontSize: 21,
                          color: colorWhite,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 13),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: rooms.isEmpty
                        ? const SpinKitRotatingCircle(
                            color: colorDarkLighter,
                            size: 27,
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            itemCount: rooms.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 9,
                              crossAxisSpacing: 7,
                              mainAxisExtent: 51,
                            ),
                            itemBuilder: (context, index) {
                              Room room = rooms[index];
                              return RoomItemWidget(
                                room,
                                setPrice,
                                roomSelected,
                              );
                            },
                          ),
                  ),
                  const SizedBox(height: 17),
                  const Text(
                    'Edit guest info:',
                    style: TextStyle(
                      color: colorWhite,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 9),
                  GuestFormWidget(
                    email: email,
                    name: name,
                    nationalId: nationalId,
                    phone: phone,
                    dataEdited: () => dataEdited = true,
                  ),
                  const SizedBox(height: 17),
                  Center(
                    child: ArgonButton(
                      height: 35,
                      width: 300,
                      borderRadius: 13,
                      child: const Text(
                        'Save/Start',
                        style: TextStyle(
                          color: colorWhite,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      loader: Container(
                        padding: const EdgeInsets.all(10),
                        child: const SpinKitRotatingCircle(
                          color: Colors.white,
                        ),
                      ),
                      onTap: saveStart,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
