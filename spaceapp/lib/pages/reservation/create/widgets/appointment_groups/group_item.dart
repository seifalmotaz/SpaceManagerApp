import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/constant/base_colors.dart';
import 'package:spaceapp/pages/reservation/create/controller.dart';
import 'package:spaceapp/widgets/text_field.dart';

import 'mini_time_chip.dart';

class GroupItem extends StatelessWidget {
  const GroupItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    CreateReservationController controller = CreateReservationController.to;
    Map group = controller.appointmentGroups[index]!;
    return Container(
      color: colorWhite,
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(bottom: 7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Obx(
                () => Checkbox(
                  value: index == controller.selectedAppointment_,
                  shape: const CircleBorder(),
                  onChanged: (value) =>
                      controller.selectedAppointment.value = index,
                ),
              ),
              Flexible(
                child: WTextField(
                  height: 35,
                  fontsize: 13,
                  textColor: colorDarkLightest,
                  color: Colors.grey.shade100,
                  hint: group['title'],
                  initText: group['title'],
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 11,
                    vertical: 13,
                  ),
                  onChange: (string) =>
                      controller.setReservationGroupTitle(index, string),
                ),
              ),
            ],
          ),
          MiniTimeChipWidget(group['reservations']),
        ],
      ),
    );
  }
}
