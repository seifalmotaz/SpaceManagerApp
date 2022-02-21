import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:xwidgets/xwidgets.dart';
import 'package:spaceapp/helpers/monitoring.dart';
import 'package:spaceapp/helpers/snacks.dart';
import 'package:spaceapp/pages/course/list/controller.dart';

class CourseFormWidget extends StatefulWidget {
  const CourseFormWidget({
    Key? key,
    required this.course,
  }) : super(key: key);

  final Course course;

  @override
  State<CourseFormWidget> createState() => _CourseFormWidgetState();
}

class _CourseFormWidgetState extends State<CourseFormWidget> {
  GlobalKey<FormState> form = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController dis = TextEditingController();
  TextEditingController price = TextEditingController();

  @override
  void initState() {
    name.text = widget.course.name;
    dis.text = widget.course.description;
    price.text = widget.course.totalPrice.round().toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form,
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: colorWhite,
          borderRadius: BorderRadius.circular(21),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Edit course info',
              style: TextStyle(
                color: colorDarkLight,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 7),
            WTextField(
              hint: 'Name',
              controller: name,
              color: colorWhiteBased2,
              validator: (string) {
                if (string == null || string.isEmpty) return 'Not Valid';
                return null;
              },
            ),
            const SizedBox(height: 7),
            WTextField(
              hint: 'Description',
              controller: dis,
              color: colorWhiteBased2,
              validator: (string) {
                if (string == null || string.isEmpty) return 'Not Valid';
                return null;
              },
            ),
            const SizedBox(height: 7),
            WTextField(
              hint: 'Total price',
              controller: price,
              color: colorWhiteBased2,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (string) {
                if (string == null || string.isEmpty) return 'Not Valid';
                return null;
              },
            ),
            const SizedBox(height: 11),
            Row(
              children: [
                Flexible(
                  flex: 3,
                  child: WButton(
                    title: 'Save',
                    color: colorWhite,
                    textColor: colorDarkLight,
                    onTap: () async => await MonitoringApp.errorTrack(() async {
                      await courseQuery.update(
                        id: widget.course.id,
                        description: dis.text,
                        name: name.text,
                        totalPrice: double.tryParse(price.text),
                      );
                      successSnack('Saved', 'All data is saved');
                      CoursesListController.to.resetData();
                    }),
                  ),
                ),
                const SizedBox(width: 7),
                Flexible(
                  child: WButton(
                    title: 'Delete',
                    color: colorBittersweet,
                    textColor: colorWhite,
                    border: false,
                    onTap: () async => await MonitoringApp.errorTrack(() async {
                      await courseQuery.update(
                        id: widget.course.id,
                        isDeleted: true,
                      );
                      successSnack('Deleted', 'All data is deleted');
                      Get.back(closeOverlays: true);
                      CoursesListController.to.resetData();
                    }),
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
