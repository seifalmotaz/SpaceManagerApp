import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:spaceapp/constant/base_colors.dart';
import 'package:spaceapp/pages/dashboard/screens/end_session/controller.dart';
import 'package:spaceapp/pages/dashboard/screens/widgets/widgets.dart';
import 'package:spaceapp/pages/dashboard/screens/widgets/guest_form.dart';
import 'package:spaceapp/widgets/text_field.dart';

class ScreenContentWidget extends StatelessWidget {
  const ScreenContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EndSessionScreenController controller = EndSessionScreenController.to;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'End session:',
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
            child: controller.customPrice.value
                ? Column(
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
                        },
                      ),
                      SwitchListTile.adaptive(
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
                                controller.priceValue.rate.toInt().toString());
                          },
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      dataLabel(
                        i: 1,
                        title: 'Guest count',
                        trailing:
                            controller.sessionValue.guestCount.toString() +
                                ' guests',
                      ),
                      dataLabel(
                        i: 2,
                        title: 'Price/hour',
                        trailing: controller.priceValue.rate.toString() +
                            '/guest/hour',
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
              () => Text(
                "Total: ${controller.totalPrice}\$",
                style: const TextStyle(
                  color: colorWhite,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
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
        // Center(
        //   child: ArgonButton(
        //     height: 35,
        //     width: 400,
        //     borderRadius: 13,
        //     color: colorBittersweet,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         Text(
        //           "Total: ${controller.totalPrice}\$",
        //           style: const TextStyle(
        //             color: colorWhite,
        //             fontSize: 17,
        //             fontWeight: FontWeight.w600,
        //           ),
        //         ),
        //         Text(
        //           "${controller.sessionTimeH}H : ${controller.sessionTimeM}M",
        //           style: const TextStyle(
        //             color: colorWhite,
        //             fontSize: 17,
        //             fontWeight: FontWeight.w600,
        //           ),
        //         ),
        //         const Text(
        //           'Save/End',
        //           style: TextStyle(
        //             color: colorWhite,
        //             fontSize: 17,
        //             fontWeight: FontWeight.w600,
        //           ),
        //         ),
        //       ],
        //     ),
        //     loader: Container(
        //       padding: const EdgeInsets.all(10),
        //       child: const SpinKitRotatingCircle(
        //         color: Colors.white,
        //       ),
        //     ),
        //     onTap: controller.endSession,
        //   ),
        // ),
      ],
    );
  }
}
