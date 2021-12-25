import 'package:flutter/material.dart';
import 'package:spacemanager/models/rooms/src.dart';

class BasicRoomDataWidget extends StatelessWidget {
  const BasicRoomDataWidget(
    this.room, {
    Key? key,
    required this.bg,
    required this.nameTextColor,
    required this.semiTextColor,
    required this.titlesTextColor,
  }) : super(key: key);
  final Room room;
  // other
  final Color bg;
  final Color nameTextColor;
  final Color semiTextColor;
  final Color titlesTextColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(23),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(21)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name:',
                style: TextStyle(
                  color: titlesTextColor,
                ),
              ),
              Text(
                room.name!,
                style: TextStyle(
                  color: nameTextColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Capacity: ',
                    style: TextStyle(
                      color: titlesTextColor,
                    ),
                  ),
                  Text(
                    room.capacity.toString(),
                    style: TextStyle(
                      color: semiTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    ' guest',
                    style: TextStyle(
                      color: titlesTextColor,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Price rate: ',
                    style: TextStyle(
                      color: titlesTextColor,
                    ),
                  ),
                  Text(
                    '${room.rate!.round()}\$',
                    style: TextStyle(
                      color: semiTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '/hour',
                    style: TextStyle(
                      color: titlesTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
