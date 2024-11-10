import 'package:flutter/material.dart';
import 'package:teko_hiring_test/shared/style_text/style_text.dart';

class ColumnLabelButton extends StatelessWidget {
  final String title;
  final String label;
  final bool? isRequire;
  final Function()? onPressed;
  final bool isBorder;
  final BorderSide? border;
  final BorderRadius? radius;
  final Color? backgroundColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final EdgeInsets? padding;
  final double spaceIcon;
  final TextStyle? labelStyle;
  final TextAlign? labelAlign;
  final FlexFit fit;
  final Alignment? alignment;
  final Size? fixedSize;
  const ColumnLabelButton({
    super.key,
    required this.title,
    required this.label,
    this.isRequire,
    this.onPressed,
    this.border,
    this.backgroundColor = Colors.white,
    this.radius,
    this.isBorder = true,
    this.suffixIcon,
    this.prefixIcon,
    this.padding,
    this.labelStyle,
    this.labelAlign,
    this.spaceIcon = 8,
    this.fit = FlexFit.loose,
    this.alignment,
    this.fixedSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: title,
            style: StyleApp.bold(color: Colors.black),
            children: [
              if (isRequire ?? false)
                TextSpan(
                  text: ' *',
                  style: StyleApp.semibold(color: Colors.red),
                ),
            ],
          ),
        ),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            alignment: alignment,
            shape: RoundedRectangleBorder(
              borderRadius: radius ?? BorderRadius.circular(20),
              side: isBorder && border != null ? border! : BorderSide.none,
            ),
            padding: padding ??
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            fixedSize: fixedSize,
            disabledBackgroundColor:
            backgroundColor != null ? Colors.grey.shade200 : null,
            foregroundColor: backgroundColor?.withOpacity(0.1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (prefixIcon != null)
                Padding(
                  padding: EdgeInsets.only(right: spaceIcon),
                  child: prefixIcon,
                ),
              Flexible(
                fit: fit,
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: labelStyle ?? StyleApp.semibold(color: Colors.black),
                  textAlign: labelAlign,
                ),
              ),
              if (suffixIcon != null)
                Padding(
                  padding: EdgeInsets.only(left: spaceIcon),
                  child: suffixIcon,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
