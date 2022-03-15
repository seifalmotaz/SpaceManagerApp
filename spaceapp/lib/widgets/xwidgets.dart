library xwidgets;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

export './constant/base_colors.dart';

export './widgets/button.dart';
export './widgets/dialog.dart';
export './widgets/resposive.dart';
export './widgets/scaffold.dart';
export './widgets/text_field.dart';
export './widgets/topbar.dart';

export './helpers/extention.dart';
export './helpers/monitoring.dart';
export './helpers/snacks.dart';

class ThemeColors {
  static ThemeData get theme => Get.theme;
  static ColorScheme get scheme => Get.theme.colorScheme;

  static const primary = Color(0xFFfa735a);
  static const secondary = Color(0xFF57c8d3);
}
