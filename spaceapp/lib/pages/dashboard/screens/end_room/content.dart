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
        dataLabel(
          i: 1,
          titleWidget: Obx(
            () => Row(
              children: [
                const Text(
                  'Price rate',
                  style: TextStyle(
                    color: colorWhiteBased2,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(width: 11),
                Transform.scale(
                  scale: .81,
                  child: Checkbox(
                    splashRadius: 14,
                    shape: const CircleBorder(),
                    fillColor: MaterialStateProperty.all(Colors.blue.shade400),
                    value: !controller.customPrice.value,
                    onChanged: (value) =>
                        controller.customPrice.value = !(value ?? false),
                  ),
                ),
              ],
            ),
          ),
          trailing: controller.roomValue.rate.toString() + '/hour',
        ),
        dataLabel(
          i: 2,
          title: 'Room size',
          trailing: controller.roomValue.capacity.toString() + ' guests',
        ),
        Obx(
          () => AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: !controller.customPrice.value ? .51 : 1,
            child: IgnorePointer(
              ignoring: !controller.customPrice.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  WTextField(
                    hint: 'Price...',
                    color: Colors.white10,
                    textColor: Colors.white70,
                    controller: controller.pricing,
                    icon: Icons.price_change_outlined,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (string) {
                      if (string == null || string.isEmpty) {
                        return 'Not valid';
                      }
                    },
                    onChange: controller.setPrice,
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
                ],
              ),
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
              child: const Tooltip(
                message: 'Custom price for the guest',
                child: Text(
                  "Save/End",
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
