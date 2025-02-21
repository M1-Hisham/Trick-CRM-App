import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/resources/resources.dart';
import '../../../core/widgets/app_bar.dart';
import '../../../core/widgets/app_button.dart';
import 'widget/contacts_data_bloc_builder.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Contacts'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            AppButton(
              icon: SvgPicture.asset(R.icons.add),
              text: 'Create Contacts',
              onPressed: () {},
            ),
            spacingV(20),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    icon: SvgPicture.asset(R.icons.importOptions),
                    text: 'Import Options',
                    onPressed: () {},
                  ),
                ),
                spacingH(8),
                Expanded(
                  child: AppButton(
                    icon: SvgPicture.asset(R.icons.exportOptions),
                    text: 'Export Options',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            spacingV(20),
            const ContactsDataBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
