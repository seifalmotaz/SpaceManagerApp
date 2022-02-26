import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spaceadmin/pages/prices/controller.dart';
import 'package:xwidgets/xwidgets.dart';

class PriceFormWidget extends StatefulWidget {
  const PriceFormWidget({
    Key? key,
    this.onCreate,
  }) : super(key: key);

  final Function? onCreate;

  @override
  State<PriceFormWidget> createState() => _PriceFormWidgetState();
}

class _PriceFormWidgetState extends State<PriceFormWidget> {
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
        PricesManagementController.to.getPrices();
      } catch (e) {
        codeError(e.toString());
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
    color: colorSemiText,
  );

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
                border: 51,
                height: 45,
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
                height: 45,
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
