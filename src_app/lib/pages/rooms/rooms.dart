import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/pages/rooms/controller.dart';
import 'package:spacemanager/pages/rooms/widgets/pick_room.dart';
import 'package:spacemanager/screens/guests/widgets/guest_form_card.dart';

class RoomsPage extends StatelessWidget {
  const RoomsPage(this.guest, {Key? key}) : super(key: key);

  final GuestWithSession? guest;

  @override
  Widget build(BuildContext context) {
    Get.put(RoomsController(guest));
    return Scaffold(
      appBar: AppBar(
        elevation: .81,
        backgroundColor: BaseColors.primary,
        title: const Text(
          'Rooms manager',
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 2,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: BaseColorss.darkLight,
              child: Center(
                child: guest == null
                    ? const Text("You didn't choose guest.")
                    : EditGuestFormCardWidget(
                        guest!.guest,
                        enablePass: false,
                        validDelete: false,
                      ),
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 27),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  PickRoomWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
