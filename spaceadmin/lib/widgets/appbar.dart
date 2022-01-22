import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceadmin/constant/base_colors.dart';
import 'package:spaceadmin/pages/prices/controllers/binding.dart';
import 'package:spaceadmin/pages/rooms/controllers/binding.dart';

class WAppBar extends StatelessWidget {
  const WAppBar({Key? key, this.title = 'Title'}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 17,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: ColorPalette.bittersweet,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                if (Navigator.canPop(Get.context!))
                  BackButton(
                    color: Colors.white,
                    onPressed: () => Get.back(closeOverlays: true),
                  ),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton.icon(
                  icon: const Icon(
                    Icons.price_change_outlined,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Prices',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      // fontSize: 23,
                    ),
                  ),
                  onPressed: () => PricesBinding.off,
                ),
                TextButton.icon(
                  icon: const Icon(
                    Icons.room_preferences_sharp,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Rooms',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      // fontSize: 23,
                    ),
                  ),
                  onPressed: () => RoomsBinding.off,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
