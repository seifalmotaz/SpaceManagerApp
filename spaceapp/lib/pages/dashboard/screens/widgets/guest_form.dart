import 'package:flutter/material.dart';
import 'package:spaceapp/widgets/xwidgets.dart';

class GuestFormWidget extends StatelessWidget {
  const GuestFormWidget({
    Key? key,
    this.titleSize,
    required this.email,
    required this.name,
    required this.nationalId,
    required this.phone,
    required this.dataEdited,
  }) : super(key: key);

  final double? titleSize;
  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController phone;
  final TextEditingController nationalId;

  final Function() dataEdited;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Edit guest info:',
          style: TextStyle(
            color: colorWhite,
            fontSize: titleSize ?? 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 9),
        Row(
          children: [
            Flexible(
              child: WTextField(
                hint: 'Name',
                controller: name,
                color: Colors.white10,
                textColor: Colors.white70,
                onChange: (string) => dataEdited(),
              ),
            ),
            const SizedBox(width: 9),
            Flexible(
              child: WTextField(
                hint: 'National ID',
                controller: nationalId,
                color: Colors.white10,
                textColor: Colors.white70,
                onChange: (string) => dataEdited(),
              ),
            ),
          ],
        ),
        const SizedBox(height: 9),
        Row(
          children: [
            Flexible(
              child: WTextField(
                hint: 'Email',
                controller: email,
                color: Colors.white10,
                textColor: Colors.white70,
                onChange: (string) => dataEdited(),
              ),
            ),
            const SizedBox(width: 9),
            Flexible(
              child: WTextField(
                hint: 'Phone',
                controller: phone,
                color: Colors.white10,
                textColor: Colors.white70,
                onChange: (string) => dataEdited(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
