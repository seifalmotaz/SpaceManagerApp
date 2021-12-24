import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/models/prices/src.dart';

TextStyle basicStyle = const TextStyle(
  fontWeight: FontWeight.w600,
  color: Colors.black,
);

class PriceForm extends StatefulWidget {
  const PriceForm({
    Key? key,
    this.onCreate,
    this.firstDefault,
  }) : super(key: key);

  final Function? onCreate;
  final bool? firstDefault;

  @override
  State<PriceForm> createState() => _PriceFormState();
}

class _PriceFormState extends State<PriceForm> {
  GlobalKey<FormState> form = GlobalKey<FormState>();
  bool isDefault = false;
  FocusNode priceFocus = FocusNode();
  FocusNode disFocus = FocusNode();
  TextEditingController price = TextEditingController();
  TextEditingController dis = TextEditingController();

  check() async {
    if (form.currentState!.validate()) {
      late Price p;
      try {
        p = Price(
          description: dis.text.isEmpty ? null : dis.text,
          isDefault: isDefault,
          rate: double.parse(price.text),
        );
      } catch (e) {
        Get.snackbar(
          'Code error',
          e.toString(),
          isDismissible: false,
          colorText: Colors.white,
          maxWidth: Get.width * .3,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: BaseColors.primary,
          margin: const EdgeInsets.symmetric(vertical: 51),
        );
        return;
      }
      if (isDefault) {
        Price defaultPrice = await PriceCRUDQuery.readDefault();
        Price editedPrice = defaultPrice.copyWith(isDefault: false);
        await editedPrice.update();
      }
      await p.create();
      setState(() {
        price.text = '';
        dis.text = '';
        isDefault = false;
        priceFocus.requestFocus();
      });
    }
    if (widget.onCreate != null) widget.onCreate!();
  }

  @override
  void initState() {
    setState(() {
      isDefault = widget.firstDefault ?? false;
    });
    super.initState();
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
              'Add price list:',
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
                            hintText: 'Price/hour/user',
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
                          onFieldSubmitted: (String string) => check(),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFe4e6eb),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 11,
                              vertical: 5,
                            ),
                            border: InputBorder.none,
                            hintText: 'Description',
                            hintStyle: basicStyle.copyWith(color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 11),
                      SwitchListTile.adaptive(
                        value: isDefault,
                        title: const Text('Is the default price'),
                        onChanged: (value) => setState(() => isDefault = value),
                      ),
                      const SizedBox(height: 9),
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
