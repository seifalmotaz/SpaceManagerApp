import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/models/courses/src.dart';
import 'package:spacemanager/pages/rooms/home/rooms.dart';
import 'package:spacemanager/pages/rooms/reservations/reservations.dart';

class CourseTileWidget extends StatelessWidget {
  const CourseTileWidget({
    Key? key,
    required this.course,
    required this.onDelete,
  }) : super(key: key);

  final Course course;
  final Function? onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => Get.to(() => RoomsPage(null, course)),
      onTap: () => Get.to(() => ReservationsPage(null, course)),
      child: Container(
        width: 250,
        clipBehavior: Clip.none,
        padding: const EdgeInsets.all(23),
        decoration: BoxDecoration(
          color: BaseColors.whiteBased,
          borderRadius: BorderRadius.circular(27),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -10,
              right: -10,
              height: 30,
              width: 30,
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(13),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  child: const Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                  ),
                  onTap: () {
                    Get.snackbar(
                      'Delete price',
                      'Are you sure that you want to delete price rate from list.',
                      isDismissible: false,
                      colorText: Colors.white,
                      maxWidth: Get.width * .3,
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: BaseColors.primary,
                      margin: const EdgeInsets.symmetric(vertical: 51),
                      mainButton: TextButton(
                        child: const Text(
                          'Delete it ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () async {
                          await course.delete();
                          if (onDelete != null) {
                            onDelete!();
                          }
                          Get.back();
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.end,
                  alignment: WrapAlignment.center,
                  children: [
                    Text(
                      course.rate!.round().toString() + '\$',
                      style: TextStyle(
                        color: Colors.blueGrey.shade800,
                        fontWeight: FontWeight.bold,
                        fontSize: 41,
                      ),
                    ),
                    Text(
                      '/guest/hour/${course.capacity}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 11),
                Text(
                  course.name!,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    // fontSize: ,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
