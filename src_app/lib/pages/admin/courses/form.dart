import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:spacemanager/constants/error_snack.dart';
import 'package:spacemanager/models/courses/src.dart';

TextStyle basicStyle = const TextStyle(
  fontWeight: FontWeight.w600,
  color: Colors.black,
);

class CourseForm extends StatefulWidget {
  const CourseForm({
    Key? key,
    this.onCreate,
  }) : super(key: key);

  final Function? onCreate;

  @override
  State<CourseForm> createState() => _CourseFormState();
}

class _CourseFormState extends State<CourseForm> {
  GlobalKey<FormState> form = GlobalKey<FormState>();
  FocusNode priceFocus = FocusNode();
  FocusNode disFocus = FocusNode();
  FocusNode capacityFocus = FocusNode();
  TextEditingController price = TextEditingController();
  TextEditingController dis = TextEditingController();
  TextEditingController capacity = TextEditingController();

  check() async {
    if (form.currentState!.validate()) {
      late Course p;
      try {
        p = Course(
          name: dis.text.isEmpty ? null : dis.text,
          rate: double.parse(price.text),
          capacity: int.tryParse(capacity.text),
        );
      } catch (e) {
        errorSnack(
          'Code error',
          e.toString(),
        );
        return;
      }
      try {
        await p.create();
      } catch (e) {
        errorSnack(
          'Code error',
          e.toString(),
        );
        return;
      }

      setState(() {
        price.text = '';
        dis.text = '';
        capacity.text = '';
        priceFocus.requestFocus();
      });
    }
    if (widget.onCreate != null) widget.onCreate!();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.all(33),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add course to list:',
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 17),
            SizedBox(
              width: 500,
              child: Form(
                key: form,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: TextFormField(
                          style: basicStyle,
                          focusNode: priceFocus,
                          controller: price,
                          onFieldSubmitted: (String string) =>
                              disFocus.requestFocus(),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Type price';
                            }
                            double? d = double.tryParse(value);
                            if (d == null) {
                              return 'Just numbers';
                            }
                          },
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFe4e6eb),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 11),
                            border: InputBorder.none,
                            hintText: 'Price/hour/guest',
                            hintStyle: basicStyle.copyWith(color: Colors.grey),
                            prefixIcon: const Icon(
                              Icons.price_change_outlined,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 11),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: TextFormField(
                          style: basicStyle,
                          focusNode: disFocus,
                          controller: dis,
                          textAlignVertical: TextAlignVertical.top,
                          onFieldSubmitted: (String string) =>
                              capacityFocus.requestFocus(),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFe4e6eb),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 11,
                              vertical: 5,
                            ),
                            border: InputBorder.none,
                            hintText: 'Name',
                            hintStyle: basicStyle.copyWith(color: Colors.grey),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Not valid';
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 11),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: TextFormField(
                          style: basicStyle,
                          focusNode: capacityFocus,
                          controller: capacity,
                          onFieldSubmitted: (String string) => check(),
                          textAlignVertical: TextAlignVertical.top,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Type capacity of the room.';
                            }
                            double? d = double.tryParse(value);
                            if (d == null) {
                              return 'Just numbers';
                            }
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFe4e6eb),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 11,
                              vertical: 5,
                            ),
                            border: InputBorder.none,
                            hintText: 'Capacity',
                            hintStyle: basicStyle.copyWith(color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 11),
                      GFButton(
                        text: 'Add',
                        fullWidthButton: true,
                        color: const Color(0xFFe4e6eb),
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                        onPressed: () => check(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
