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
            (ctx, i) {
              int guestId = searching.guests[i].guest.id;
              return GuestItem(
                searching.guests[i],
                key: guestId == 0 ? GlobalKey() : Key(guestId.toString()),
              );
            },
            childCount: searching.guests.value.length,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 13,
            mainAxisSpacing: 13,
            mainAxisExtent: 323,
          ),
        ),
      ),
    ),
  ]);
}
