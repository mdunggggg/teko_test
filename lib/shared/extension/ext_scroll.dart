import 'package:flutter/material.dart';

extension ExtScroll on ScrollController {
  onMore(Function() call) {
    addListener(
          () {
        if (position.pixels >= position.maxScrollExtent - 200) {
          call();
        }
      },
    );
  }
}
