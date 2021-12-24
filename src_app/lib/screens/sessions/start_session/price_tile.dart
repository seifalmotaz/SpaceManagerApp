import 'package:flutter/material.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/models/prices/src.dart';

class PriceTileWidget extends StatelessWidget {
  const PriceTileWidget(this.price, this.isSelected, {Key? key})
      : super(key: key);

  final Price price;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      clipBehavior: Clip.none,
      padding: const EdgeInsets.all(23),
      decoration: BoxDecoration(
        color: isSelected ? BaseColors.primary : BaseColors.whiteBased,
        borderRadius: BorderRadius.circular(27),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price.rate!.round().toString() + '\$',
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.blueGrey.shade800,
                  fontWeight: FontWeight.bold,
                  fontSize: 41,
                ),
              ),
              Text(
                '/guest/hour',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isSelected ? Colors.white70 : Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
            ],
          ),
          const SizedBox(height: 11),
          Text(
            price.description!,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white70 : Colors.grey,
              fontWeight: FontWeight.bold,
              // fontSize: ,
            ),
          ),
        ],
      ),
    );
  }
}
