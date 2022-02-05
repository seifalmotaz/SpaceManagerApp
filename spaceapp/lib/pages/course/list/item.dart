import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/pages/reservation/create/create.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:readmore/readmore.dart';
import 'package:spaceapp/constant/base_colors.dart';
import 'package:spaceapp/widgets/resposive.dart';

class CourseItemWidget extends UIResponsiveless {
  const CourseItemWidget(this.course, {Key? key}) : super(key: key);

  final Course course;

  @override
  Widget xBuild(BuildContext context, Size size) {
    return Container(
      padding: const EdgeInsets.all(11),
      margin: const EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(21),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  timeago.format(course.createdDate!, locale: 'en_short'),
                  style: const TextStyle(
                    color: colorDarkLighter,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 17),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course.name,
                      style: const TextStyle(
                        color: colorDarkLight,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: size.width * .4,
                      child: ReadMoreText(
                        course.description,
                        trimLines: 1,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'Show more',
                        trimExpandedText: 'Show less',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Flexible(
            child: Column(
              children: [
                TextButton(
                  onPressed: () =>
                      Get.to(() => CreateReservationPage(null, course)),
                  child: const Text(
                    'Details',
                    style: TextStyle(
                      color: colorDarkLightest,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Delete',
                    style: TextStyle(
                        color: colorWhite, fontWeight: FontWeight.w600),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: colorBittersweet.withOpacity(.81),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
