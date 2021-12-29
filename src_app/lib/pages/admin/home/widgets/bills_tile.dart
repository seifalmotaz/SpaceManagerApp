import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillsTileWidget extends StatelessWidget {
  const BillsTileWidget({
    Key? key,
    required this.bg,
    required this.semiTextColor,
    required this.textColor,
    required this.title,
    required this.name,
    required this.content,
  }) : super(key: key);

  final Color bg;
  final Color semiTextColor;
  final Color textColor;

  final String name;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * .19,
      padding: const EdgeInsets.all(23),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: const BorderRadius.all(Radius.circular(21)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              color: semiTextColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                content,
                style: TextStyle(
                  color: textColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
