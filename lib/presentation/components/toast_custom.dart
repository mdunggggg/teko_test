import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:toastification/toastification.dart';

import 'dialog.dart';

class ToastCustom {
  static show(
    BuildContext context, {
    required String title,
    required String msg,
    String svgIcon = 'assets/svg/warning_outline.svg',
    Color color = Colors.orange,
    Widget? subTitle,
    Map<String, HighlightedWord>? highlightWords,
    Duration? timeClose,
    String? labelBtn,
  }) {
    toastification.showCustom(
      context: context,
      autoCloseDuration: timeClose ?? const Duration(seconds: 3),
      alignment: Alignment.bottomCenter,
      builder: (BuildContext context, ToastificationItem holder) {
        return DialogNoti(
          message: title,
          subTitle: subTitle ??
              TextHighlight(
                text:
                    msg, // You need to pass the string you want the highlights
                words: highlightWords ?? {}, // Your dictionary words
                textStyle: const TextStyle(
                  color: Colors.black,
                  height: 1.2,
                ),
              ),
          icon: svgIcon,
          color: color,
          onClose: () {
            toastification.dismissById(holder.id);
          },
        );
      },
    );
  }
}
