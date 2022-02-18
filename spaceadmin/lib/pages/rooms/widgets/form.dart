import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:spaceadmin/constant/base_colors.dart';
import 'package:spaceadmin/helpers/snacks.dart';
import 'package:spaceadmin/pages/rooms/controllers/controller.dart';
import 'package:spaceadmin/widgets/text_field.dart';

class RoomForm extends StatefulWidget {
  const RoomForm({
    Key? key,
    this.onCreate,
  }) : super(key: key);

  final Function? onCreate;

  @override
  State<RoomForm> createState() => _RoomFormState();
}

class _RoomFormState extends State<RoomForm> {
  GlobalKey<FormState> form = GlobalKey<FormState>();
  FocusNode priceFocus = FocusNode();
  FocusNode nameFocus = FocusNode();
  FocusNode capacityFocus = FocusNode();
  TextEditingController price = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController capacity = TextEditingController();

  check() async {
    if (form.currentState!.validate()) {
      try {
        await roomQuery.create(
          rate: double.parse(price.text),
          name: name.text,
          capacity: int.parse(capacity.text),
        );
        RoomsController.to.getRooms();
      } catch (e) {
        codeErrorSnack(e.toString());
        return;
      }
      setState(() {
        price.text = '';
        name.text = '';
        capacity.text = '';
        priceFocus.requestFocus();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(33),
      sliver: SliverToBoxAdapter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Add room to list:',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ArgonButton(
                  borderRadius: 3,
                  height: 35,
                  width: Get.width * .1,
                  color: ColorPalette.bittersweet,
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  loader: Container(
                    padding: const EdgeInsets.all(10),
                    child: const SpinKitRotatingCircle(color: Colors.white),
                  ),
                  onTap: (startLoading, stopLoading, btnState) {
                    startLoading();
                    check();
                    stopLoading();
                  },
                ),
              ],
            ),
            const SizedBox(height: 17),
            Form(
              key: form,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(),
                  Flexible(
                    flex: 21,
                    child: WTextField(
                      border: 3,
                      hint: 'Name',
                      focus: nameFocus,
                      controller: name,
                      onFieldSubmitted: (String string) =>
                          capacityFocus.requestFocus(),
                    ),
                  ),
                  const Spacer(),
                  Flexible(
                    flex: 21,
                    child: WTextField(
                      border: 3,
                      hint: 'Capacity',
                      focus: capacityFocus,
                      controller: capacity,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Type capacity of the room.';
                        }
                        double? d = double.tryParse(value);
                        if (d == null) {
                          return 'Just numbers';
                        }
                        return null;
                      },
                    ),
                  ),
                  const Spacer(),
                  Flexible(
                    flex: 21,
                    child: WTextField(
                      border: 3,
                      hint: 'Price/hour',
                      focus: priceFocus,
                      controller: price,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Type price';
                        }
                        double? d = double.tryParse(value);
                        if (d == null) {
                          return 'Just numbers';
                        }
                        return null;
                      },
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
