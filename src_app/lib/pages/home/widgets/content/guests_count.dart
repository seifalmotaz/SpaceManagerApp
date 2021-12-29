import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/pages/home/controllers/controller.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GuestsExist extends StatelessWidget {
  const GuestsExist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return Obx(() => SfRadialGauge(
          title: GaugeTitle(
            text: 'Guests count in real time',
            textStyle: TextStyle(
              fontSize: 19,
              color: Colors.blueGrey.shade900,
              fontWeight: FontWeight.bold,
            ),
          ),
          axes: [
            RadialAxis(
              minimum: 0,
              maximum: controller.spaceCapacity.value == 0
                  ? 1
                  : controller.spaceCapacity.value.toDouble(),
              interval: 5,
              showLabels: false,
              showTicks: false,
              axisLineStyle: const AxisLineStyle(thickness: 17),
              pointers: <GaugePointer>[
                RangePointer(
                  value: controller.spaceCurrentCapacity.value.toDouble(),
                  width: 17,
                  cornerStyle: CornerStyle.bothCurve,
                  color: BaseColors.primary.withOpacity(.81),
                ),
              ],
              annotations: [
                GaugeAnnotation(
                  widget: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              controller.spaceCurrentCapacity.value.toString(),
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: '/' + controller.spaceCapacity.value.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
