import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/pages/home/controller.dart';

import 'widgets/content/guests_count.dart';
import 'widgets/content/list_rooms.dart';
import 'widgets/side/side.dart';

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
              width: double.infinity,
              color: Colors.white,
              child: Stack(
                children: [
                  ImageFiltered(
                    imageFilter: ImageFilter.blur(
                      sigmaX: 3,
                      sigmaY: 3,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/backgrounds/SideBG.jpg'),
                          fit: BoxFit.fill,
                          colorFilter: ColorFilter.mode(
                            Colors.white70,
                            BlendMode.dstATop,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(33),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        ListRoomsWidget(),
                        SizedBox(height: 27),
                        GuestsExist(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
