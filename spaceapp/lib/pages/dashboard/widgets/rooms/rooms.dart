import 'package:flutter/material.dart';
import 'package:spaceapp/widgets/resposive.dart';

import 'item.dart';

class RoomsList extends UIResponsiveless {
  const RoomsList({Key? key}) : super(key: key);

  Widget basic(int crossAxisCount) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: GridView.builder(
          itemCount: 4,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 1 / 1,
            crossAxisSpacing: 13,
            mainAxisSpacing: 13,
          ),
          itemBuilder: (context, index) {
            return const RoomItem();
          },
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
