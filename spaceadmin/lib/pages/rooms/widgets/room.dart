import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:spaceadmin/constant/base_colors.dart';
import 'package:spaceadmin/helpers/snacks.dart';
import 'package:spaceadmin/pages/rooms/controllers/controller.dart';

class RoomItemWidget extends StatelessWidget {
  const RoomItemWidget({Key? key, required this.room, required this.index})
      : super(key: key);

  final Room room;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 13),
      decoration: BoxDecoration(
        color: room.isDeleted! ? ColorPalette.lightBittersweet : Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 13,
            spreadRadius: 7,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: Row(
              children: [
                Text(
                  "$index.  ",
                  style: const TextStyle(
                    color: ColorPalette.semiTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
                Text(
                  room.name,
                  style: const TextStyle(
                    color: ColorPalette.semiTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: IgnorePointer(
              ignoring: room.isDeleted!,
              child: Opacity(
                opacity: room.isDeleted! ? .51 : 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Capacity: ${room.capacity}",
                      style: TextStyle(
                        color: ColorPalette.semiTextColor.withOpacity(.81),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Price rate: ${room.rate}/hour",
                      style: TextStyle(
                        color: ColorPalette.semiTextColor.withOpacity(.81),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: room.isDeleted!
                ? IconButton(
                    icon: const Icon(
                      Icons.restore_from_trash,
                      color: ColorPalette.bittersweet,
                    ),
                    onPressed: () async {
                      try {
                        await roomQuery.update(id: room.id, isDeleted: false);
                        RoomsController.to.getRooms();
                      } catch (e) {
                        codeErrorSnack(e.toString());
                      }
                    },
                  )
                : IconButton(
                    icon: const Icon(
                      Icons.delete_rounded,
                      color: ColorPalette.bittersweet,
                    ),
                    onPressed: () async {
                      try {
                        await roomQuery.update(id: room.id, isDeleted: true);
                        RoomsController.to.getRooms();
                      } catch (e) {
                        codeErrorSnack(e.toString());
                      }
                    },
                  ),
          )
        ],
      ),
    );
  }
}
