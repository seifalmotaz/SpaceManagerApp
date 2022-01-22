import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:spaceapp/constant/base_colors.dart';

class GuestItem extends StatelessWidget {
  const GuestItem(this.guest, {Key? key}) : super(key: key);

  final Guest guest;

  containerButton(String title, {bool last = false}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(9),
        margin: last ? null : const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          color: colorWhite,
          border: Border.all(
            color: colorWhiteBased.withOpacity(.61),
          ),
          borderRadius: BorderRadius.circular(11),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: colorText,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(23),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(17),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '@' + (guest.name ?? 'Unknown'),
                      style: const TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(9),
                      decoration: BoxDecoration(
                        color: colorWhiteBased,
                        borderRadius: BorderRadius.circular(23),
                      ),
                      child: const Text(
                        '9',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: colorText,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Text(
                  'gender: ' + (guest.gender ?? 'unknown'),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: colorSemiText,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'phone: ' + (guest.phone ?? 'none'),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: colorSemiText,
                  ),
                ),
                Text(
                  'email: ' + (guest.email ?? 'none'),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: colorSemiText,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'National ID: ' + (guest.readableNationalId() ?? 'none'),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: colorSemiText,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              padding: const EdgeInsets.all(9),
              decoration: const BoxDecoration(
                color: colorWhiteBased2,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(13),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(child: containerButton('Start session')),
                      const SizedBox(width: 3),
                      Flexible(child: containerButton('Start room')),
                    ],
                  ),
                  containerButton(
                    'Reservation',
                    last: true,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
