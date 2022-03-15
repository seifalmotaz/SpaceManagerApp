import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/widgets/xwidgets.dart';
import 'package:spaceapp/pages/reservation/create/controller.dart';
import 'group_item.dart';

class AppointmentGroups extends UIResponsiveless {
  const AppointmentGroups({
    Key? key,
  }) : super(key: key);

  @override
  Widget xBuild(BuildContext context, Size size) {
    CreateReservationController controller = CreateReservationController.to;
    return Container(
      width: double.infinity,
      height: size.height * .71,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(
        right: 0,
        left: 27,
        top: 27,
        bottom: 27,
      ),
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 3),
            decoration: BoxDecoration(
              color: colorWhite,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade300,
                  width: .51,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Appointment groups:',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: colorDarkLight,
                  ),
                ),
                IconButton(
                  tooltip: 'Add new appointment group',
                  icon: Icon(
                    Icons.add,
                    color: colorDarkLightest.withOpacity(.81),
                  ),
                  onPressed: () => controller.selectedGroup.value =
                      controller.appointmentGroups.length,
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.separated(
                itemCount: controller.appointmentGroups.length,
                padding: const EdgeInsets.symmetric(horizontal: 13),
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.grey.shade200,
                    height: 1,
                  );
                },
                itemBuilder: (context, index) {
                  AppointmentGroup group = controller.appointmentGroups[index]!;
                  return GroupItem(
                    key: GlobalKey(),
                    group: group,
                    index: index,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
