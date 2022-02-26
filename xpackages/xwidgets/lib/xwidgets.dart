library xwidgets;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

export './src/constant/base_colors.dart';

export './src/widgets/button.dart';
export './src/widgets/dialog.dart';
export './src/widgets/resposive.dart';
export './src/widgets/scaffold.dart';
export './src/widgets/text_field.dart';
export './src/widgets/topbar.dart';

export './src/helpers/extention.dart';
export './src/helpers/monitoring.dart';
export './src/helpers/snacks.dart';

class ThemeColors {
  static ThemeData get theme => Get.theme;
  static ColorScheme get scheme => Get.theme.colorScheme;

  static const primary = Color(0xFFfa735a);
  static const secondary = Color(0xFF57c8d3);
}
