import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:spaceapp/widgets/xwidgets.dart';

class GuestDataWidget extends StatelessWidget {
  const GuestDataWidget(this.guest, {Key? key}) : super(key: key);

  final Guest guest;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(21),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${guest.id}.',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                (guest.name ?? 'Unknown'),
                style: const TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '> gender: ' + (guest.gender ?? 'unknown'),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: colorSemiText,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  '> phone: ' + (guest.phone ?? 'none'),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: colorSemiText,
                  ),
                ),
                Text(
                  '> email: ' + (guest.email ?? 'none'),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: colorSemiText,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  '> National ID: ' + (guest.readableNationalId() ?? 'none'),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: colorSemiText,
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
