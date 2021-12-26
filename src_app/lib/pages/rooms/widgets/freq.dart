import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:spacemanager/widgets/form_field.dart';

class FrequencyWidget extends StatefulWidget {
  const FrequencyWidget(this.setIt, {Key? key}) : super(key: key);

  final Function([String? freq, String? num]) setIt;

  @override
  State<FrequencyWidget> createState() => _FrequencyWidgetState();
}

class _FrequencyWidgetState extends State<FrequencyWidget> {
  List<String> list = ['DAY', 'WEEKLY', 'MONTHLY', 'MONTHLY 30'];
  String? frequency;
  TextEditingController text = TextEditingController();

  TextStyle textStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 21,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: Get.width * .19,
          child: Column(
            children: [
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: frequency,
                  items: list.map(_dropBuilder).toList(),
                  onChanged: (value) => setState(() => frequency = value),
                  hint: Text('Frequency', style: textStyle),
                ),
              ),
              TextCustomField(
                hint: 'Frequency number',
                border: 7,
                color: Colors.grey.shade200,
                controller: text,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChange: (string) => setState(() {}),
              ),
            ],
          ),
        ),
        const SizedBox(width: 11),
        GFButton(
          text: 'Add',
          onPressed: text.text.isEmpty || frequency == null
              ? null
              : () {
                  if (text.text.isEmpty) return;
                  if (frequency == null) return;
                  widget.setIt(frequency, text.text);
                },
        ),
      ],
    );
  }

  DropdownMenuItem<String> _dropBuilder(String item) {
    return DropdownMenuItem<String>(
      value: item,
      child: Text(
        item,
        style: textStyle,
      ),
    );
  }
}
