import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:spaceapp/widgets/xwidgets.dart';

class RoomItemWidget extends StatelessWidget {
  const RoomItemWidget(this.room, this.setroom, this.roomSelected, {Key? key})
      : super(key: key);

  final Room room;
  final int roomSelected;
  final Function(int id) setroom;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setroom(room.id),
      child: Tooltip(
        padding: const EdgeInsets.all(7),
        richMessage: TextSpan(children: [
          TextSpan(
            text: room.name + '\n',
            style: const TextStyle(
              fontSize: 16,
              color: colorWhiteBased,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: room.capacity.toString() + ' guests \n',
            style: const TextStyle(
              fontSize: 16,
              color: colorWhiteBased,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: room.rate.round().toString() + r'$',
            style: const TextStyle(
              fontSize: 16,
              color: colorWhiteBased,
              fontWeight: FontWeight.w600,
            ),
          ),
        ]),
        child: Container(
          clipBehavior: Clip.antiAlias,
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(11),
          decoration: BoxDecoration(
            color: colorDarkLighter,
            borderRadius: BorderRadius.circular(27),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(TextSpan(
                children: [
                  TextSpan(
                    text: '${room.rate.round()}\$',
                    style: const TextStyle(
                      color: colorWhite,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(
                    text: '/hour/guest',
                    style: TextStyle(
                      color: colorWhite,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )),
              if (roomSelected == room.id)
                const Icon(
                  Icons.circle_outlined,
                  color: Colors.blue,
                  size: 21,
                ),
              if (roomSelected != room.id)
                const Icon(
                  Icons.circle_outlined,
                  color: colorDarkLightest,
                  size: 21,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
