import 'package:flutter/material.dart';
import 'package:spacemanager/pages/home/widgets/side/main_side.dart';
import 'package:spacemanager/pages/home/widgets/side/mini_side.dart';

class Side extends StatelessWidget {
  const Side({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        MiniSide(),
        Expanded(child: MainSide()),
      ],
    );
  }
}
