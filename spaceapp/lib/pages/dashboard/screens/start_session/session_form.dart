import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:spaceapp/constant/base_colors.dart';
import 'package:spaceapp/widgets/text_field.dart';

import 'price_item.dart';

class SessionFormWidget extends StatelessWidget {
  const SessionFormWidget({
    Key? key,
    required this.prices,
    required this.setPrice,
    required this.guestCount,
    required this.priceSelected,
  }) : super(key: key);

  final List<Price> prices;
  final TextEditingController guestCount;
  final Function(Price id) setPrice;
  final Price? priceSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WTextField(
          hint: 'Guests count',
          controller: guestCount,
          color: Colors.white10,
          textColor: Colors.white70,
        ),
        const SizedBox(height: 11),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: prices.isEmpty
              ? const SpinKitRotatingCircle(
                  color: colorDarkLighter,
                  size: 27,
                )
              : GridView.builder(
                  shrinkWrap: true,
                  itemCount: prices.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 9,
                    crossAxisSpacing: 7,
                    mainAxisExtent: 51,
                  ),
                  itemBuilder: (context, index) {
                    Price price = prices[index];
                    return PriceItemWidget(
                      price,
                      setPrice,
                      priceSelected,
                    );
                  },
                ),
        ),
      ],
    );
  }
}
