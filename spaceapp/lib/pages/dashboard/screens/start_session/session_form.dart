import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:spaceapp/widgets/xwidgets.dart';
import 'package:spaceapp/pages/dashboard/screens/start_session/controller.dart';

import 'price_item.dart';

class SessionFormWidget extends StatelessWidget {
  const SessionFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StartSessionController controller = StartSessionController.to;
    return Column(
      children: [
        WTextField(
          hint: 'Guests count',
          controller: controller.guestCount,
          color: Colors.white10,
          textColor: Colors.white70,
        ),
        const SizedBox(height: 11),
        Obx(
          () => AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: controller.prices.isEmpty
                ? const SpinKitRotatingCircle(
                    color: colorDarkLighter,
                    size: 27,
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    itemCount: controller.prices.length + 1,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 9,
                      crossAxisSpacing: 7,
                      mainAxisExtent: 51,
                    ),
                    itemBuilder: (context, index) {
                      if (index != controller.prices.length) {
                        Price price = controller.prices[index];
                        return Obx(
                          () => PriceItemWidget(
                            key: GlobalKey(),
                            price: price,
                            priceSelected: controller.priceSelectedValue,
                            setPrice: () {
                              controller.priceSelected.value = price;
                              controller.isCustomRate.value = false;
                            },
                          ),
                        );
                      }
                      Price price = Price(
                        id: 0,
                        description: 'Custom price for guest',
                        rate: 0,
                        isPerDay: false,
                        isDeleted: false,
                        isDefault: false,
                      );

                      return Obx(
                        () => PriceItemWidget(
                          key: GlobalKey(),
                          price: price,
                          priceSelected: controller.priceSelectedValue,
                          setPrice: () {
                            controller.priceSelected.value = price;
                            controller.isCustomRate.value = true;
                          },
                        ),
                      );
                    },
                  ),
          ),
        ),
      ],
    );
  }
}
