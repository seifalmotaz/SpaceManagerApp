import 'package:flutter/material.dart';
import 'package:spaceapp/constant/base_colors.dart';
import 'package:spaceapp/pages/dashboard/controllers/searching.dart';

class MainBar extends StatelessWidget {
  const MainBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'SpaceDash',
            style: TextStyle(
              color: colorWhite,
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
          Row(
            children: [
              TextButton.icon(
                label: const Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 17,
                    color: colorWhite,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                icon: const Icon(
                  Icons.home_filled,
                  color: colorWhite,
                  size: 23,
                ),
                onPressed: () {},
              ),
              TextButton.icon(
                label: const Text(
                  'Courses',
                  style: TextStyle(
                    fontSize: 17,
                    color: colorWhite,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                icon: const Icon(
                  Icons.school,
                  color: colorWhite,
                  size: 23,
                ),
                onPressed: () {},
              ),
              TextButton.icon(
                label: const Text(
                  'Search',
                  style: TextStyle(
                    fontSize: 17,
                    color: colorWhite,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                icon: const Icon(
                  Icons.search,
                  color: colorWhite,
                  size: 23,
                ),
                onPressed: () => SearchingController.to.searching.value = true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
