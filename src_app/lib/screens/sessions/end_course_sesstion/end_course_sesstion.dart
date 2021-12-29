import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:spacemanager/constants/base_colors.dart';
import 'package:spacemanager/constants/error_snack.dart';
import 'package:spacemanager/models/courses/src.dart';
import 'package:spacemanager/models/sessions/src.dart';
import 'package:spacemanager/screens/sessions/end_session/labels_side.dart';
import 'package:spacemanager/screens/sessions/end_session/shortcuts.dart';

/// Dialog
class EndCourseSessionScreen extends StatefulWidget {
  const EndCourseSessionScreen(this.session, {Key? key}) : super(key: key);

  final SessionWithCourse session;

  @override
  _EndCourseSessionScreenState createState() => _EndCourseSessionScreenState();
}

class _EndCourseSessionScreenState extends State<EndCourseSessionScreen> {
  FocusNode focus = FocusNode();
  //
  late Course course;
  late Session session;
  String total = '0';
  int timeMin = 0;
  int timeHour = 0;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    course = widget.session.course;
    session = widget.session.session;
    session = await widget.session.fullSession;
    setState(() {});
    int? v = await session.getTotal();
    if (v != null) {
      setState(() {
        total = v.toString();
      });
    }
    DateTimeRange t = DateTimeRange(
      start: session.startTime!,
      end: DateTime.now(),
    );
    Duration time = t.duration;
    setState(() {
      timeMin = time.inMinutes;
      timeHour = time.inHours;
    });
    setState(() {});
  }

  endSession() async {
    try {
      await session.end();
      Get.back(result: true);
    } catch (e) {
      errorSnack('Code error', e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => focus.requestFocus(),
      child: Shortcuts(
        shortcuts: <LogicalKeySet, Intent>{
          LogicalKeySet(LogicalKeyboardKey.enter): CheckOutIntent(),
        },
        child: Actions(
          actions: {
            CheckOutIntent: CallbackAction(
              onInvoke: (intent) => endSession(),
            )
          },
          child: Focus(
            autofocus: true,
            focusNode: focus,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 23),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LabelsSideWidget(
                        session: session,
                        course: course,
                        timeHour: timeHour,
                        timeMin: timeMin,
                      ),
                      SizedBox(
                        width: Get.width * .21,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 17),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text(
                                  'Total:',
                                  style: TextStyle(
                                    fontSize: 27,
                                    color: BaseColors.primary.withOpacity(.81),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: Text(
                                  '$total\$',
                                  style: const TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              GFButton(
                                text: 'Check out',
                                fullWidthButton: true,
                                color: BaseColors.primary,
                                onPressed: endSession,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
