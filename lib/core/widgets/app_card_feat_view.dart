import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../core/resources/resources.dart';

/// Generate a card view for the Feature section
/// of the app with an icon and title.
appCardFeatView({
  required String title,
  String? icon,
  Widget? buildIcon,
  required void Function() onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Card(
        color: R.colors.white,
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 18.0,
              // horizontal: 9.0,
            ),
            // Logo and Name
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Visibility(
                  visible: buildIcon != null || icon != null,
                  child: Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: <Color>[
                            Color(0x78C8F9FF),
                            Color(0x78D3EDF0),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(90),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: buildIcon ??
                            SvgPicture.asset(
                              R.icons.iconsFeatureView[icon] ?? '',
                              width: 42.w,
                              height: 42.h,
                            ),
                      ),
                    ),
                  ),
                ),
                // Name
                Flexible(
                  child: Text(
                    title,
                    style: R.textStyles.font20ShadowGray29W500.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF333333),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
