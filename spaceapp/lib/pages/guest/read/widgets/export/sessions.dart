import 'dart:io';

import 'package:csv/csv.dart';
import 'package:database_system/database_system.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:spaceapp/widgets/xwidgets.dart';
import 'package:spaceapp/pages/dashboard/screens/menu/converting.dart';

class ExportSessionsWidget extends StatefulWidget {
  const ExportSessionsWidget(this.guestId, {Key? key}) : super(key: key);

  final int guestId;

  @override
  State<ExportSessionsWidget> createState() => _ExportSessionsWidgetState();
}

class _ExportSessionsWidgetState extends State<ExportSessionsWidget> {
  DateTime from = DateTime.now().subtract(const Duration(days: 7));
  DateTime to = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(21),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                child: Column(
                  children: [
                    Text(
                      Jiffy(from).yMMMMEEEEd,
                      style: const TextStyle(
                        color: colorSemiText,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 7),
                    WButton(
                      title: 'From date',
                      color: colorWhite,
                      textColor: colorSemiText,
                      onTap: () async {
                        DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2022),
                            lastDate: DateTime.now(),
                            builder: (cntx, child) {
                              return Theme(
                                child: child!,
                                data: ThemeData(
                                  colorScheme: const ColorScheme.light(
                                      primary: colorBittersweet),
                                ),
                              );
                            });
                        if (date != null) setState(() => from = date);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 7),
              Flexible(
                child: Column(
                  children: [
                    Text(
                      Jiffy(to).yMMMMEEEEd,
                      style: const TextStyle(
                        color: colorSemiText,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 7),
                    WButton(
                      title: 'To date',
                      color: colorWhite,
                      textColor: colorSemiText,
                      onTap: () async {
                        DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2022),
                            lastDate: DateTime.now(),
                            builder: (cntx, child) {
                              return Theme(
                                child: child!,
                                data: ThemeData(
                                  colorScheme: const ColorScheme.light(
                                      primary: colorBittersweet),
                                ),
                              );
                            });
                        if (date != null) setState(() => to = date);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          WButton(
            title: 'Export sessions',
            color: colorDarkLightest,
            textColor: colorWhite,
            onTap: () async {
              List<Map<String, dynamic>> data = await DBService.to.db.query(
                'session',
                whereArgs: [
                  widget.guestId,
                  Jiffy(from).unix(),
                  Jiffy(to).unix(),
                ],
                where: '''
                  guest_id = ?
                  AND
                  time_in BETWEEN ? AND ?
                ''',
              );
              List<List<dynamic>> csvList = ConvertingCSV.toCSVList(data);
              String csv = const ListToCsvConverter().convert(csvList);
              String? result = await FilePicker.platform.getDirectoryPath();
              if (result != null) {
                var file = File(result + '/sessions.csv').openWrite();
                file.write(csv);
                file.close();
              }
            },
          ),
        ],
      ),
    );
  }
}
