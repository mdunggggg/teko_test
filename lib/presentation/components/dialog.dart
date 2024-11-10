import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teko_hiring_test/shared/extension/ext_context.dart';
import 'package:teko_hiring_test/shared/extension/ext_num.dart';
import 'package:teko_hiring_test/shared/extension/ext_widget.dart';

import '../../shared/colors/colors.dart';
import '../../shared/style_text/style_text.dart';

class DialogNoti extends StatelessWidget {
  final String message;
  final String icon;
  final Color color;
  final Widget? subTitle;
  final List<Widget>? actions;
  final Function()? onClose;
  const DialogNoti({
    super.key,
    required this.message,
    required this.icon,
    required this.color,
    this.subTitle,
    this.onClose,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: 12.radius,
        side: const BorderSide(
          color: Colors.grey,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconBorderCustom(
                icon: SvgPicture.asset(
                  icon,
                  width: 20,
                  height: 20,
                  color: color,
                ),
                color: color,
              ),
              const Spacer(),
              IconBtn(
                onTap: onClose,
                backgroundColor: Colors.transparent,
                icon: const Icon(
                  Icons.close,
                ),
              ),
            ],
          ),
          Text(
            message,
            style: StyleApp.bold(
              fontSize: 16,
              color: Colors.black,
            ),
          ).padding(16.paddingHor),
          if (subTitle != null) subTitle!.padding(16.paddingHor + 4.paddingTop),
          if (actions != null)
            Row(
              children: actions!,
            ),
          16.height,
        ],
      ),
    ).padding(16.padding).size(width: context.width);
  }
}
Widget IconBorderCustom({
  required Widget icon,
  required Color color,
}) {
  return Container(
    padding: 8.padding,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: color.withOpacity(0.05)),
    ),
    child: Container(
      padding: 8.padding,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color.withOpacity(0.1), width: 1.5),
      ),
      child: Container(
        padding: 6.padding,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: color.withOpacity(0.2),
            width: 2,
          ),
        ),
        child: icon,
      ),
    ),
  );
}

Widget IconBtn({
  required Widget icon,
  Function()? onTap,
  Size? size,
  Color? iconColor,
  Color? backgroundColor,
  BorderRadius? borderRadius,
  int count = 0,
  EdgeInsets? padding,
  List<BoxShadow>? boxShadow,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Badge.count(
      count: count,
      backgroundColor: ColorApp.red,
      isLabelVisible: count > 0,
      textStyle: StyleApp.normal(
        color: ColorApp.white,
        fontSize: 11,
      ),
      child: Container(
        padding: padding ?? 8.padding,
        height: size?.height ?? 40,
        width: size?.width ?? 40,
        decoration: BoxDecoration(
          color: backgroundColor ??
              ColorApp.white,
          borderRadius: borderRadius ?? 50.radius,
          boxShadow: boxShadow,
        ),
        child: Center(
          child: icon,
        ),
      ),
    ),
  );
}

