import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:spaceapp/widgets/xwidgets.dart';

class PriceItemWidget extends StatelessWidget {
  const PriceItemWidget({
    Key? key,
    required this.price,
    required this.setPrice,
    required this.priceSelected,
  }) : super(key: key);

  final Price price;
  final Price? priceSelected;
  final Function() setPrice;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: setPrice,
      child: Tooltip(
        padding: const EdgeInsets.all(7),
        textStyle: const TextStyle(
          fontSize: 16,
          color: colorWhiteBased,
          fontWeight: FontWeight.w600,
        ),
        message: price.description,
        child: Container(
          clipBehavior: Clip.antiAlias,
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(11),
          decoration: BoxDecoration(
            color: colorDarkLighter,
            borderRadius: BorderRadius.circular(27),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(TextSpan(
                children: [
                  TextSpan(
                    text: '${price.rate.round()}\$',
                    style: const TextStyle(
                      color: colorWhite,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (price.isPerDay)
                    const TextSpan(
                      text: '/day/guest',
                      style: TextStyle(
                        color: colorWhite,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  if (!price.isPerDay)
                    const TextSpan(
                      text: '/hour/guest',
                      style: TextStyle(
                        color: colorWhite,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                ],
              )),
              if (priceSelected?.id == price.id)
                const Icon(
                  Icons.circle_outlined,
                  color: Colors.blue,
                  size: 21,
                ),
              if (priceSelected?.id != price.id)
                const Icon(
                  Icons.circle_outlined,
                  color: colorDarkLightest,
                  size: 21,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
