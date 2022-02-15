import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WTextField extends StatelessWidget {
  const WTextField({
    Key? key,
    this.icon,
    this.focus,
    this.width,
    this.fontsize,
    this.height,
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
    this.initText,
    this.obscureText = false,
    this.textAlignVertical,
    this.contentPadding,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    required this.hint,
  }) : super(key: key);

  final FocusNode? focus;
  final Function(String string)? onFieldSubmitted;
  final String? Function(String? string)? validator;
  final Function(String? string)? onChange;
  final TextEditingController? controller;

  final String hint;
  final String? initText;
  final double? fontsize;
  final int? maxLines;
  final EdgeInsets? contentPadding;
  final double? width;
  final double? height;
  final String? counterText;
  final String? helper;
  final IconData? icon;
  final Color color;
  final Color? textColor;
  final Color? hintColor;
  final bool autoFocus;
  final double? border;
  final bool obscureText;
  final TextAlignVertical? textAlignVertical;
  final TextAlign textAlign;

  final List<TextInputFormatter>? inputFormatters;

  final TextStyle basicStyle = const TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(border ?? 13),
        child: TextFormField(
          initialValue: initText,
          maxLines: maxLines,
          style: textColor == null
              ? basicStyle
              : basicStyle.copyWith(color: textColor, fontSize: fontsize),
          autofocus: autoFocus,
          focusNode: focus,
          obscureText: obscureText,
          controller: controller,
          onFieldSubmitted: onFieldSubmitted,
          validator: validator,
          inputFormatters: inputFormatters,
          toolbarOptions: const ToolbarOptions(
            copy: true,
            cut: true,
            paste: true,
            selectAll: true,
          ),
          onChanged: onChange,
          textAlign: textAlign,
          textAlignVertical: textAlignVertical ??
              (icon == null ? TextAlignVertical.top : TextAlignVertical.center),
          decoration: InputDecoration(
            filled: true,
            isDense: contentPadding == null ? false : true,
            fillColor: color,
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(
                  horizontal: 11,
                ),
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
