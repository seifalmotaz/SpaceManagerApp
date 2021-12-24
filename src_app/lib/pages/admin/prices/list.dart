import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/models/prices/src.dart';

class PricesList extends StatefulWidget {
  const PricesList({
    Key? key,
    required this.prices,
    this.onDelete,
  }) : super(key: key);

  final List<Price> prices;
  final Function? onDelete;

  @override
  State<PricesList> createState() => _PricesListState();
}

class _PricesListState extends State<PricesList> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: controller,
      isAlwaysShown: true,
      child: SingleChildScrollView(
        controller: controller,
        padding: const EdgeInsets.all(51),
        child: Wrap(
          spacing: 21,
          runSpacing: 21,
          children: [
            for (Price price in widget.prices)
              Container(
                width: 200,
                clipBehavior: Clip.none,
                padding: const EdgeInsets.all(23),
                decoration: BoxDecoration(
                  color: price.isDefault!
                      ? BaseColors.primary
                      : BaseColors.whiteBased,
                  borderRadius: BorderRadius.circular(27),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: -10,
                      right: -10,
                      height: 30,
                      width: 30,
                      child: Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(13),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          child: Icon(
                            Icons.delete_forever,
                            color: price.isDefault! ? Colors.white : Colors.red,
                          ),
                          onTap: () {
                            if (!price.isDefault!) {
                              Get.snackbar(
                                'Delete price',
                                'Are you sure that you want to delete price rate from list.',
                                isDismissible: false,
                                colorText: Colors.white,
                                maxWidth: Get.width * .3,
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: BaseColors.primary,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 51),
                                mainButton: TextButton(
                                  child: const Text(
                                    'Delete it ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () async {
                                    await price.delete();
                                    if (widget.onDelete != null) {
                                      widget.onDelete!();
                                    }
                                    Get.back();
                                  },
                                ),
                              );
                            } else {
                              Get.snackbar(
                                'Can not elete price',
                                'This is the default price so you can not delete it but you can replace it by adding new price with default value is true.',
                                colorText: Colors.white,
                                maxWidth: Get.width * .3,
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: BaseColors.primary,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 51),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              price.rate!.round().toString() + '\$',
                              style: TextStyle(
                                color: price.isDefault!
                                    ? Colors.white
                                    : Colors.blueGrey.shade800,
                                fontWeight: FontWeight.bold,
                                fontSize: 41,
                              ),
                            ),
                            Text(
                              '/guest/hour',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: price.isDefault!
                                    ? Colors.white70
                                    : Colors.grey,
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
                            color:
                                price.isDefault! ? Colors.white70 : Colors.grey,
                            fontWeight: FontWeight.bold,
                            // fontSize: ,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
