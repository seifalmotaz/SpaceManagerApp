import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/pages/dashboard/controllers/searching.dart';

import 'guest_item.dart';

CustomScrollView searchingResults(
    SearchingController searching, int crossAxisCount) {
  return CustomScrollView(slivers: [
    const SliverToBoxAdapter(
      child: SizedBox(
        height: kToolbarHeight * 2,
      ),
    ),
    Obx(
      () => SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (ctx, i) => GuestItem(
              searching.guests[i],
              key: GlobalKey(),
            ),
            childCount: searching.guests.value.length,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 13,
            mainAxisSpacing: 13,
            mainAxisExtent: 285,
          ),
        ),
      ),
    ),
  ]);
}
