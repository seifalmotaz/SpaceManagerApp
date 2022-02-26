import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:xwidgets/xwidgets.dart';
import 'package:spaceapp/pages/dashboard/screens/widgets/guest_form.dart';
import 'package:spaceapp/pages/guest/read/read.dart';

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
          Row(
            children: [
              Flexible(
                flex: 3,
                child: LayoutBuilder(builder: (context, con) {
                  return ArgonButton(
                    height: 35,
                    borderRadius: 13,
                    width: con.maxWidth,
                    padding: const EdgeInsets.all(11),
                    child: const Tooltip(
                      message: 'Save guest data and go to reservations page',
                      child: Text(
                        "Save",
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
                        int g = await guestQuery.create(
                          name: (name.text).getStringOrNull(),
                          email: (email.text).getStringOrNull(),
                          phone: (phone.text).getStringOrNull(),
                          nationalId: (nationalId.text).getStringOrNull(),
                        );
                        _guest = await guestQuery.read(g);
                      } else if (dataEdited) {
                        await guestQuery.update(
                          id: guest.id,
                          name: (name.text).getStringIfChanged(guest.name),
                          email: (email.text).getStringIfChanged(guest.email),
                          phone: (phone.text).getStringIfChanged(guest.phone),
                          nationalId: (nationalId.text)
                              .getStringIfChanged(guest.nationalId),
                        );
                        _guest = await guestQuery.read(guest.id);
                      } else {
                        _guest = guest;
                      }
                      widget.onSave(_guest);
                    },
                  );
                }),
              ),
              const SizedBox(width: 7),
              Flexible(
                child: WButton(
                  height: 35,
                  title: 'View',
                  padding: EdgeInsets.zero,
                  onTap: () {
                    Get.back();
                    Get.to(() => ReadGuestPage(guest.id));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
