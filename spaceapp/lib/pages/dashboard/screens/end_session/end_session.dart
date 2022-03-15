import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:spaceapp/widgets/xwidgets.dart';
import 'package:spaceapp/pages/dashboard/screens/end_session/controller.dart';

import 'content.dart';

class EndSessionScreen extends StatelessWidget {
  const EndSessionScreen({
    Key? key,
    required this.guest,
    required this.session,
  }) : super(key: key);

  final Guest guest;
  final GuestSession session;

  @override
  Widget build(BuildContext context) {
    EndSessionScreenController controller =
        Get.put(EndSessionScreenController(guest, session));
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
              clipBehavior: Clip.antiAlias,
              padding: const EdgeInsets.all(23),
              decoration: BoxDecoration(
                color: colorDarkLight,
                borderRadius: BorderRadius.circular(27),
              ),
              child: Obx(
                () => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: controller.isLoading.value
                      ? const SizedBox(
                          height: 51,
                          child: SpinKitRotatingCircle(
                            color: colorDarkLighter,
                          ),
                        )
                      : const ScreenContentWidget(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
