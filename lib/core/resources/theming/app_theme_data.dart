import 'package:flutter/material.dart';

import '../resources.dart';

class AppThemeData {
  final ThemeData theme = ThemeData(
    primaryColor: R.colors.primaryColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: R.textStyles.font18WhiteW600.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      iconTheme: IconThemeData(
        color: R.colors.white,
      ),
    ),
  );
}
