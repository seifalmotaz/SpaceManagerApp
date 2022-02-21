import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xwidgets/xwidgets.dart';
import 'package:spaceapp/pages/guest/read/controller.dart';
import 'package:spaceapp/pages/guest/read/widgets/export/sessions.dart';

import 'widgets/data.dart';
import 'widgets/groups.dart';
import 'widgets/reservations.dart';

class ReadGuestPage extends UIResponsiveless {
  const ReadGuestPage(this.guestId, {Key? key}) : super(key: key);

  final int guestId;

  @override
  Widget? xBuild(BuildContext context, Size size) =>
      _build(context, (size.width - 600));

  @override
  Widget? largeBuild(BuildContext context, Size size) =>
      _build(context, (size.width - 600));

  @override
  Widget customBuild(BuildContext context, Size size) =>
      _build(context, (size.width - 600));

  @override
  Widget? mediumBuild(BuildContext context, Size size) =>
      _build(context, size.width);

  @override
  Widget smallBuild(BuildContext context, Size size) =>
      _build(context, size.width);

  Widget _build(BuildContext context, double sizeOfReservationsList) {
    ReadGuestController controller = Get.put(ReadGuestController(guestId));
    return WScaffold(
      title: 'Guest: $guestId',
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: topbarPadding.height!,
          horizontal: 13,
        ),
        child: Obx(() => Wrap(
              spacing: 17,
              runSpacing: 17,
              children: [
                if (controller.guest_ != null)
                  Column(
                    children: [
                      GuestDataWidget(controller.guest_!),
                      const SizedBox(height: 7),
                      ExportSessionsWidget(guestId)
                    ],
                  ),
                SizedBox(
                  width: sizeOfReservationsList,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Reservation groups:',
                        style: TextStyle(
                          color: colorDarkLight,
                          fontSize: 27,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 7),
                      GroupsListWidget(),
                      SizedBox(height: 11),
                      ReservationsListWidget(),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
