import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/constants/error_snack.dart';
import 'package:spacemanager/models/sessions/crud_query.dart';
import 'package:spacemanager/pages/home/controllers/controller.dart';
import 'package:spacemanager/pages/home/widgets/content/guests_count.dart';
import 'package:spacemanager/pages/login/login.dart';
import 'package:spacemanager/screens/guests/widgets/staff_card_session.dart';
import 'package:spacemanager/services/auth.dart';

class StaffContentWidget extends StatelessWidget {
  const StaffContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            StaffCardSessionWidget(
              guest: AuthService.to.guest!,
              session: AuthService.to.session!,
            ),
            const GuestsExist(),
          ],
        ),
        SizedBox(
          height: kToolbarHeight,
          child: Row(
            children: [
              Flexible(
                flex: 3,
                child: Material(
                  color: BaseColors.primary.withOpacity(.91),
                  child: InkWell(
                    onTap: () => HomeController.to.restart(),
                    child: const SizedBox.expand(
                      child: Icon(
                        Icons.refresh_rounded,
                        size: 27,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Material(
                  color: BaseColors.primary,
                  child: InkWell(
                    onTap: () {
                      Get.bottomSheet(Container(
                        color: Colors.white,
                        width: Get.width * .3,
                        padding: const EdgeInsets.all(13),
                        margin: const EdgeInsets.all(23),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              flex: 3,
                              child: GFButton(
                                text: 'Change staff',
                                fullWidthButton: true,
                                onPressed: () async {
                                  try {
                                    AuthService.to.guestData.value = null;
                                    await AuthService.to.session!.end();
                                    Get.offAll(() => const LogInPage());
                                  } catch (e) {
                                    errorSnack('Code error', e.toString());
                                  }
                                },
                              ),
                            ),
                            const Spacer(),
                            Flexible(
                              flex: 3,
                              child: GFButton(
                                text: 'Close',
                                fullWidthButton: true,
                                onPressed: () async {
                                  await Get.deleteAll(force: true);
                                  exit(0);
                                },
                              ),
                            ),
                          ],
                        ),
                      ));
                    },
                    child: const SizedBox.expand(
                      child: Icon(
                        Icons.more_vert_rounded,
                        size: 27,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
