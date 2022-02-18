import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:spaceadmin/constant/base_colors.dart';
import 'package:spaceadmin/helpers/snacks.dart';
import 'package:spaceadmin/pages/prices/controllers/controller.dart';
import 'package:spaceadmin/widgets/text_field.dart';

class PriceForm extends StatefulWidget {
  const PriceForm({
    Key? key,
    this.onCreate,
  }) : super(key: key);

  final Function? onCreate;

  @override
  State<PriceForm> createState() => _PriceFormState();
}

class _PriceFormState extends State<PriceForm> {
  GlobalKey<FormState> form = GlobalKey<FormState>();
  FocusNode priceFocus = FocusNode();
  FocusNode discriptionFocus = FocusNode();
  FocusNode capacityFocus = FocusNode();
  TextEditingController price = TextEditingController();
  TextEditingController discription = TextEditingController();
  //
  bool isPerDay = false;
  bool isDefault = false;

  check() async {
    if (form.currentState!.validate()) {
      try {
        if (isDefault) {
          List<Price> prices = await priceQuery.find(isDeleted: false);
          if (prices.isNotEmpty) {
            for (Price item in prices) {
              await priceQuery.update(
                id: item.id,
                isDefault: false,
              );
            }
          }
        }
        await priceQuery.create(
          description: discription.text.isEmpty ? null : discription.text,
          rate: double.parse(price.text),
          isDefault: isDefault,
          isPerDay: isPerDay,
        );
        PricesController.to.getPrices();
      } catch (e) {
        codeErrorSnack(e.toString());
        return;
      }
      setState(() {
        price.text = '';
        discription.text = '';
        priceFocus.requestFocus();
        isPerDay = false;
        isDefault = false;
      });
    }
  }

  final checkBoxTextStyle = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: ColorPalette.semiTextColor,
  );

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
                  'Add price to list:',
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
                      border: 51,
                      hint: 'Discription',
                      focus: discriptionFocus,
                      controller: discription,
                      onFieldSubmitted: (String string) =>
                          capacityFocus.requestFocus(),
                    ),
                  ),
                  const Spacer(),
                  Flexible(
                    flex: 21,
                    child: WTextField(
                      border: 51,
                      hint: 'Price/guest/hour',
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
                  Flexible(
                    flex: 13,
                    child: Material(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(51),
                      child: CheckboxListTile(
                        tileColor: Colors.white,
                        title: Text("Is defaut", style: checkBoxTextStyle),
                        value: isDefault,
                        onChanged: (newValue) => setState(() {
                          isDefault = newValue ?? false;
                        }),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Flexible(
                    flex: 13,
                    child: Material(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(51),
                      child: CheckboxListTile(
                        tileColor: Colors.white,
                        title: Text("Per day", style: checkBoxTextStyle),
                        value: isPerDay,
                        onChanged: (newValue) => setState(() {
                          isPerDay = newValue ?? false;
                        }),
                      ),
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
