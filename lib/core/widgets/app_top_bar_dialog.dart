import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../core/resources/resources.dart';

/// Global app top bar dialog
Container appTopBarDialog(String title) {
  return Container(
    decoration: BoxDecoration(
      color: R.colors.primaryColor,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(13),
        topRight: Radius.circular(13),
      ),
    ),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, right: 8),
          child: Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () => Get.back(),
              child: SvgPicture.asset(R.icons.closeIcon),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Column(
            children: [
              Text(
                title,
                style: R.textStyles.font17whiteW600,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
