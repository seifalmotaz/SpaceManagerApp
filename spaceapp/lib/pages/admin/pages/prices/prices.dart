import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/pages/admin/pages/prices/controller.dart';
import 'package:spaceapp/widgets/xwidgets.dart';

import 'widgets/form.dart';
import 'widgets/price_item.dart';

class PricesManagementPage extends UIResponsiveless {
  const PricesManagementPage({Key? key}) : super(key: key);

  @override
  Widget xBuild(BuildContext context, Size size) {
    PricesManagementController controller =
        Get.put(PricesManagementController());
    return WScaffold(
      title: 'Prices management',
      child: Stack(
        children: [
          SizedBox.expand(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.prices.length,
                padding: const EdgeInsets.only(
                  top: kToolbarHeight * 1.5,
                  left: 33,
                  right: 33,
                  bottom: kToolbarHeight * 1.5,
                ),
                itemBuilder: (cntx, i) => PriceItemWidget(
                  index: i + 1,
                  price: controller.prices[i],
                  key: ValueKey(controller.prices[i]),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: PriceFormWidget(onCreate: () {}),
          ),
        ],
      ),
    );
  }
}
