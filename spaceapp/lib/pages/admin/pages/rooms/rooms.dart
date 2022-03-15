import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceapp/pages/admin/pages/rooms/controller.dart';
import 'package:spaceapp/widgets/xwidgets.dart';

import 'widgets/form.dart';
import 'widgets/room_item.dart';

class RoomsManagementPage extends UIResponsiveless {
  const RoomsManagementPage({Key? key}) : super(key: key);

  @override
  Widget xBuild(BuildContext context, Size size) {
    RoomsManagementController controller = Get.put(RoomsManagementController());
    return WScaffold(
      title: 'Rooms management',
      child: Stack(
        children: [
          SizedBox.expand(
            child: Obx(() => ListView.builder(
                  itemCount: controller.rooms.length,
                  padding: const EdgeInsets.only(
                    top: kToolbarHeight * 1.5,
                    left: 33,
                    right: 33,
                    bottom: kToolbarHeight * 1.5,
                  ),
                  itemBuilder: (cntx, i) => RoomItemWidget(
                    index: i + 1,
                    room: controller.rooms[i],
                    key: ValueKey(controller.rooms[i].id),
                  ),
                )),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: RoomFormWidget(onCreate: () {}),
          ),
        ],
      ),
    );
  }
}
