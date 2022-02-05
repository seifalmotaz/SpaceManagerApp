import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:spaceapp/constant/base_colors.dart';
import 'package:spaceapp/pages/dashboard/screens/end_room/controller.dart';
import 'package:spaceapp/pages/dashboard/screens/widgets/guest_form.dart';
import 'package:spaceapp/pages/dashboard/screens/widgets/widgets.dart';
import 'package:spaceapp/widgets/text_field.dart';

class ScreenContentWidget extends StatelessWidget {
  const ScreenContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EndRoomScreenController controller = EndRoomScreenController.to;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'End room:',
              style: TextStyle(
                color: colorWhite,
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              Jiffy(controller.dateTime).jm,
              style: const TextStyle(
                fontSize: 21,
                color: colorWhite,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Obx(
          () => AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: !controller.customPrice.value
                ? Column(
                    children: [
                      dataLabel(
                        i: 1,
                        title: 'Price rate',
                        trailing:
                            controller.roomValue.rate.toString() + '/hour',
                      ),
                      dataLabel(
                        i: 2,
                        title: 'Room capacity',
                        trailing: controller.roomValue.capacity.toString() +
                            ' guests',
                      ),
                      Center(
                        child: ArgonButton(
                          height: 35,
                          width: 400,
                          borderRadius: 13,
                          color: colorDarkLighter,
                          padding: const EdgeInsets.all(11),
                          child: const Tooltip(
                            message: 'Custom price for the guest',
                            child: Text(
                              "Custom price",
                              style: TextStyle(
                                color: colorWhite,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          loader: Container(
                            padding: const EdgeInsets.all(10),
                            child: const SpinKitRotatingCircle(
                              color: Colors.white,
                            ),
                          ),
                          onTap: (startLoading, stopLoading, btnState) {
                            controller.customPrice.value = true;
                          },
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 13),
                      WTextField(
                        hint: 'Price...',
                        onChange: controller.setPrice,
                        color: Colors.white10,
                        textColor: Colors.white70,
                        controller: controller.pricing,
                        icon: Icons.price_change_outlined,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        validator: (string) {
                          if (string == null || string.isEmpty) {
                            return 'Not valid';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        width: 400,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                "${controller.sessionTimeH}H : ${controller.sessionTimeM}M",
                                style: const TextStyle(
                                  color: colorWhite,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const Text(
                              '|',
                              style: TextStyle(
                                color: colorWhiteBased,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Flexible(
                              child: SwitchListTile.adaptive(
                                value: controller.priceHourly.value,
                                onChanged: (value) {
                                  controller.priceHourly.value = value;
                                  controller.setPrice(controller.pricing.text);
                                },
                                title: const Text(
                                  'Hourly',
                                  style: TextStyle(
                                    color: colorWhite,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: ArgonButton(
                          height: 35,
                          width: 400,
                          borderRadius: 13,
                          color: colorDarkLighter,
                          padding: const EdgeInsets.all(11),
                          child: const Tooltip(
                            message: 'The stander price',
                            child: Text(
                              "Stander price",
                              style: TextStyle(
                                color: colorWhite,
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          loader: Container(
                            padding: const EdgeInsets.all(10),
                            child: const SpinKitRotatingCircle(
                              color: Colors.white,
                            ),
                          ),
                          onTap: (startLoading, stopLoading, btnState) {
                            controller.customPrice.value = false;
                            controller.setPrice(
                                controller.roomValue.rate.toInt().toString());
                          },
                        ),
                      ),
                    ],
                  ),
          ),
        ),
        const SizedBox(height: 17),
        GuestFormWidget(
          email: controller.email,
          name: controller.name,
          nationalId: controller.nationalId,
          phone: controller.phone,
          dataEdited: () {
            controller.dataEdited.value = true;
          },
        ),
        const SizedBox(height: 17),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ArgonButton(
              height: 35,
              width: 250,
              borderRadius: 13,
              padding: const EdgeInsets.all(11),
              child: const Text(
                "Save/End",
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
              onTap: controller.endSession,
            ),
            Obx(
              () => SizedBox(
                child: Text(
                  "Total: ${controller.totalPrice.value}\$",
                  style: const TextStyle(
                    color: colorWhite,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Obx(
              () => Text(
                "${controller.sessionTimeH}H : ${controller.sessionTimeM}M",
                style: const TextStyle(
                  color: colorWhite,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
