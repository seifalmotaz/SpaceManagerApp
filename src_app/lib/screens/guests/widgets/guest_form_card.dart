import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/services/auth.dart';
import 'package:spacemanager/widgets/form_field.dart';

class EditGuestFormCardWidget extends StatefulWidget {
  const EditGuestFormCardWidget(
    this.guest, {
    Key? key,
    this.onDelete,
    this.validDelete = true,
    this.enablePass = true,
  }) : super(key: key);
  final Guest guest;
  final Function? onDelete;
  final bool validDelete;
  final bool enablePass;

  @override
  _EditGuestFormCardWidgetState createState() =>
      _EditGuestFormCardWidgetState();
}

class _EditGuestFormCardWidgetState extends State<EditGuestFormCardWidget> {
  GlobalKey<FormState> form = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController nationalId = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  void initState() {
    setState(() {
      name.text = widget.guest.name ?? '';
      email.text = widget.guest.email ?? '';
      phone.text = widget.guest.phone ?? '';
      nationalId.text = widget.guest.nationalId ?? '';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      width: Get.width * .23,
      padding: const EdgeInsets.all(27),
      decoration: BoxDecoration(
        color: BaseColorss.darkLight,
        borderRadius: BorderRadius.circular(21),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          if (widget.validDelete)
            Positioned(
              top: -10,
              right: -10,
              height: 30,
              width: 50,
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(13),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  child: const Icon(
                    Icons.delete_forever,
                    color: BaseColors.darkPrimary,
                  ),
                  onTap: () {
                    Get.snackbar(
                      'Delete staff',
                      'Are you sure that you want to delete price rate from list.',
                      isDismissible: false,
                      colorText: Colors.white,
                      maxWidth: Get.width * .3,
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: BaseColors.primary,
                      margin: const EdgeInsets.symmetric(vertical: 51),
                      mainButton: TextButton(
                        child: const Text(
                          'Delete it ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () async {
                          await widget.guest.delete();
                          if (widget.onDelete != null) {
                            widget.onDelete!();
                          }
                          Get.back();
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 13),
              Text(
                'Guest: @${name.text.isEmpty ? "Unknown" : name.text}',
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
                onFieldSubmitted: (string) async {
                  if (string.isNotEmpty) {
                    Guest g = Guest(id: widget.guest.id, name: string);
                    await g.update();
                  }
                },
              ),
              const SizedBox(height: 13),
              TextCustomField(
                hint: 'Email',
                controller: email,
                textColor: Colors.white70,
                color: Colors.white10,
                onFieldSubmitted: (string) async {
                  if (string.isNotEmpty && string.isEmail) {
                    Guest g = Guest(id: widget.guest.id, email: string);
                    await g.update();
                  } else {
                    email.text = widget.guest.email ?? '';
                  }
                },
              ),
              const SizedBox(height: 13),
              TextCustomField(
                hint: 'Phone',
                controller: phone,
                textColor: Colors.white70,
                color: Colors.white10,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onFieldSubmitted: (string) async {
                  if (string.isNotEmpty) {
                    Guest g = Guest(id: widget.guest.id, phone: string);
                    await g.update();
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
                onFieldSubmitted: (string) async {
                  if (string.isNotEmpty) {
                    Guest g = Guest(id: widget.guest.id, nationalId: string);
                    await g.update();
                  }
                },
              ),
              if (widget.enablePass) const SizedBox(height: 13),
              if (widget.enablePass)
                TextCustomField(
                  hint: 'Password',
                  controller: pass,
                  textColor: Colors.white70,
                  color: Colors.white10,
                  onFieldSubmitted: (string) async {
                    if (string.isNotEmpty) {
                      Guest g = Guest(id: widget.guest.id, password: string);
                      await g.updatePassword();
                      AuthService.to.updateGuestData();
                    }
                  },
                ),
              const SizedBox(height: 13),
            ],
          ),
        ],
      ),
    );
  }
}
