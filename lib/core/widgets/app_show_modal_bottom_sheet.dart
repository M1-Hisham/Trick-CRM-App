import 'package:flutter/material.dart';

appShowModalBottomSheet({
  required context,
  required Widget Function(BuildContext context) builder,
}) {
  showModalBottomSheet(
    sheetAnimationStyle: AnimationStyle(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOutCubicEmphasized,
      reverseDuration: const Duration(milliseconds: 600),
    ),
    useSafeArea: true,
    isScrollControlled: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(13),
        topRight: Radius.circular(13),
      ),
    ),
    context: context,
    builder: builder,
  );
}
