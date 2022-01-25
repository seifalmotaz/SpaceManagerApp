import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:database_system/database_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:spaceapp/constant/base_colors.dart';
import 'package:spaceapp/helpers/snacks.dart';
import 'package:spaceapp/widgets/text_field.dart';
import 'package:spaceapp/helpers/extention.dart';

import 'session_form.dart';

class StartSessionResults {
  final int? sessionId;
  final Guest guest;

  StartSessionResults({
    required this.guest,
    this.sessionId,
  });
}

class StartSessionScreen extends StatefulWidget {
  const StartSessionScreen(this.guest, {Key? key}) : super(key: key);

  final Guest guest;

  @override
  _StartSessionScreenState createState() => _StartSessionScreenState();
}

class _StartSessionScreenState extends State<StartSessionScreen> {
  bool dataEdited = false;
  final DateTime _dateTime = DateTime.now();
  List<Price> prices = [];
  Price? priceSelected;
  // data
  late Guest guest;
  TextEditingController guestCount = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController nationalId = TextEditingController();

  @override
  void initState() {
    guest = widget.guest;
    name.text = guest.name ?? '';
    email.text = guest.email ?? '';
    phone.text = guest.phone ?? '';
    nationalId.text = guest.nationalId ?? '';
    super.initState();
    getPrices();
  }

  setPrice(Price p) => setState(() {
        priceSelected = p;
      });

  getPrices() async {
    List<Price> _prices = await priceQuery.find(isDeleted: false);
    setState(() {
      prices = _prices;
      for (Price item in _prices) {
        if (item.isDefault) {
          priceSelected = item;
        }
      }
    });
  }

  saveStart(Function start, Function stop, ButtonState state) async {
    start();
    try {
      late Guest _guest;
      if (guest.id == 0) {
        int newGuest = await guestQuery.create(
          name: (name.text).getStringOrNull(),
          email: (email.text).getStringOrNull(),
          phone: (phone.text).getStringOrNull(),
          nationalId: (nationalId.text).getStringOrNull(),
        );
        _guest = await guestQuery.read(newGuest);
      } else if (dataEdited) {
        int newGuest = await guestQuery.update(
          id: guest.id,
          name: (name.text).getStringIfChanged(guest.name),
          email: (email.text).getStringIfChanged(guest.email),
          phone: (phone.text).getStringIfChanged(guest.phone),
          nationalId: (nationalId.text).getStringIfChanged(guest.nationalId),
        );
        _guest = await guestQuery.read(newGuest);
      } else {
        _guest = guest;
      }
      if (priceSelected!.isPerDay) {
        await guestSessionQuery.create(
          guestId: _guest.id,
          guestCount: int.tryParse((guestCount.text).getStringOrNull() ?? ''),
          priceId: priceSelected!.id,
          paidAmount: priceSelected!.rate,
          timeIn: _dateTime,
          timeOut: DateTime(
            _dateTime.year,
            _dateTime.month,
            _dateTime.day,
            11,
            59,
            50,
          ).toUtc(),
        );
        Get.back(
          result: StartSessionResults(
            guest: _guest,
          ),
        );
      } else {
        int session = await guestSessionQuery.create(
          guestId: _guest.id,
          guestCount: int.tryParse((guestCount.text).getStringOrNull() ?? ''),
          priceId: priceSelected!.id,
        );
        Get.back(
          result: StartSessionResults(
            sessionId: session,
            guest: _guest,
          ),
        );
      }
    } catch (e) {
      codeError(e.toString());
    }

    stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Stack(
        children: [
          SizedBox.expand(
            child: GestureDetector(onTap: () => Get.back()),
          ),
          Center(
            child: Container(
              width: 500,
              padding: const EdgeInsets.all(23),
              decoration: BoxDecoration(
                color: colorDarkLight,
                borderRadius: BorderRadius.circular(27),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Start session:',
                        style: TextStyle(
                          color: colorWhite,
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        Jiffy(_dateTime).jm,
                        style: const TextStyle(
                          fontSize: 21,
                          color: colorWhite,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 13),
                  SessionFormWidget(
                    prices: prices,
                    setPrice: setPrice,
                    guestCount: guestCount,
                    priceSelected: priceSelected,
                  ),
                  const SizedBox(height: 17),
                  const Text(
                    'Edit guest info:',
                    style: TextStyle(
                      color: colorWhite,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 9),
                  Row(
                    children: [
                      Flexible(
                        child: WTextField(
                          hint: 'Name',
                          controller: name,
                          color: Colors.white10,
                          textColor: Colors.white70,
                          onChange: (string) => setState(() {
                            dataEdited = true;
                          }),
                        ),
                      ),
                      const SizedBox(width: 9),
                      Flexible(
                        child: WTextField(
                          hint: 'National ID',
                          controller: nationalId,
                          color: Colors.white10,
                          textColor: Colors.white70,
                          onChange: (string) => setState(() {
                            dataEdited = true;
                          }),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 9),
                  Row(
                    children: [
                      Flexible(
                        child: WTextField(
                          hint: 'Email',
                          controller: email,
                          color: Colors.white10,
                          textColor: Colors.white70,
                          onChange: (string) => setState(() {
                            dataEdited = true;
                          }),
                        ),
                      ),
                      const SizedBox(width: 9),
                      Flexible(
                        child: WTextField(
                          hint: 'Phone',
                          controller: phone,
                          color: Colors.white10,
                          textColor: Colors.white70,
                          onChange: (string) => setState(() {
                            dataEdited = true;
                          }),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 17),
                  Center(
                    child: ArgonButton(
                      height: 35,
                      width: 300,
                      borderRadius: 13,
                      child: const Text(
                        'Save/Start',
                        style: TextStyle(
                          color: colorWhite,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      loader: Container(
                        padding: const EdgeInsets.all(10),
                        child: const SpinKitRotatingCircle(
                          color: Colors.white,
                        ),
                      ),
                      onTap: saveStart,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
