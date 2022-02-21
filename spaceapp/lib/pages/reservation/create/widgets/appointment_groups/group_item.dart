import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xwidgets/xwidgets.dart';
import 'package:spaceapp/pages/reservation/create/controller.dart';

import 'mini_time_chip.dart';

class GroupItem extends StatelessWidget {
  const GroupItem({
    Key? key,
    required this.index,
    required this.group,
  }) : super(key: key);

  final int index;
  final AppointmentGroup group;

  bool isSelected(CreateReservationController controller) {
    if (index != controller.selectedGroup_) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    CreateReservationController controller = CreateReservationController.to;
    return Container(
      color: colorWhite,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(bottom: 7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row(
          //   children: [
          //     Flexible(
          //       child: WTextField(
          //         // height: 35,
          //         fontsize: 13,
          //         maxLines: null,
          //         textColor: colorDarkLightest,
          //         color: Colors.grey.shade100,
          //         hint: 'Reservations group name',
          //         controller: ,
          //         inputFormatters: [
          //           FilteringTextInputFormatter.singleLineFormatter
          //         ],
          //         onChange: (string) =>
          //             controller.setReservationGroupTitle(index, string),
          //         contentPadding: const EdgeInsets.symmetric(
          //           horizontal: 11,
          //           vertical: 13,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          Obx(
            () => InkWell(
              onTap: () {
                controller.selectedGroup.value = index;
                controller.selectedRoom.value = group.roomId;
                controller.calendarController.displayDate = controller
                    .appointmentGroups[controller.selectedGroup_]!
                    .appointments
                    .first
                    .startTime;
              },
              child: Opacity(
                opacity: isSelected(controller) ? 1 : .51,
                child: IgnorePointer(
                  ignoring: !isSelected(controller),
                  child: MiniTimeChipWidget(
                    group.appointments,
                    key: GlobalKey(),
                    color: group.color,
                    onDelete: () {
                      List<AppointmentGroup> groups =
                          controller.appointmentGroups.values.toList();
                      groups.removeAt(index);
                      controller.selectedGroup.value = 0;
                      controller.appointmentGroups.value = groups.asMap();
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
