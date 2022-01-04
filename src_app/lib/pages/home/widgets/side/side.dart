import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/pages/home/widgets/side/main_side.dart';
import 'package:spacemanager/pages/home/widgets/side/mini_side.dart';

class Side extends StatelessWidget {
  const Side({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * .51,
      child: Row(
        children: const [
          MiniSide(),
          Expanded(child: MainSide()),
        ],
      ),
    );
  }
}
