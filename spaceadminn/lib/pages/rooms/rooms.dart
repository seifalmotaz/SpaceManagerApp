import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceadmin/pages/rooms/controllers/controller.dart';
import 'package:spaceadmin/pages/rooms/widgets/form.dart';
import 'package:spaceadmin/widgets/appbar.dart';

import 'widgets/room.dart';

class RoomsPage extends StatefulWidget {
  const RoomsPage({Key? key}) : super(key: key);

  @override
  _RoomsPageState createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        key: GlobalKey(),
        slivers: [
          const WAppBar(title: 'Edit rooms'),
          const RoomForm(),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              vertical: 27,
              horizontal: 33,
            ),
            sliver: Obx(
              () => RoomsController.to.rooms.isEmpty
                  ? const SliverToBoxAdapter(
                      child: Text(
                        'No rooms.',
                        style: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w600,
                          fontSize: 21,
                        ),
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (ctx, i) => RoomItemWidget(
                          index: i + 1,
                          room: RoomsController.to.rooms[i],
                        ),
                        childCount: RoomsController.to.rooms.length,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
