import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'package:spaceapp/pages/guest/edit_guest.dart';
import 'package:spaceapp/widgets/xwidgets.dart';

import 'controller.dart';

// EditGuestScreen
class CreateCourseScreen extends StatelessWidget {
  const CreateCourseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CreateCourseController controller = Get.put(CreateCourseController());
    return WDialog(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Add course:',
                style: TextStyle(
                  color: colorWhite,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                color: colorWhite,
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.close,
                  size: 19,
                  color: colorWhiteBased,
                ),
              ),
            ],
          ),
          const SizedBox(height: 13),
          const Text(
            'Lecturer data:',
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
                  'Name: ' + (controller.lecturer.value?.name ?? 'Not founded'),
                  style: const TextStyle(
                    color: colorWhiteBased,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Email: ' +
                      (controller.lecturer.value?.email ?? 'Not founded'),
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
                  hint: 'Lecturer phone',
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
                  if (controller.lecturer.value != null) {
                    Get.dialog(EditGuestScreen(
                      guest: controller.lecturer.value!,
                      onSave: (guest) {
                        controller.lecturer.value = guest;
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
              itemCount: controller.lecturers.length,
              itemBuilder: (context, i) {
                Guest guest = controller.lecturers[i];
                return ListTile(
                  onTap: () async {
                    controller.phone.removeListener(controller.readPhone);
                    controller.phone.text = guest.phone!;
                    controller.lecturer.value = guest;
                    controller.lecturers.value = [];
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
          const Text(
            'Course data:',
            style: TextStyle(
              color: colorWhite,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 9),
          WTextField(
            hint: 'Name',
            color: Colors.white10,
            textColor: Colors.white70,
            controller: controller.name,
          ),
          const SizedBox(height: 9),
          WTextField(
            hint: 'Description',
            color: Colors.white10,
            textColor: Colors.white70,
            controller: controller.description,
          ),
          const SizedBox(height: 9),
          WTextField(
            hint: 'Total price',
            color: Colors.white10,
            textColor: Colors.white70,
            controller: controller.totalPrice,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          const SizedBox(height: 17),
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
              onTap: controller.addCourse,
            ),
          ),
        ],
      ),
    );
  }
}
