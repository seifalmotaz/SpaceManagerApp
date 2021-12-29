import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/models/courses/src.dart';
import 'package:spacemanager/models/prices/src.dart';
import 'package:spacemanager/models/reservations/src.dart';
import 'package:spacemanager/models/rooms/src.dart';
import 'package:spacemanager/models/sessions/src.dart';

class LabelsSideWidget extends StatelessWidget {
  const LabelsSideWidget(
      {Key? key,
      this.course,
      this.price,
      this.reservation,
      this.room,
      this.timeHour = 0,
      this.timeMin = 0,
      required this.session})
      : super(key: key);

  final Reservation? reservation;
  final Session session;
  final Room? room;
  final Course? course;
  final Price? price;
  final int timeMin;
  final int timeHour;

  Widget label({
    required int index,
    required String title,
    required String value,
  }) {
    return SizedBox(
      width: Get.width * .27,
      child: ListTile(
        horizontalTitleGap: 0,
        leading: Text(
          index.toString(),
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 15,
          ),
        ),
        trailing: Text(
          value,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Check out:',
          style: TextStyle(
            color: Colors.blueGrey.shade900,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (price != null)
          label(
            index: 1,
            title: 'Price rate/guest/hour',
            value: '${price!.rate}\$',
          ),
        if (room != null)
          label(
            index: 1,
            title: 'Price rate/hour',
            value: '${room!.rate!.round()}\$',
          ),
        if (course != null)
          label(
            index: 1,
            title: 'Rate/hour',
            value: course!.rate.toString(),
          ),
        label(
          index: 2,
          title: 'Calculated time',
          value: timeHour.toString() +
              'H ' +
              (timeMin % 60).round().toString() +
              'M',
        ),
        if (price != null)
          label(
            index: 3,
            title: 'Guest count',
            value: session.guestsCount.toString() + ' guests',
          ),
        if (room != null)
          label(
            index: 3,
            title: 'Room capacity',
            value: room!.capacity.toString() + ' guests',
          ),
        if (course != null)
          label(
            index: 3,
            title: 'Course',
            value: course!.name.toString(),
          ),
        if (room != null)
          label(
            index: 4,
            title: 'Room name',
            value: room!.name.toString(),
          ),
      ],
    );
  }
}
