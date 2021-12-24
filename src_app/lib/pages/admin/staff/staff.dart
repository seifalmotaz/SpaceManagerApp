import 'package:flutter/material.dart';
import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/pages/admin/base.dart';
import 'package:spacemanager/pages/admin/staff/staff_form.dart';
import 'package:spacemanager/screens/guests/widgets/guest_form_card.dart';

class EditStaffPage extends StatefulWidget {
  const EditStaffPage({Key? key}) : super(key: key);

  @override
  _EditStaffPageState createState() => _EditStaffPageState();
}

class _EditStaffPageState extends State<EditStaffPage> {
  List<Guest> guests = [];
  getData() async {
    List<Guest> g = await GuestFindQuery.getAllStaff();
    setState(() {
      guests = g;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdminBaseLayout(SingleChildScrollView(
      padding: const EdgeInsets.all(33),
      child: Wrap(
        spacing: 21,
        runSpacing: 21,
        children: [
          for (Guest guest in guests)
            EditGuestFormCardWidget(
              guest,
              onDelete: getData,
            ),
          StaffFormWidget(onCreate: getData)
        ],
      ),
    ));
  }
}
