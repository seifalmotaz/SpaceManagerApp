import 'package:flutter/material.dart';
import 'package:spaceapp/constant/base_colors.dart';

class GuestItem extends StatelessWidget {
  const GuestItem({Key? key}) : super(key: key);

  containerButton(String title) {
    return Container(
      padding: const EdgeInsets.all(9),
      margin: const EdgeInsets.only(bottom: 5),
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
                    const Text(
                      '@Seif Elmotaz',
                      style: TextStyle(
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
                const Text(
                  'Gender: Male',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: colorSemiText,
                  ),
                ),
                const SizedBox(height: 3),
                const Text(
                  'phone: 01122342626',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: colorSemiText,
                  ),
                ),
                const Text(
                  'email: seifelmotaz@outlook.com',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: colorSemiText,
                  ),
                ),
                const SizedBox(height: 3),
                const Text(
                  'National ID: 1273 5905 4328 96',
                  style: TextStyle(
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
              decoration: const BoxDecoration(
                color: colorWhiteBased2,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(13),
                ),
              ),
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(9),
                children: [
                  Row(
                    children: [
                      Flexible(child: containerButton('Start session')),
                      const SizedBox(width: 3),
                      Flexible(child: containerButton('Start room')),
                    ],
                  ),
                  containerButton('Reservation'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
