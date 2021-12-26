import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:spacemanager/pages/rooms/controller.dart';
import 'package:spacemanager/widgets/form_field.dart';

class ReservationHoursWidget extends StatelessWidget {
  const ReservationHoursWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RoomsController controller = Get.find<RoomsController>();
    return SizedBox(
      width: Get.width * .33,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Duration *hours',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
          const SizedBox(height: 13),
          TextCustomField(
            hint: 'Session duration *Hours',
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChange: (string) {
              controller.hours.value = int.tryParse(string ?? '');
            },
          ),
        ],
      ),
    );
  }
}
