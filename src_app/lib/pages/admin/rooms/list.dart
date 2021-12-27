import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/models/rooms/src.dart';

class RoomsList extends StatefulWidget {
  const RoomsList({
    Key? key,
    required this.rooms,
    this.onDelete,
  }) : super(key: key);

  final List<Room> rooms;
  final Function? onDelete;

  @override
  State<RoomsList> createState() => _RoomsListState();
}

class _RoomsListState extends State<RoomsList> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: controller,
      isAlwaysShown: true,
      child: SingleChildScrollView(
        controller: controller,
        padding: const EdgeInsets.all(51),
        child: Wrap(
          spacing: 21,
          runSpacing: 21,
          children: [
            for (Room price in widget.rooms)
              Container(
                width: 270,
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
                                  await price.delete();
                                  if (widget.onDelete != null) {
                                    widget.onDelete!();
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
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              price.rate!.round().toString() + '\$',
                              style: TextStyle(
                                color: Colors.blueGrey.shade800,
                                fontWeight: FontWeight.bold,
                                fontSize: 41,
                              ),
                            ),
                            Text(
                              '/hour/${price.capacity}',
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
                          price.name!,
                          textAlign: TextAlign.center,
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
          ],
        ),
      ),
    );
  }
}
