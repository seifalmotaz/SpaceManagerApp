import 'package:flutter/material.dart';
import 'package:spaceapp/constant/base_colors.dart';
import 'package:spaceapp/widgets/resposive.dart';

const SliverToBoxAdapter paddingFromTopBar =
    SliverToBoxAdapter(child: SizedBox(height: kToolbarHeight * 1.61));

class TopBarWidget extends UIResponsiveless {
  const TopBarWidget({Key? key}) : super(key: key);

  @override
  Widget xBuild(BuildContext context, Size size) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: kToolbarHeight,
        width: size.width * .97,
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 17),
        margin: const EdgeInsets.only(top: 17),
        decoration: BoxDecoration(
          color: colorBittersweet,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Reservation',
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
                    'Save',
                    style: TextStyle(
                      fontSize: 17,
                      color: colorWhite,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  icon: const Icon(
                    Icons.save_alt,
                    color: colorWhite,
                    size: 23,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
