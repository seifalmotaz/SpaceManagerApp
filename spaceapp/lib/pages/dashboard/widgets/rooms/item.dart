import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/constant/base_colors.dart';

class RoomItem extends StatelessWidget {
  const RoomItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * .4,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(13),
            decoration: const BoxDecoration(
              color: colorWhite,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(13),
              ),
            ),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Name:',
                      style: TextStyle(color: colorSemiText),
                    ),
                    Text(
                      'Room 1',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colorText,
                        fontSize: 27,
                      ),
                    ),
                  ],
                )
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
              child: ListView.builder(
                itemCount: 4,
                padding: const EdgeInsets.all(9),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(9),
                    margin: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      color: colorWhite,
                      border:
                          Border.all(color: colorWhiteBased.withOpacity(.61)),
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.person,
                                  color: colorSemiText,
                                  size: 17,
                                ),
                                SizedBox(width: 3),
                                Text(
                                  'Seif Mizo',
                                  style: TextStyle(
                                    color: colorText,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.phone,
                                  color: colorSemiText,
                                  size: 17,
                                ),
                                SizedBox(width: 3),
                                Text(
                                  '0112232626',
                                  style: TextStyle(
                                    color: colorSemiText,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.circle_outlined,
                                  color: colorSemiText,
                                  size: 15,
                                ),
                                SizedBox(width: 3),
                                Text(
                                  'Reserved',
                                  style: TextStyle(
                                    color: colorSemiText,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 9),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Text(
                                  '00H ',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: colorSemiText,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  ' 00M',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: colorSemiText,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        colorMaldives),
                                  ),
                                  child: const Text(
                                    'View guest',
                                    style: TextStyle(
                                      color: colorWhite,
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                                const SizedBox(width: 3),
                                TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        colorBittersweet),
                                  ),
                                  child: const Text(
                                    'End',
                                    style: TextStyle(
                                      color: colorWhite,
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
