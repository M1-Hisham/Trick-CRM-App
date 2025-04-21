import 'package:flutter/material.dart';

Future<bool?> appShowModalBottomSheet({
  required context,
  required Widget Function(BuildContext context) builder,
}) {
  return showModalBottomSheet<bool?>(
    context: context,
    builder: builder,
    useSafeArea: true,
    isScrollControlled: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(13),
        topRight: Radius.circular(13),
      ),
    ),
  );
}
