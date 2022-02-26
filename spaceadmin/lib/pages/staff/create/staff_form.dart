import 'package:flutter/material.dart';
import 'package:xwidgets/xwidgets.dart';

class StaffForm extends StatelessWidget {
  const StaffForm({
    Key? key,
    required this.name,
    required this.nationalId,
    required this.email,
    required this.phone,
    required this.password,
  }) : super(key: key);

  final TextEditingController name;
  final TextEditingController nationalId;
  final TextEditingController email;
  final TextEditingController phone;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Add new staff:',
          style: TextStyle(
            color: colorWhite,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 9),
        Row(
          children: [
            Flexible(
              child: WTextField(
                border: 21,
                hint: 'Name',
                icon: Icons.person,
                controller: name,
                color: Colors.white10,
                textColor: Colors.white70,
              ),
            ),
            const SizedBox(width: 9),
            Flexible(
              child: WTextField(
                border: 21,
                hint: 'National ID',
                icon: Icons.account_tree_rounded,
                controller: nationalId,
                color: Colors.white10,
                textColor: Colors.white70,
              ),
            ),
          ],
        ),
        const SizedBox(height: 9),
        Row(
          children: [
            Flexible(
              child: WTextField(
                border: 21,
                hint: 'Email',
                icon: Icons.email,
                controller: email,
                color: Colors.white10,
                textColor: Colors.white70,
              ),
            ),
            const SizedBox(width: 9),
            Flexible(
              child: WTextField(
                border: 21,
                hint: 'Phone',
                icon: Icons.phone,
                controller: phone,
                color: Colors.white10,
                textColor: Colors.white70,
                validator: (string) {
                  if (string == null || string.isEmpty) {
                    return 'Not valid';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 9),
        WTextField(
          border: 23,
          hint: 'Password',
          icon: Icons.password,
          controller: password,
          obscureText: true,
          color: Colors.white10,
          textColor: Colors.white70,
          validator: (string) {
            if (string == null || string.isEmpty) {
              return 'Not valid';
            }
            return null;
          },
        ),
      ],
    );
  }
}
