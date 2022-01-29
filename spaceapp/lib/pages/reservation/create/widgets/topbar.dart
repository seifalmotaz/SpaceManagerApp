import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:spaceapp/constant/base_colors.dart';
import 'package:spaceapp/pages/reservation/create/controller.dart';
import 'package:spaceapp/widgets/resposive.dart';
import 'package:spaceapp/widgets/text_field.dart';

const SliverToBoxAdapter paddingFromTopBar =
    SliverToBoxAdapter(child: SizedBox(height: kToolbarHeight * 1.61));

class TopBarWidget extends UIResponsiveless {
  const TopBarWidget({Key? key}) : super(key: key);

  final TextStyle textStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 17,
    color: colorWhite,
  );

  DropdownMenuItem<String> _dropBuilder(String item) {
    return DropdownMenuItem<String>(
      value: item,
      child: Text(
        item,
        style: textStyle,
      ),
    );
  }

  @override
  Widget xBuild(BuildContext context, Size size) {
    CreateReservationController controller = CreateReservationController.to;
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: kToolbarHeight,
        width: size.width * .97,
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 17),
        margin: const EdgeInsets.only(top: 17),
        decoration: BoxDecoration(
          color: colorBittersweet,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                BackButton(
                  color: colorWhite,
                  onPressed: () => Get.back(),
                ),
                const Text(
                  'Reservation',
                  style: TextStyle(
                    color: colorWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 150,
                  child: WTextField(
                    hint: 'Houres',
                    textColor: colorWhite,
                    hintColor: colorWhiteBased2,
                    textAlign: TextAlign.center,
                    color: colorLightBittersweet.withOpacity(.21),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 13,
                      vertical: 13,
                    ),
                    onChange: (string) {
                      if (string != null && string.isNotEmpty) {
                        controller.reservedHours.value =
                            int.tryParse(string) ?? 1;
                      } else {
                        controller.reservedHours.value = 1;
                      }
                    },
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  '|',
                  style: TextStyle(
                    fontSize: 21,
                    color: colorLightBittersweet.withOpacity(.13),
                  ),
                ),
                const SizedBox(width: 5),
                SizedBox(
                  width: 150,
                  child: WTextField(
                    hint: 'Frequency',
                    textColor: colorWhite,
                    hintColor: colorWhiteBased2,
                    textAlign: TextAlign.center,
                    color: colorLightBittersweet.withOpacity(.21),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 13,
                      vertical: 13,
                    ),
                    onChange: (string) {
                      if (string != null && string.isNotEmpty) {
                        controller.frequencyNumber.value =
                            int.tryParse(string) ?? 1;
                      } else {
                        controller.frequencyNumber.value = 0;
                      }
                    },
                  ),
                ),
                const SizedBox(width: 11),
                SizedBox(
                  width: 150,
                  child: Obx(
                    () => DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: controller.frequency.value,
                        items: controller.freqList.map(_dropBuilder).toList(),
                        onChanged: (value) =>
                            controller.frequency.value = value,
                        hint: Text('Frequency', style: textStyle),
                        dropdownColor: colorDarkLight,
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TextButton.icon(
                  label: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 17,
                      color: colorWhite,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  icon: const Icon(
                    Icons.save_alt,
                    color: colorWhite,
                    size: 23,
                  ),
                  onPressed: controller.saveDialog,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
