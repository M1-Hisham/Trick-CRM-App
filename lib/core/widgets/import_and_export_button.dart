import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trick_crm_app/core/resources/resources.dart';

import '../helpers/show_snack_bar.dart';
import '../helpers/spacing.dart';
import 'app_button.dart';

class ImportAndExportButton extends StatelessWidget {
  const ImportAndExportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            icon: SvgPicture.asset(R.icons.importOptions),
            text: 'Import Options',
            onPressed: () {
              showSnackBar(context, "Coming soon!");
            },
          ),
        ),
        spacingH(8),
        Expanded(
          child: AppButton(
            icon: SvgPicture.asset(R.icons.exportOptions),
            text: 'Export Options',
            onPressed: () {
              showSnackBar(context, "Coming soon!");
            },
          ),
        ),
      ],
    );
  }
}
