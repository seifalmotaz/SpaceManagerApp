import 'package:flutter/material.dart';
import 'package:spaceapp/widgets/resposive.dart';

import 'guest_item.dart';

class SearchingResults extends UIResponsiveless {
  const SearchingResults({Key? key}) : super(key: key);

  Widget basic(int crossAxisCount) => SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (ctx, i) => const GuestItem(),
          childCount: 5,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: 1 / 1,
          crossAxisSpacing: 13,
          mainAxisSpacing: 13,
        ),
      );

  @override
  Widget largeBuild(BuildContext context, Size size) => basic(4);

  @override
  Widget customBuild(BuildContext context, Size size) => basic(3);

  @override
  Widget mediumBuild(BuildContext context, Size size) => basic(2);

  @override
  Widget smallBuild(BuildContext context, Size size) => basic(1);
}
