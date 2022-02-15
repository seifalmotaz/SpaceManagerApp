import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/pages/dashboard/controllers/searching.dart';
import 'package:spaceapp/pages/dashboard/widgets/topbar/topbar.dart';

import 'guest_item.dart';

CustomScrollView searchingResults(
    SearchingController searching, int crossAxisCount) {
  return CustomScrollView(slivers: [
    paddingFromTopBar,
    Obx(
      () => SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (ctx, i) => GuestItem(
              searching.guests[i],
              key: Key(searching.guests[i].guest.id.toString()),
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
