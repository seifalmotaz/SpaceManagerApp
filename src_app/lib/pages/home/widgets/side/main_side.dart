import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/pages/home/controllers/controller.dart';
import 'package:spacemanager/pages/home/widgets/side/widgets/guests_searching.dart';
import 'package:spacemanager/pages/home/widgets/side/widgets/staff_content.dart';

class MainSide extends StatelessWidget {
  const MainSide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();
    return Container(
      decoration: BoxDecoration(
        color: BaseColors.lightPrimary,
        border: Border(
          right: BorderSide(
            color: Colors.grey.shade300,
            width: .81,
          ),
        ),
      ),
      child: Obx(
        () => AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: controller.guestsSearching.value
              ? const GuestsSearchingWidget()
              : const StaffContentWidget(),
        ),
      ),
    );
  }
}
