import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/constant/base_colors.dart';
import 'package:spaceapp/pages/course/list/list.dart';
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
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: colorWhite,
                ),
                onPressed: () {},
              ),
              const Text(
                'SpaceDash',
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
                onPressed: () => Get.to(() => const CoursesListPage()),
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
                onPressed: () {
                  SearchingController.to.searching.value = true;
                  SearchingController.to.searchingFocus.requestFocus();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
