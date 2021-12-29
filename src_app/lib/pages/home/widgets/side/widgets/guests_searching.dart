import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/pages/home/controllers/controller.dart';
import 'package:spacemanager/screens/guests/widgets/guest_session_card.dart';
import 'package:spacemanager/screens/sessions/end_session/end_session.dart';
import 'package:spacemanager/screens/sessions/start_session/start_session.dart';

class GuestsSearchingWidget extends StatefulWidget {
  const GuestsSearchingWidget({Key? key}) : super(key: key);

  @override
  _GuestsSearchingWidgetState createState() => _GuestsSearchingWidgetState();
}

class _GuestsSearchingWidgetState extends State<GuestsSearchingWidget> {
  FocusNode searchingFocus = FocusNode();
  TextEditingController searchingController = TextEditingController();

  ScrollController searchingScrollController = ScrollController();

  List<GuestWithSession> guestsSuggestions = [];

  final TextStyle basicStyle = const TextStyle(
    fontWeight: FontWeight.w400,
    color: Colors.black26,
  );

  final UnderlineInputBorder border = const UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black12, width: .81),
  );

  search() async {
    if (searchingController.text.isNotEmpty &&
        searchingController.text.length >= 2) {
      List<GuestWithSession> gs =
          await GuestFindQuery.findByPhoneJoinSession(searchingController.text);
      if (gs.isNotEmpty) {
        setState(() {
          guestsSuggestions = gs;
        });
      } else {
        setState(() {
          guestsSuggestions = [
            GuestWithSession(guest: Guest(phone: searchingController.text)),
          ];
        });
      }
    } else {
      setState(() {
        guestsSuggestions = [];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    searchingController.addListener(search);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          autofocus: true,
          textAlign: TextAlign.center,
          focusNode: searchingFocus,
          controller: searchingController,
          textAlignVertical: TextAlignVertical.center,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onEditingComplete: () async {
            GuestWithSession gs = guestsSuggestions.first;
            if (gs.sessionId == null) {
              Guest guest = await gs.guest.checkGuestByPhone();
              await Get.bottomSheet(StartSessionScreen(guest));
              HomeController.to.restart();
            } else {
              GuestWithSession gs = guestsSuggestions.first;
              await Get.bottomSheet(EndSessionScreen(gs));
              HomeController.to.restart();
            }
          },
          style: basicStyle.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.blueGrey.shade900,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.transparent,
            focusedBorder: border,
            enabledBorder: border,
            border: border,
            hintText: 'Phone number',
            hintStyle: basicStyle,
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white54,
            ),
          ),
        ),
        Expanded(
          child: Scrollbar(
            isAlwaysShown: true,
            controller: searchingScrollController,
            child: ListView.builder(
              controller: searchingScrollController,
              itemCount: guestsSuggestions.length,
              itemBuilder: (context, index) {
                var guest = guestsSuggestions[index];
                return GuestSessionCardWidget(
                  guestWithSession: guest,
                  key: Key(
                    (guest.guest.id).toString() +
                        (guest.guest.phone).toString() +
                        DateTime.now().toIso8601String(),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
