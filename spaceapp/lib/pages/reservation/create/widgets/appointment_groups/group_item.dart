import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:spaceapp/constant/base_colors.dart';
import 'package:spaceapp/helpers/snacks.dart';
import 'package:spaceapp/pages/reservation/create/controller.dart';
import 'package:spaceapp/widgets/text_field.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'mini_time_chip.dart';

class GroupItem extends StatelessWidget {
  const GroupItem({
    Key? key,
    required this.index,
    required this.group,
  }) : super(key: key);

  final int index;
  final AppointmentGroup group;

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
          Row(
            children: [
              Flexible(
                child: WTextField(
                  height: 35,
                  fontsize: 13,
                  textColor: colorDarkLightest,
                  color: Colors.grey.shade100,
                  hint: 'Reservations group name',
                  initText: group.title,
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                  onChange: (string) =>
                      controller.setReservationGroupTitle(index, string),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 11,
                    vertical: 13,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  if (controller.$AppointmentGroup_ == index) {
                    controller.$AppointmentSubGroup.value =
                        group.subgroups.length;
                  } else {
                    errorSnack(
                      'Unselected group',
                      'Cannot add appiontment to group with selecting it.',
                      const Duration(seconds: 1),
                    );
                  }
                },
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: group.subgroups.length,
            itemBuilder: (context, i) {
              return Obx(
                () => InkWell(
                  onTap: () => controller.$AppointmentSubGroup.value = i,
                  child: Opacity(
                    opacity: i != controller.$AppointmentSubGroup_ ? .51 : 1,
                    child: IgnorePointer(
                      ignoring: i != controller.$AppointmentSubGroup_,
                      child: MiniTimeChipWidget(
                        group.subgroups[i]!,
                        key: GlobalKey(),
                        color: group.color,
                        onDelete: () {
                          late int _subgroupsLength;
                          controller.appointmentGroups.update(index, (value) {
                            Map<int, List<Appointment>> _subgroups =
                                Map.of(value.subgroups);
                            _subgroups.remove(i);
                            value.subgroups =
                                _subgroups.values.toList().asMap();
                            _subgroupsLength = _subgroups.length;
                            return value;
                          });
                          if (_subgroupsLength == 0) {
                            Map<int, AppointmentGroup> _groups =
                                Map.of(controller.appointmentGroups.value);
                            _groups.remove(index);
                            controller.$AppointmentSubGroup.value = 0;
                            controller.$AppointmentGroup.value = 0;
                            controller.appointmentGroups.value =
                                _groups.values.toList().asMap();
                          }
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
