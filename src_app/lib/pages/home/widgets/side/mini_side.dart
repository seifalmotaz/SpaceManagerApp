import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/pages/admin/prices/prices.dart';
import 'package:spacemanager/pages/home/controller.dart';
import 'package:spacemanager/pages/home/widgets/side/side_button.dart';

class MiniSide extends StatelessWidget {
  const MiniSide({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kToolbarHeight * 2,
      height: double.infinity,
      color: BaseColors.primary,
      padding: const EdgeInsets.symmetric(vertical: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(13),
                margin: const EdgeInsets.symmetric(vertical: 17),
                decoration: BoxDecoration(
                  color: BaseColors.white,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: const Text(
                  'SM',
                  style: TextStyle(
                    color: BaseColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                  ),
                ),
              ),
              const SizedBox(height: 23),
              SideButton(
                icon: Icons.search,
                onTap: () {
                  bool v = HomeController.to.guestsSearching.value;
                  HomeController.to.guestsSearching.value = !v;
                },
              ),
              const SizedBox(height: 17),
              SideButton(
                icon: Icons.room_preferences,
                onTap: () {},
              ),
              const SizedBox(height: 17),
            ],
          ),
          SideButton(
            icon: Icons.settings,
            onTap: () => Get.to(() => const EditPricesPage()),
          ),
        ],
      ),
    );
  }
}
