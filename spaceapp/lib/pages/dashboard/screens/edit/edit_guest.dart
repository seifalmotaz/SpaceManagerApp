import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:spaceapp/constant/base_colors.dart';
import 'package:spaceapp/helpers/extention.dart';
import 'package:spaceapp/pages/dashboard/screens/widgets/guest_form.dart';
import 'package:spaceapp/widgets/dialog.dart';

class EditGuestScreen extends StatefulWidget {
  const EditGuestScreen({Key? key, required this.guest, required this.onSave})
      : super(key: key);

  final Guest guest;
  final Function(Guest guest) onSave;

  @override
  State<EditGuestScreen> createState() => _EditGuestScreenState();
}

class _EditGuestScreenState extends State<EditGuestScreen> {
  late Guest guest;
  bool dataEdited = false;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController nationalId = TextEditingController();

  @override
  void initState() {
    guest = widget.guest;
    name.text = guest.name ?? '';
    email.text = guest.email ?? '';
    phone.text = guest.phone ?? '';
    nationalId.text = guest.nationalId ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WDialog(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GuestFormWidget(
            titleSize: 27,
            email: email,
            name: name,
            nationalId: nationalId,
            phone: phone,
            dataEdited: () => setState(() {
              dataEdited = true;
            }),
          ),
          const SizedBox(height: 17),
          ArgonButton(
            height: 35,
            width: 400,
            borderRadius: 13,
            padding: const EdgeInsets.all(11),
            child: const Tooltip(
              message: 'Save guest data and go to reservations page',
              child: Text(
                "Save/Reserve",
                style: TextStyle(
                  color: colorWhite,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            loader: Container(
              padding: const EdgeInsets.all(10),
              child: const SpinKitRotatingCircle(
                color: Colors.white,
              ),
            ),
            onTap: (startLoading, stopLoading, btnState) async {
              late Guest _guest;
              if (guest.id == 0) {
                int newGuest = await guestQuery.create(
                  name: (name.text).getStringOrNull(),
                  email: (email.text).getStringOrNull(),
                  phone: (phone.text).getStringOrNull(),
                  nationalId: (nationalId.text).getStringOrNull(),
                );
                _guest = await guestQuery.read(newGuest);
              } else if (dataEdited) {
                int newGuest = await guestQuery.update(
                  id: guest.id,
                  name: (name.text).getStringIfChanged(guest.name),
                  email: (email.text).getStringIfChanged(guest.email),
                  phone: (phone.text).getStringIfChanged(guest.phone),
                  nationalId:
                      (nationalId.text).getStringIfChanged(guest.nationalId),
                );
                _guest = await guestQuery.read(newGuest);
              } else {
                _guest = guest;
              }
              widget.onSave(_guest);
            },
          ),
        ],
      ),
    );
  }
}
