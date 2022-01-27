import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:spaceapp/constant/base_colors.dart';
import 'package:spaceapp/pages/dashboard/screens/start_session/controller.dart';
import 'package:spaceapp/pages/dashboard/screens/widgets/guest_form.dart';

import 'session_form.dart';

class StartSessionResults {
  final int? sessionId;
  final Guest guest;

  StartSessionResults({
    required this.guest,
    this.sessionId,
  });
}

class StartSessionScreen extends StatelessWidget {
  const StartSessionScreen(this.guest, {Key? key}) : super(key: key);

  final Guest guest;

  @override
  Widget build(BuildContext context) {
    StartSessionController controller = Get.put(StartSessionController(guest));
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
                        'Start session:',
                        style: TextStyle(
                          color: colorWhite,
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        Jiffy(controller.dateTime).jm,
                        style: const TextStyle(
                          fontSize: 21,
                          color: colorWhite,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 13),
                  const SessionFormWidget(),
                  const SizedBox(height: 17),
                  GuestFormWidget(
                    email: controller.email,
                    name: controller.name,
                    nationalId: controller.nationalId,
                    phone: controller.phone,
                    dataEdited: () => controller..dataEdited.value = true,
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
                      onTap: controller.startSession,
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
