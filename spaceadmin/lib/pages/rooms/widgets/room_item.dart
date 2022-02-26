import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:spaceadmin/pages/rooms/controller.dart';
import 'package:xwidgets/xwidgets.dart';

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
        color: room.isDeleted! ? colorBittersweet : Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: const [
          BoxShadow(
            color: Colors.white54,
            blurRadius: 13,
            spreadRadius: 3,
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
                    color: colorSemiText,
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
                Text(
                  room.name,
                  style: const TextStyle(
                    color: colorSemiText,
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
                        color: colorSemiText.withOpacity(.81),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Price rate: ${room.rate}/hour",
                      style: TextStyle(
                        color: colorSemiText.withOpacity(.81),
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
                      color: colorBittersweet,
                    ),
                    onPressed: () async {
                      try {
                        await roomQuery.update(id: room.id, isDeleted: false);
                        RoomsManagementController.to.getRooms();
                      } catch (e) {
                        codeError(e.toString());
                      }
                    },
                  )
                : IconButton(
                    icon: const Icon(
                      Icons.delete_rounded,
                      color: colorBittersweet,
                    ),
                    onPressed: () async {
                      try {
                        await roomQuery.update(id: room.id, isDeleted: true);
                        RoomsManagementController.to.getRooms();
                      } catch (e) {
                        codeError(e.toString());
                      }
                    },
                  ),
          )
        ],
      ),
    );
  }
}
