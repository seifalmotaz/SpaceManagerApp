import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:spaceapp/constant/base_colors.dart';
import 'package:spaceapp/pages/course/read/controller.dart';

class PagesWidget extends StatelessWidget {
  const PagesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReadCourseController controller = Get.find<ReadCourseController>();
    return Obx(
      () => CupertinoSlidingSegmentedControl<int>(
        groupValue: controller.currentPage.value,
        onValueChanged: (i) => controller.currentPage.value = i ?? 0,
        backgroundColor: colorWhite,
        thumbColor: colorDarkLightest,
        padding: const EdgeInsets.all(3),
        children: {
          0: Text(
            'Resgestred guests',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: controller.currentPage.value == 0
                  ? colorWhite
                  : colorDarkLighter,
            ),
          ),
          1: Text(
            'Reservations',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: controller.currentPage.value == 1
                  ? colorWhite
                  : colorDarkLighter,
            ),
          ),
        },
      ),
    );
  }
}
