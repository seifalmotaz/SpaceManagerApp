import 'package:flutter/material.dart';

import 'item.dart';

SliverPadding roomsList(int crossAxisCount) {
  return SliverPadding(
    padding: const EdgeInsets.symmetric(horizontal: 27),
    sliver: SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (ctx, i) => const RoomItem(),
        childCount: 5,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 1 / 1,
        crossAxisSpacing: 13,
        mainAxisSpacing: 13,
      ),
    ),
  );
}
