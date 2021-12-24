import 'package:flutter/material.dart';
import 'package:spacemanager/models/prices/src.dart';
import 'package:spacemanager/pages/admin/base.dart';
import 'package:spacemanager/pages/admin/prices/form.dart';
import 'package:spacemanager/pages/admin/prices/list.dart';

class EditPricesPage extends StatefulWidget {
  const EditPricesPage({Key? key}) : super(key: key);

  @override
  _EditPricesPageState createState() => _EditPricesPageState();
}

class _EditPricesPageState extends State<EditPricesPage> {
  List<Price> prices = [];

  getData() async {
    List<Price> p = await PriceCRUDQuery.list();
    setState(() {
      prices = p;
    });
  }

  checkDefault() {
    Price? defaultValue;
    for (Price price in prices) {
      if (price.isDefault!) {
        defaultValue = price;
      }
    }
    return defaultValue == null ? false : true;
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdminBaseLayout(Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: PriceForm(
            onCreate: getData,
            firstDefault: checkDefault(),
          ),
        ),
        Flexible(
          flex: 2,
          child: PricesList(
            prices: prices,
            onDelete: getData,
          ),
        ),
      ],
    ));
  }
}
