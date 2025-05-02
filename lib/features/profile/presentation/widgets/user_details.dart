import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../auth/login/data/models/login_response.dart';
import '../../../../core/helpers/shaerd_pref_helper.dart';
import '../../../../core/resources/resources.dart';

FutureBuilder userDetails(
    {required BuildContext context, required double radius}) {
  return FutureBuilder(
    future: SharedPrefHelper.getUser(),
    builder: (context, snapshot) {
      // if (snapshot.connectionState == ConnectionState.waiting) {
      //   return const Center(child: CircularProgressIndicator());
      // }
      if (snapshot.hasData) {
        final UserData userData = snapshot.data!;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                  radius: radius.r,
                  backgroundColor: R.colors.transparent,
                  backgroundImage: NetworkImage(
                    userData.avatar ?? '',
                  ),
                  onBackgroundImageError: (context, error) {
                    if (error.toString().contains("Failed host lookup")) {
                      Image.asset(R.icons.imageUserError);
                    }
                    Image.asset(R.icons.imageUserError);
                  }),
            ),
            Text(
              userData.name ?? "",
              style: R.textStyles.font20ShadowGray29W500,
            ),
          ],
        );
      } else {
        return const SizedBox.shrink();
      }
    },
  );
}
