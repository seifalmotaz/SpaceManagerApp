import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spaceapp/pages/admin/pages/rooms/controller.dart';
import 'package:spaceapp/widgets/xwidgets.dart';

class RoomFormWidget extends StatefulWidget {
  const RoomFormWidget({
    Key? key,
    this.onCreate,
  }) : super(key: key);

  final Function? onCreate;

  @override
  State<RoomFormWidget> createState() => _RoomFormWidgetState();
}

class _RoomFormWidgetState extends State<RoomFormWidget> {
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
        RoomsManagementController.to.getRooms();
      } catch (e) {
        errorSnack('Error', e.toString());
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
    return Container(
      padding: const EdgeInsets.only(top: 13, bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white70,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(51),
          topRight: Radius.circular(51),
        ),
      ),
      child: Form(
        key: form,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Flexible(
              flex: 21,
              child: WTextField(
                border: 21,
                height: 45,
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
                border: 21,
                height: 45,
                hint: 'Capacity',
                focus: capacityFocus,
                controller: capacity,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Add capacity of the room.';
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
                border: 21,
                height: 45,
                hint: 'Price/hour',
                focus: priceFocus,
                controller: price,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Add price';
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
            FloatingActionButton(
              mini: true,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: check,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
