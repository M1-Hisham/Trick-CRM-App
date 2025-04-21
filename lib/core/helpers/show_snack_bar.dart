import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/resources.dart';

void showSnackBar(context, String message) {
  Get.showSnackbar(
    GetSnackBar(
      backgroundColor: R.colors.primaryColor,
      message: message,
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(milliseconds: 1400),
    ),
  );
}
