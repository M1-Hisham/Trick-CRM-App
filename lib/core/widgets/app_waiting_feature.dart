import 'package:flutter/material.dart';

import '../resources/resources.dart';

Future appWaitingFeature(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: CircularProgressIndicator(
          color: R.colors.primaryColor,
        ),
      );
    },
  );
}
