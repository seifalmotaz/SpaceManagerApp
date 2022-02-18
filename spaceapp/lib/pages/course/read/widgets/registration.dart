import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:spaceapp/constant/base_colors.dart';
import 'package:spaceapp/pages/guest/read/read.dart';

class RegistrationWidget extends StatefulWidget {
  const RegistrationWidget(this.registration, {Key? key}) : super(key: key);

  final CourseRegistration registration;

  @override
  State<RegistrationWidget> createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Student: ' + widget.registration.guest!.phone!,
                style: const TextStyle(
                  color: colorSemiText,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                widget.registration.guest.toString(),
                style: const TextStyle(
                  color: colorText,
                  fontWeight: FontWeight.bold,
                  fontSize: 27,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Group: ' + widget.registration.reservationsPrimaryName,
                style: const TextStyle(
                  color: colorSemiText,
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              Text(
                Jiffy(widget.registration.createdDate).yMMMEdjm,
                style: const TextStyle(
                  color: colorSemiText,
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () =>
                    Get.to(() => ReadGuestPage(widget.registration.guestId)),
                child: const Text(
                  'View',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: colorText,
                    fontSize: 16,
                  ),
                ),
              ),
              TextButton(
                child: const Text(
                  'Unregister',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: colorText,
                    fontSize: 16,
                  ),
                ),
                onPressed: () =>
                    Get.to(() => ReadGuestPage(widget.registration.guestId)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
