import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:spaceapp/widgets/xwidgets.dart';

import 'package:spaceapp/pages/course/read/controller.dart';
import 'package:spaceapp/pages/course/registration/controller.dart';
import 'package:spaceapp/pages/guest/edit_guest.dart';

class CreateRegustrationScreen extends StatelessWidget {
  const CreateRegustrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CreateRegistrationController controller =
        Get.put(CreateRegistrationController());
    return ListView(
      shrinkWrap: true,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'New registration:',
              style: TextStyle(
                color: colorWhite,
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              Jiffy(DateTime.now()).jm,
              style: const TextStyle(
                fontSize: 21,
                color: colorWhite,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 13),
        const Text(
          'Guest data:',
          style: TextStyle(
            color: colorWhite,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 9),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Name: ' + (controller.guest.value?.name ?? 'Not founded'),
                style: const TextStyle(
                  color: colorWhiteBased,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Email: ' + (controller.guest.value?.email ?? 'Not founded'),
                style: const TextStyle(
                  color: colorWhiteBased,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 9),
        Row(
          children: [
            Flexible(
              child: WTextField(
                hint: 'Guest phone',
                color: Colors.white10,
                textColor: Colors.white70,
                controller: controller.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.edit,
                color: colorDarkLightest,
              ),
              onPressed: () {
                if (controller.guest.value != null) {
                  Get.dialog(EditGuestScreen(
                    guest: controller.guest.value!,
                    onSave: (guest) {
                      controller.guest.value = guest;
                      Get.back();
                    },
                  ));
                } else {
                  errorSnack(
                    'Unable',
                    'Cannot edit guest data before you choose him.',
                  );
                }
              },
            ),
          ],
        ),
        Obx(
          () => ListView.builder(
            shrinkWrap: true,
            itemCount: controller.guests.length,
            itemBuilder: (context, i) {
              Guest guest = controller.guests[i];
              return ListTile(
                onTap: () async {
                  controller.phone.removeListener(controller.readPhone);
                  controller.phone.text = guest.phone!;
                  controller.guest.value = guest;
                  controller.guests.value = [];
                  controller.phone.addListener(controller.readPhone);
                },
                title: Text(
                  guest.toString(),
                  style: const TextStyle(
                    color: colorWhite,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Text(
                  (guest.phone ?? guest.email)!,
                  style: const TextStyle(
                    color: colorWhiteBased,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 13),
        Obx(
          () {
            List<ReservationsGroup> notEndedGroups =
                ReadCourseController.to.notEndedGroups;
            return ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: notEndedGroups.length,
              itemBuilder: (context, i) {
                ReservationsGroup group = notEndedGroups[i];
                return Obx(() => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Material(
                        clipBehavior: Clip.antiAlias,
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(13),
                        child: ListTile(
                          onTap: () =>
                              controller.selectedGroup.value = group.title,
                          tileColor:
                              controller.selectedGroup.value == group.title
                                  ? colorDarkLightest
                                  : colorDarkLighter,
                          horizontalTitleGap: -11,
                          leading: Text(
                            (i + 1).toString() + '.',
                            style: const TextStyle(
                              color: colorWhiteBased,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          title: Text(
                            group.title,
                            style: const TextStyle(
                              color: colorWhiteBased,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ));
              },
            );
          },
        ),
        const SizedBox(height: 11),
        Center(
          child: ArgonButton(
            height: 35,
            width: 400,
            borderRadius: 13,
            child: const Text(
              'Add',
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
            onTap: controller.add,
          ),
        ),
      ],
    );
  }
}
