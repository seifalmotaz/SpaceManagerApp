import 'package:flutter/material.dart';
import 'package:xwidgets/xwidgets.dart';

ListTile dataLabel({
  required int i,
  String? title,
  Widget? titleWidget,
  String? trailing,
}) {
  return ListTile(
    horizontalTitleGap: -14,
    leading: Text(
      i.toString() + '.',
      style: const TextStyle(
        color: colorWhiteBased,
        fontSize: 15,
      ),
    ),
    title: titleWidget ??
        Text(
          title ?? ' ',
          style: const TextStyle(
            color: colorWhiteBased2,
            fontSize: 15,
          ),
        ),
    trailing: trailing == null
        ? null
        : Text(
            trailing,
            style: const TextStyle(
              color: colorWhite,
              fontSize: 16,
            ),
          ),
  );
}
