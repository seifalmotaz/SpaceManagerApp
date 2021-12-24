import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/pages/home/controller.dart';
import 'package:spacemanager/pages/home/widgets/side.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      body: Row(
        children: [
          const Flexible(flex: 2, child: Side()),
          Flexible(
            flex: 6,
            child: Container(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
