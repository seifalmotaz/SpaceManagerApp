import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spaceadmin/pages/staff/controller.dart';
import 'package:xwidgets/xwidgets.dart';

import 'staff_form.dart';

class CreateStaffScreen extends StatefulWidget {
  const CreateStaffScreen({Key? key}) : super(key: key);

  @override
  State<CreateStaffScreen> createState() => _CreateStaffScreenState();
}

class _CreateStaffScreenState extends State<CreateStaffScreen> {
  GlobalKey<FormState> form = GlobalKey<FormState>();
  bool isAdmin = false;

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController nationalId = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          key: form,
          child: StaffForm(
            name: name,
            nationalId: nationalId,
            email: email,
            phone: phone,
            password: password,
          ),
        ),
        SwitchListTile(
          title: const Text(
            'Is this staff admin',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          value: isAdmin,
          onChanged: (v) => setState(() {
            isAdmin = v;
          }),
        ),
        LayoutBuilder(builder: (context, cons) {
          return ArgonButton(
            height: 45,
            borderRadius: 21,
            width: cons.maxWidth,
            child: const Text(
              'Save',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: (start, stop, state) async {
              start();
              if (form.currentState?.validate() ?? false) {
                List<Map<String, dynamic>> exist = (await DBService.to.db.query(
                  'guest',
                  columns: ['id'],
                  where: 'phone = ? OR email = ?',
                  whereArgs: [phone.text, email.text],
                ));

                if (exist.isNotEmpty) {
                  stop();
                  return errorSnack(
                    'Staff founded',
                    'There is a staff with the same phone or email.',
                  );
                }

                try {
                  await guestQuery.create(
                    phone: phone.text,
                    password: password.text,
                    isStaff: true,
                    isAdmin: isAdmin,
                    name: name.text.getStringOrNull(),
                    email: email.text.getStringOrNull(),
                    nationalId: nationalId.text.getStringOrNull(),
                  );
                  StaffController.to.getData();
                  Get.back();
                } catch (e) {
                  codeError(e.toString());
                }
              }
              stop();
            },
          );
        })
      ],
    );
  }
}
