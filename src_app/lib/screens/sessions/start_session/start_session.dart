import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/constants/error_snack.dart';
import 'package:spacemanager/models/courses/src.dart';
import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/models/prices/src.dart';
import 'package:spacemanager/models/sessions/src.dart';
import 'package:spacemanager/screens/guests/widgets/guest_form_card.dart';
import 'package:spacemanager/screens/sessions/start_session/price_tile.dart';
import 'package:spacemanager/screens/sessions/start_session/shortcuts.dart';
import 'package:spacemanager/widgets/form_field.dart';

/// Dialog
class StartSessionScreen extends StatefulWidget {
  const StartSessionScreen(this.guest, {Key? key}) : super(key: key);

  final Guest guest;

  @override
  _StartSessionScreenState createState() => _StartSessionScreenState();
}

class _StartSessionScreenState extends State<StartSessionScreen> {
  FocusNode shortcutChildFocus = FocusNode();
  List<Price> prices = [];
  List<Course> courses = [];
  int? selectedPrice;
  TextEditingController arrivalsCount = TextEditingController();

  getData() async {
    List<Price> p = await PriceCRUDQuery.list();
    setState(() {
      prices = p;
      for (Price price in prices) {
        if (price.isDefault!) {
          selectedPrice = price.id!;
        }
      }
    });

    List<Course> c = await CourseCRUDQuery.list();
    setState(() => courses = c);
  }

  startSession() async {
    int count = int.tryParse(arrivalsCount.text) ?? 1;
    Session session = Session(
      guestId: widget.guest.id,
      guestsCount: count,
      priceId: selectedPrice,
    );
    try {
      await session.start();
      Get.back();
    } catch (e) {
      errorSnack('Code error', e.toString());
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => shortcutChildFocus.requestFocus(),
      child: Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.enter):
              JustSubmitFormWithDefaultIntent(),
        },
        child: Actions(
          actions: {
            JustSubmitFormWithDefaultIntent: CallbackAction(
              onInvoke: (intent) => startSession(),
            ),
          },
          child: Focus(
            focusNode: shortcutChildFocus,
            autofocus: true,
            child: Container(
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.symmetric(horizontal: 21, vertical: 17),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(23),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: BaseColorss.darkLight,
                      child: Center(
                        child: EditGuestFormCardWidget(
                          widget.guest,
                          enablePass: false,
                          validDelete: false,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(17),
                      child: SizedBox.expand(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Start session:',
                              style: TextStyle(
                                color: Colors.blueGrey.shade900,
                                fontWeight: FontWeight.bold,
                                fontSize: 27,
                              ),
                            ),
                            const SizedBox(height: 13),
                            SizedBox(
                              child: TextCustomField(
                                controller: arrivalsCount,
                                hint: 'Arrivals count, default is 1',
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                            const SizedBox(height: 13),
                            SizedBox(
                              child: GFButton(
                                text: 'Start session',
                                textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                size: GFSize.LARGE,
                                fullWidthButton: true,
                                color: BaseColors.whiteBased,
                                onPressed: startSession,
                              ),
                            ),
                            const SizedBox(height: 17),
                            Wrap(
                              spacing: 21,
                              runSpacing: 21,
                              children: [
                                for (Price price in prices)
                                  GestureDetector(
                                    onTap: () => setState(() {
                                      selectedPrice = price.id;
                                    }),
                                    child: PriceTileWidget(
                                      price,
                                      selectedPrice == price.id,
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
