import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceadmin/pages/staff/controller.dart';
import 'package:spaceadmin/widgets/responsive.dart';
import 'package:spaceadmin/widgets/scaffold.dart';
import 'package:xwidgets/xwidgets.dart' hide WScaffold;

import 'create/create.dart';

class StaffPage extends Responsiveless {
  const StaffPage({Key? key}) : super(key: key);

  @override
  Widget xBuild(BuildContext context, Size size) {
    StaffController controller = Get.put(StaffController());
    return WScaffold(
      title: 'Staff management',
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.person_add_alt_1,
          color: Colors.white,
        ),
        onPressed: () => Get.dialog(const WDialog(body: CreateStaffScreen())),
      ),
      child: Obx(() => GridView.builder(
            itemCount: controller.staff.length,
            padding: const EdgeInsets.only(
              top: kToolbarHeight * 1.5,
              left: 33,
              right: 33,
              bottom: kToolbarHeight * 1.5,
            ),
            itemBuilder: (cntx, i) => StaffItemWidget(
              index: i + 1,
              staff: controller.staff[i],
              key: ValueKey(controller.staff[i].id),
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 3,
              mainAxisSpacing: 3,
              mainAxisExtent: 150,
            ),
          )),
    );
  }
}

class StaffItemWidget extends StatelessWidget {
  const StaffItemWidget({
    Key? key,
    required this.index,
    required this.staff,
  }) : super(key: key);

  final int index;
  final Guest staff;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    staff.toString(),
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                  onPressed: () async {
                    await guestQuery.update(
                      id: staff.id,
                      isExpired: true,
                    );
                    StaffController.to.getData();
                  },
                ),
              ],
            ),
            const SizedBox(height: 7),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Email: ' + staff.email.toString(),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Phone: ' + staff.phone.toString(),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'National Id: ' + staff.nationalId.toString(),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
