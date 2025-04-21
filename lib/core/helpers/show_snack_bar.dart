import 'package:get/get.dart';

import '../resources/resources.dart';

void showSnackBar(context, String message) {
  Get.showSnackbar(
    GetSnackBar(
      backgroundColor: R.colors.primaryColor,
      message: message,
      duration: const Duration(seconds: 2),
    ),
  );
}
