import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teko_hiring_test/shared/extension/ext_string.dart';

import '../../shared/colors/colors.dart';
import '../../shared/style_text/style_text.dart';

class AppInput extends StatelessWidget {
  final String? initialValue;
  final String? label;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String? value)? validate;
  final bool show;
  final bool password;
  final int? maxLines;
  final FocusNode? fn;
  final bool required;
  final Function? onTap;
  final Color? borderColor;
  final Color? backgroundColor;
  final Function(String)? onChanged;
  final Function(String)? onConfirm;
  final Function()? onTapOutside;
  final bool readOnly;
  final TextAlign textAlign;
  final TextStyle? labelStyle;
  final List<TextInputFormatter>? inputFormatters;
  final List<BoxShadow>? boxShadow;
  final Key? key;
  final bool? isDense;

  const AppInput({
    this.initialValue,
    this.label,
    this.padding,
    this.radius,
    required this.hintText,
    this.controller,
    this.textInputType = TextInputType.text,
    this.suffixIcon,
    this.prefixIcon,
    this.validate,
    this.show = true,
    this.password = false,
    this.maxLines,
    this.fn,
    this.required = false,
    this.onTap,
    this.borderColor,
    this.backgroundColor,
    this.onChanged,
    this.onConfirm,
    this.onTapOutside,
    this.readOnly = false,
    this.textAlign = TextAlign.start,
    this.labelStyle,
    this.inputFormatters,
    this.boxShadow,
    this.key,
    this.isDense,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null)
          RichText(
            text: TextSpan(
              children: [
                if (required)
                  TextSpan(
                    text: '* ',
                    style: StyleApp.semibold(color: Colors.red),
                  ),
                TextSpan(
                  text: label,
                  style: labelStyle ?? StyleApp.semibold(color: ColorApp.textColor),
                )
              ],
            ),
          ),
        if (label != null) const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 8),
            boxShadow: boxShadow ??
                [
                  const BoxShadow(
                    color: Colors.transparent,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  ),
                ],
          ),
          child: TextFormField(
            initialValue: initialValue,
            readOnly: readOnly,
            key: key,
            onTap: () {
              if (onTap != null) onTap!();
            },
            onChanged: (String? value) {
              if (value != null && onChanged != null) {
                onChanged!(value);
              }
            },
            onFieldSubmitted: (value) {
              if (onConfirm != null) {
                onConfirm!(value);
              }
            },
            onTapOutside: (event) =>
                onTapOutside?.call() ??
                FocusManager.instance.primaryFocus?.unfocus(),
            maxLines: password ? 1 : maxLines,
            keyboardType: textInputType,
            controller: controller,
            obscureText: password,
            focusNode: fn,
            textAlign: textAlign,
            validator: validate ??
                (value) {
                  if (required && value.isEmptyOrNull) {
                    return 'Vui lòng nhập ${label?.toLowerCase()}';
                  }
                  // if (value!.isNotEmpty) {
                  //   return value.validatorTextField(type: textInputType);
                  // }
                  return null;
                },
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              fillColor: backgroundColor,
              filled: backgroundColor != null,
              contentPadding: padding ?? const EdgeInsets.all(12),
              isDense: isDense,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 8),
                borderSide: BorderSide(
                  color: borderColor ?? ColorApp.borderColor,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 8),
                borderSide: BorderSide(
                  color: borderColor ?? ColorApp.borderColor,
                  width: 1,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 8),
                borderSide: BorderSide(
                  color: borderColor ?? ColorApp.borderColor,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius ?? 8),
                borderSide: BorderSide(
                  color: ColorApp.primaryColor,
                  width: 1,
                ),
              ),
              hintText: hintText,
              hintStyle: StyleApp.normal(color: ColorApp.greyColor),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
