import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/models/rooms/src.dart';
import 'package:spacemanager/pages/rooms/home/controller.dart';
import 'package:spacemanager/pages/rooms/home/sheet/shortcuts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'create_nopay.dart';
import 'create_payed.dart';

class CheckOutSheet extends StatefulWidget {
  const CheckOutSheet({Key? key}) : super(key: key);

  @override
  _CheckOutSheetState createState() => _CheckOutSheetState();
}

class _CheckOutSheetState extends State<CheckOutSheet> {
  int listLen = 0;

  Widget label({
    required int index,
    required String title,
    required String value,
  }) {
    return SizedBox(
      width: Get.width * .27,
      child: ListTile(
        horizontalTitleGap: 0,
        leading: Text(
          index.toString(),
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 15,
          ),
        ),
        trailing: Text(
          value,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  int getTotal(RoomsController controller) {
    Room room = controller.room.value!;
    double rate = room.rate!;
    double total = 0;
    List list = [];
    for (List item in controller.appointmentsList.values) {
      list.addAll(item);
    }

    for (Appointment reservation in list) {
      DateTimeRange timeRange =
          DateTimeRange(start: reservation.startTime, end: reservation.endTime);
      total = total + (timeRange.duration.inHours * rate);
    }
    setState(() {
      listLen = list.length;
    });
    return (total * .25).round();
  }

  @override
  Widget build(BuildContext context) {
    RoomsController controller = Get.find<RoomsController>();
    int total = getTotal(controller);
    return RoomsShortCuts(
      shortcutChildFocus: FocusNode(),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 23),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Check out:',
                      style: TextStyle(
                        color: Colors.blueGrey.shade900,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    label(
                      index: 1,
                      title: 'Guests',
                      value: '${controller.room.value!.capacity}',
                    ),
                    label(
                      index: 2,
                      title: 'Price rate/hour',
                      value: '${controller.room.value!.rate}\$',
                    ),
                    label(
                      index: 3,
                      title: 'Reservations count',
                      value: listLen.toString(),
                    ),
                  ],
                ),
                SizedBox(
                  width: Get.width * .21,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 17),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            'Total:',
                            style: TextStyle(
                              fontSize: 27,
                              color: BaseColorss.secondPrimaryDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Text(
                            '$total\$',
                            style: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        GFButton(
                          text: 'Check out',
                          fullWidthButton: true,
                          color: BaseColorss.secondPrimary,
                          onPressed: () => Actions.of(context).invokeAction(
                            CreateReservationPayedAction(),
                            CreateReservationPayedIntent(),
                          ),
                        ),
                        GFButton(
                          text: 'Check out without Paying',
                          fullWidthButton: true,
                          color: BaseColorss.darkLightest,
                          onPressed: () => Actions.of(context).invokeAction(
                            CreateReservationNoPayAction(),
                            CreateReservationNoPayIntent(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
