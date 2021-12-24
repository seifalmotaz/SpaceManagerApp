import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/constants/error_snack.dart';
import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/models/prices/src.dart';
import 'package:spacemanager/models/sessions/src.dart';
import 'package:spacemanager/screens/guests/widgets/guest_form_card.dart';
import 'package:spacemanager/screens/sessions/start_session/price_tile.dart';
import 'package:spacemanager/screens/sessions/start_session/shortcuts/just_submit.dart';
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
  int selectedPrice = 0;
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
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  clipBehavior: Clip.antiAlias,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 21, vertical: 17),
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
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(13),
                          child: SizedBox.expand(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                      width: constraints.maxWidth * .4,
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
                                      width: constraints.maxWidth * .4,
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
                                  ],
                                )),
                                SizedBox(
                                  height: 170,
                                  width: double.infinity,
                                  child: Wrap(
                                    spacing: 21,
                                    runSpacing: 21,
                                    children: [
                                      for (Price price in prices)
                                        PriceTileWidget(
                                          price,
                                          selectedPrice == price.id,
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
