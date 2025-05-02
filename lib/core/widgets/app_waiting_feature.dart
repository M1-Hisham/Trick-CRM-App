import 'package:flutter/material.dart';

import '../resources/resources.dart';

Future appWaitingFeature(context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return Center(
        child: CircularProgressIndicator(
          color: R.colors.primaryColor,
        ),
      );
    },
  );
}
