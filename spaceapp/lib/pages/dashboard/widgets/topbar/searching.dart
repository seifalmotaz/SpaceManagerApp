import 'package:flutter/material.dart';
import 'package:spaceapp/constant/base_colors.dart';
import 'package:spaceapp/pages/dashboard/controllers/controller.dart';
import 'package:spaceapp/widgets/text_field.dart';

class SearchingBar extends StatelessWidget {
  const SearchingBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DashboardController controller = DashboardController.to;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                IconButton(
                  onPressed: () => controller.searching.value = false,
                  icon: const Icon(
                    Icons.search,
                    color: colorWhite,
                  ),
                ),
                Expanded(
                  child: WTextField(
                    border: 50,
                    fontsize: 23,
                    autoFocus: true,
                    hint: 'Search...',
                    controller: controller.searchingController,
                    focus: controller.searchingFocus,
                    color: colorLightBittersweet.withOpacity(.21),
                    textAlignVertical: TextAlignVertical.top,
                    textColor: colorWhite,
                    hintColor: colorWhiteBased2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => controller.searching.value = false,
            icon: const Icon(
              Icons.close,
              color: colorWhite,
            ),
          ),
        ],
      ),
    );
  }
}
