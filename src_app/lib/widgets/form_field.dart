import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextCustomField extends StatelessWidget {
  const TextCustomField({
    Key? key,
    this.icon,
    this.focus,
    this.width,
    this.helper,
    this.onChange,
    this.validator,
    this.autoFocus = false,
    this.controller,
    this.counterText,
    this.inputFormatters,
    this.onFieldSubmitted,
    this.color = const Color(0xFFe4e6eb),
    this.textColor,
    this.hintColor,
    this.border,
    this.obscureText = false,
    required this.hint,
  }) : super(key: key);

  final FocusNode? focus;
  final Function(String string)? onFieldSubmitted;
  final String? Function(String? string)? validator;
  final Function(String? string)? onChange;
  final TextEditingController? controller;

  final String hint;
  final double? width;
  final String? counterText;
  final String? helper;
  final IconData? icon;
  final Color color;
  final Color? textColor;
  final Color? hintColor;
  final bool autoFocus;
  final double? border;
  final bool obscureText;

  final List<TextInputFormatter>? inputFormatters;

  final TextStyle basicStyle = const TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(border ?? 13),
        child: TextFormField(
          style: textColor == null
              ? basicStyle
              : basicStyle.copyWith(color: textColor),
          autofocus: autoFocus,
          focusNode: focus,
          obscureText: obscureText,
          controller: controller,
          onFieldSubmitted: onFieldSubmitted,
          validator: validator,
          inputFormatters: inputFormatters,
          onChanged: onChange,
          textAlignVertical:
              icon == null ? TextAlignVertical.top : TextAlignVertical.center,
          decoration: InputDecoration(
            filled: true,
            fillColor: color,
            contentPadding: const EdgeInsets.symmetric(horizontal: 11),
            border: InputBorder.none,
            counterText: counterText,
            hintText: hint,
            helperStyle: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
            helperText: helper,
            hintStyle: basicStyle.copyWith(color: hintColor ?? Colors.grey),
            prefixIcon: icon == null
                ? null
                : Icon(
                    icon,
                    color: Colors.grey,
                  ),
          ),
        ),
      ),
    );
  }
}
