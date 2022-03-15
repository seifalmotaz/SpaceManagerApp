import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:spaceapp/pages/admin/pages/prices/controller.dart';
import 'package:spaceapp/widgets/xwidgets.dart';

class PriceItemWidget extends StatefulWidget {
  const PriceItemWidget({Key? key, required this.price, required this.index})
      : super(key: key);

  final Price price;
  final int index;

  @override
  State<PriceItemWidget> createState() => _PriceItemWidgetState();
}

class _PriceItemWidgetState extends State<PriceItemWidget> {
  bool isPerDay = false;
  bool isDefault = false;

  @override
  void initState() {
    setState(() {
      isPerDay = widget.price.isPerDay;
      isDefault = widget.price.isDefault;
    });
    super.initState();
  }

  final checkBoxTextStyle = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: colorSemiText,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 13),
      decoration: BoxDecoration(
        color: widget.price.isDeleted
            ? ColorPalette.lightBittersweet
            : Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 13,
            spreadRadius: 7,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 3,
            child: Row(
              children: [
                Text(
                  "${widget.index}.  ",
                  style: const TextStyle(
                    color: colorSemiText,
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.price.description,
                    style: const TextStyle(
                      color: colorSemiText,
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 3,
            child: IgnorePointer(
              ignoring: widget.price.isDeleted,
              child: Opacity(
                opacity: widget.price.isDeleted ? .51 : 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Material(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.circular(51),
                        child: CheckboxListTile(
                          value: isDefault,
                          key: ValueKey(isDefault),
                          tileColor: Colors.grey[50],
                          title: Text("Is defaut", style: checkBoxTextStyle),
                          onChanged: (value) async {
                            try {
                              if (value!) {
                                List<Price> prices =
                                    await priceQuery.find(isDeleted: false);
                                if (prices.isNotEmpty) {
                                  for (Price item in prices) {
                                    await priceQuery.update(
                                      id: item.id,
                                      isDefault: false,
                                    );
                                  }
                                }
                                await priceQuery.update(
                                  id: widget.price.id,
                                  isDefault: true,
                                );
                                setState(() {
                                  isDefault = true;
                                });
                                PricesManagementController.to.getPrices();
                              }
                            } catch (e) {
                              codeError(e.toString());
                            }
                          },
                        ),
                      ),
                    ),
                    // const SizedBox(width: 13),
                    // Flexible(
                    //   child: Material(
                    //     clipBehavior: Clip.antiAlias,
                    //     borderRadius: BorderRadius.circular(51),
                    //     child: CheckboxListTile(
                    //       value: isPerDay,
                    //       tileColor: Colors.grey[50],
                    //       title: Text("Per day", style: checkBoxTextStyle),
                    //       onChanged: (value) async {
                    //         try {
                    //           await priceQuery.update(
                    //             id: widget.price.id,
                    //             isPerDay: value ?? false,
                    //           );
                    //           setState(() {
                    //             isPerDay = value!;
                    //           });
                    //         } catch (e) {
                    //           codeError(e.toString());
                    //         }
                    //       },
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(width: 13),
                    Text(
                      "Price rate: ${widget.price.rate}/hour",
                      style: TextStyle(
                        color: colorSemiText.withOpacity(.81),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: widget.price.isDeleted
                ? IconButton(
                    icon: const Icon(
                      Icons.restore_from_trash,
                      color: ColorPalette.bittersweet,
                    ),
                    onPressed: () async {
                      try {
                        await priceQuery.update(
                            id: widget.price.id, isDeleted: false);
                        PricesManagementController.to.getPrices();
                      } catch (e) {
                        codeError(e.toString());
                      }
                    },
                  )
                : IconButton(
                    icon: const Icon(
                      Icons.delete_rounded,
                      color: ColorPalette.bittersweet,
                    ),
                    onPressed: () async {
                      try {
                        await priceQuery.update(
                            id: widget.price.id, isDeleted: true);
                        PricesManagementController.to.getPrices();
                      } catch (e) {
                        codeError(e.toString());
                      }
                    },
                  ),
          )
        ],
      ),
    );
  }
}
