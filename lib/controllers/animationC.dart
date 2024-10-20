import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimationC extends GetxController with GetSingleTickerProviderStateMixin {
  AnimationController? flutterLogo;
  @override
  void onInit() {
    flutterLogo = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);

    super.onInit();
  }

  @override
  void onClose() {
    flutterLogo!.dispose();
    super.onClose();
  }
}
