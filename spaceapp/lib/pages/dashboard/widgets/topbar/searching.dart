import 'package:flutter/material.dart';
import 'package:xwidgets/xwidgets.dart';
import 'package:spaceapp/pages/dashboard/controllers/controller.dart';
import 'package:spaceapp/pages/dashboard/controllers/searching.dart';

class SearchingBar extends StatelessWidget {
  const SearchingBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchingController searching = SearchingController.to;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                IconButton(
                  onPressed: () => searching.searching.value = false,
                  icon: const Icon(
                    Icons.search,
                    color: colorWhite,
                  ),
                ),
                Expanded(
                  child: WTextField(
                    border: 50,
                    fontsize: 23,
                    autoFocus: true,
                    hint: 'Search...',
                    controller: searching.searchingController,
                    onChange: (string) {
                      if (string != null) {
                        if (!string.startsWith(' ') && string.isNotEmpty) {
                          RegExp reg = RegExp(r"""[0-9]+$""");
                          if (reg.hasMatch(string)) {
                            searching.searchPhone(string);
                          } else {
                            searching.searchEmail(string);
                          }
                        } else {
                          searching.guests.value = [];
                        }
                      } else {
                        searching.guests.value = [];
                      }
                    },
                    focus: searching.searchingFocus,
                    color: colorLightBittersweet.withOpacity(.21),
                    textAlignVertical: TextAlignVertical.top,
                    textColor: colorWhite,
                    hintColor: colorWhiteBased2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.close,
              color: colorWhite,
            ),
            onPressed: () {
              SearchingController.to.searchingController.text = '';
              SearchingController.to.guests.value = [];
              SearchingController.to.searching.value = false;
              DashboardController.to.shortcutChildFocus.requestFocus();
            },
          ),
        ],
      ),
    );
  }
}
