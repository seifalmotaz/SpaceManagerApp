import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'create_nopay.dart';
import 'create_payed.dart';

class RoomsShortCuts extends StatelessWidget {
  const RoomsShortCuts({
    Key? key,
    required this.child,
    required this.shortcutChildFocus,
  }) : super(key: key);

  final Widget child;
  final FocusNode shortcutChildFocus;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => shortcutChildFocus.requestFocus(),
      child: Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.enter):
              CreateReservationPayedIntent(),
          LogicalKeySet(LogicalKeyboardKey.numpad0):
              CreateReservationNoPayIntent(),
        },
        child: Actions(
          actions: {
            CreateReservationPayedIntent: CreateReservationPayedAction(),
            CreateReservationNoPayIntent: CreateReservationNoPayAction(),
          },
          child: Focus(
            autofocus: true,
            focusNode: shortcutChildFocus,
            child: child,
          ),
        ),
      ),
    );
  }
}
