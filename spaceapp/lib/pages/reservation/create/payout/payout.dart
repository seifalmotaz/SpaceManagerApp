import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import 'package:spaceapp/pages/dashboard/controllers/controller.dart';
import 'package:spaceapp/pages/reservation/create/controller.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:spaceapp/widgets/xwidgets.dart';
import 'package:spaceapp/constants/settings.dart';

class PayOutScreen extends StatefulWidget {
  const PayOutScreen({Key? key}) : super(key: key);

  @override
  State<PayOutScreen> createState() => _PayOutScreenState();
}

class _PayOutScreenState extends State<PayOutScreen> {
  bool customPay = false;
  bool isHourly = true;

  bool fullPayed = false;
  TextEditingController customPrice = TextEditingController();
  TextEditingController extraHoursPrice = TextEditingController();
  TextEditingController tag = TextEditingController(text: 'Global');

  int getTotalCustomPrice() {
    if (isHourly) {
      int total = 0;
      int rate = int.tryParse(customPrice.text) ?? 0;
      CreateReservationController controller = CreateReservationController.to;
      List<Appointment> list = controller.selectedAppointmentList;
      for (Appointment item in list) {
        total = total +
            controller
                .getPaidAmountForAppointment(item, rate.toDouble())
                .toInt();
      }
      return total;
    }
    return int.tryParse(customPrice.text) ?? 0;
  }

  Future<void> saveCustomPrice() async {
    CreateReservationController controller = CreateReservationController.to;
    int selectedAppointmentLenght = controller.selectedAppointmentList.length;
    if (isHourly) {
      double rate = double.tryParse(customPrice.text)!;
      List<AppointmentGroup> groups =
          controller.appointmentGroups.values.toList();
      for (AppointmentGroup group in groups) {
        for (Appointment app in group.appointments) {
          await guestReservationQuery.create(
            isFullpayed: fullPayed,
            guestId: controller.guest.value!.id,
            roomId: group.roomId,
            tag: tag.text,
            timeIn: app.startTime,
            timeOut: app.endTime,
            extraHoursPrice: double.tryParse(extraHoursPrice.text),
            paidAmount: controller.getPaidAmountForAppointment(app, rate),
          );
        }
      }
    } else {
      double pricePerAppointment =
          getTotalCustomPrice() / selectedAppointmentLenght;
      List<AppointmentGroup> groups =
          controller.appointmentGroups.values.toList();
      for (AppointmentGroup group in groups) {
        for (Appointment app in group.appointments) {
          await guestReservationQuery.create(
            isFullpayed: fullPayed,
            guestId: controller.guest.value!.id,
            roomId: group.roomId,
            tag: tag.text,
            timeIn: app.startTime,
            timeOut: app.endTime,
            paidAmount: pricePerAppointment,
            extraHoursPrice: double.tryParse(extraHoursPrice.text),
          );
        }
      }
    }
  }

  void save(start, stop, state) async {
    start();
    if (int.tryParse(customPrice.text) == null && customPay) {
      errorSnack('Error', 'Add custom price');
      return;
    }
    if (customPay) {
      await saveCustomPrice();
    } else {
      CreateReservationController controller = CreateReservationController.to;
      List<AppointmentGroup> groups =
          controller.appointmentGroups.values.toList();
      for (AppointmentGroup group in groups) {
        for (Appointment app in group.appointments) {
          Room room = controller.rooms.firstWhere((e) => e.id == group.roomId);
          await guestReservationQuery.create(
            isFullpayed: fullPayed,
            guestId: controller.guest.value!.id,
            roomId: group.roomId,
            tag: tag.text,
            timeIn: app.startTime,
            timeOut: app.endTime,
            extraHoursPrice: double.tryParse(extraHoursPrice.text),
            paidAmount: controller.getPaidAmountForAppointment(app, room.rate) *
                reservationPrice,
          );
        }
      }
    }
    stop();
    Get.back(closeOverlays: true);
    DashboardController.to.toMainPageUpdate();
  }

  @override
  Widget build(BuildContext context) {
    CreateReservationController controller = CreateReservationController.to;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Room reservation:',
              style: TextStyle(
                color: colorWhite,
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: customPay
                  ? Text(
                      getTotalCustomPrice().toString() + r'$',
                      style: const TextStyle(
                        fontSize: 21,
                        color: colorWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Text(
                      Jiffy(DateTime.now()).jm,
                      style: const TextStyle(
                        fontSize: 21,
                        color: colorWhite,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ],
        ),
        const SizedBox(height: 7),
        SizedBox(
          height: 50,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: customPay
                ? Row(
                    key: const Key('row1 key custom price'),
                    children: [
                      Flexible(
                        child: WTextField(
                          controller: customPrice,
                          hint: 'Custom price',
                          color: Colors.white10,
                          textColor: Colors.white70,
                          digitsOnly: true,
                          onChange: (string) => setState(() {}),
                        ),
                      ),
                      IconButton(
                        tooltip: 'Is hourly rate.\n blue color if it is.',
                        onPressed: () => setState(() {
                          isHourly = !isHourly;
                        }),
                        icon: Icon(
                          Icons.timer,
                          color: isHourly ? Colors.blue : colorDarkLightest,
                        ),
                      ),
                    ],
                  )
                : Row(
                    key: const Key('row2 the main price'),
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total price:",
                        style: TextStyle(
                          color: colorWhiteBased,
                          fontSize: 21,
                        ),
                      ),
                      Text(
                        "${controller.getPaidAmount()}\$",
                        style: const TextStyle(
                          color: colorWhiteBased,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
        const SizedBox(height: 11),
        Row(
          children: [
            Flexible(
              flex: 6,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: fullPayed ? .51 : 1,
                child: IgnorePointer(
                  ignoring: fullPayed,
                  child: WTextField(
                    controller: extraHoursPrice,
                    hint: 'Price per extra hour',
                    color: Colors.white10,
                    textColor: Colors.white70,
                    digitsOnly: true,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: SwitchListTile.adaptive(
                value: fullPayed,
                title: const Text(
                  'Is full payed',
                  style: TextStyle(
                    color: colorWhite,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onChanged: (v) => setState(() {
                  fullPayed = v;
                }),
              ),
            ),
          ],
        ),
        const SizedBox(height: 11),
        WTextField(
          controller: tag,
          hint: 'Tag',
          color: Colors.white10,
          textColor: Colors.white70,
          onChange: (string) => setState(() {}),
        ),
        const SizedBox(height: 11),
        Row(
          children: [
            ArgonButton(
              height: 40,
              width: 300,
              borderRadius: 13,
              onTap: save,
              loader: Container(
                padding: const EdgeInsets.all(10),
                child: const SpinKitRotatingCircle(
                  color: Colors.white,
                ),
              ),
              child: const Text(
                'Payed',
                style: TextStyle(
                  color: colorWhite,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 7),
            Expanded(
              child: WButton(
                title: 'Custom pay',
                height: 37,
                padding: EdgeInsets.zero,
                onTap: () => setState(() {
                  customPay = !customPay;
                }),
              ),
            )
          ],
        ),
      ],
    );
  }
}
