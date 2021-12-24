import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/widgets/form_field.dart';

class StaffFormWidget extends StatefulWidget {
  const StaffFormWidget({
    Key? key,
    this.onCreate,
  }) : super(key: key);

  final Function? onCreate;

  @override
  _StaffFormWidgetState createState() => _StaffFormWidgetState();
}

class _StaffFormWidgetState extends State<StaffFormWidget> {
  GlobalKey<FormState> form = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController nationalId = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool isAdmin = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form,
      child: Container(
        width: Get.width * .23,
        padding: const EdgeInsets.all(27),
        decoration: BoxDecoration(
          color: BaseColorss.darkLight,
          borderRadius: BorderRadius.circular(21),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Staff: @${name.text.isEmpty ? "Add staff" : name.text}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 27,
              ),
            ),
            const SizedBox(height: 17),
            TextCustomField(
              hint: 'Name',
              controller: name,
              textColor: Colors.white70,
              color: Colors.white10,
              validator: (string) {
                if (string == null || string.isEmpty) {
                  return 'Not valid';
                }
              },
            ),
            const SizedBox(height: 13),
            TextCustomField(
              hint: 'Email',
              controller: email,
              textColor: Colors.white70,
              color: Colors.white10,
            ),
            const SizedBox(height: 13),
            TextCustomField(
              hint: 'Phone',
              controller: phone,
              textColor: Colors.white70,
              color: Colors.white10,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (string) {
                if (string == null || string.isEmpty) {
                  return 'Not valid';
                }
              },
            ),
            const SizedBox(height: 13),
            TextCustomField(
              hint: 'National ID',
              controller: nationalId,
              textColor: Colors.white70,
              color: Colors.white10,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const SizedBox(height: 13),
            TextCustomField(
              hint: 'Password',
              controller: pass,
              textColor: Colors.white70,
              color: Colors.white10,
              obscureText: true,
              validator: (string) {
                if (string == null || string.isEmpty) {
                  return 'Not valid';
                }
              },
            ),
            const SizedBox(height: 13),
            SwitchListTile.adaptive(
              value: isAdmin,
              activeColor: BaseColors.primary,
              inactiveThumbColor: BaseColors.darkPrimary,
              title: const Text(
                'Is admin guest:',
                style: TextStyle(color: Colors.white),
              ),
              onChanged: (value) {
                setState(() {
                  isAdmin = value;
                });
              },
            ),
            const SizedBox(height: 15),
            GFButton(
              text: 'Save',
              size: GFSize.LARGE,
              fullWidthButton: true,
              onPressed: () async {
                if (form.currentState!.validate()) {
                  Guest guest = Guest(
                    password: pass.text,
                    phone: phone.text,
                    name: name.text,
                    isStaff: true,
                    isAdmin: isAdmin,
                    nationalId:
                        nationalId.text.isEmpty ? null : nationalId.text,
                    email: email.text.isEmpty ? null : email.text,
                  );
                  await guest.create();
                  if (widget.onCreate != null) {
                    widget.onCreate!();
                  }
                  setState(() {
                    name.text = '';
                    email.text = '';
                    nationalId.text = '';
                    pass.text = '';
                    phone.text = '';
                    isAdmin = false;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
