import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/models/bills/src.dart';
import 'package:spacemanager/pages/admin/base.dart';
import 'package:spacemanager/pages/admin/home/controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'widgets/bills_tile.dart';

class HomeAdminPage extends StatelessWidget {
  const HomeAdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeAdminController controller = Get.put(HomeAdminController());
    return AdminBaseLayout(Column(
      children: [
        const SizedBox(height: 17),
        Wrap(
          runSpacing: 30,
          spacing: 30,
          children: [
            Obx(
              () => BillsTileWidget(
                bg: BaseColors.whiteBased,
                semiTextColor: BaseColors.semiTextColor,
                textColor: BaseColors.textColor,
                name: 'Bills analysis:',
                title: 'Last day',
                content: controller.dayTotal.value.toString() + '\$',
              ),
            ),
            Obx(
              () => BillsTileWidget(
                bg: BaseColors.whiteBased,
                semiTextColor: BaseColors.semiTextColor,
                textColor: BaseColors.textColor,
                name: 'Bills analysis:',
                title: 'Last 7 days',
                content: controller.weekTotal.value.toString() + '\$',
              ),
            ),
            Obx(
              () => BillsTileWidget(
                bg: BaseColors.whiteBased,
                semiTextColor: BaseColors.semiTextColor,
                textColor: BaseColors.textColor,
                name: 'Bills analysis:',
                title: 'Last month',
                content: controller.monthTotal.value.toString() + '\$',
              ),
            ),
          ],
        ),
        const SizedBox(height: 17),
        Obx(
          () => SizedBox(
            width: double.infinity,
            height: Get.height * .4,
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              series: <ChartSeries>[
                LineSeries<Bill, String>(
                  // ignore: invalid_use_of_protected_member
                  dataSource: controller.bills.value,
                  enableTooltip: true,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  xValueMapper: (Bill sales, _) =>
                      Jiffy(sales.createdDate!).MMMEd,
                  yValueMapper: (Bill sales, _) => sales.total,
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}