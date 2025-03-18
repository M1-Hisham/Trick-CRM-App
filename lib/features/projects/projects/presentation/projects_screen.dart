import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';

import '../../../../core/resources/resources.dart';
import 'widget/projects_data_bloc_builder.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Projects'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            AppButton(
              icon: SvgPicture.asset(R.icons.add),
              text: 'Create Project',
              onPressed: () {},
            ),
            spacingV(20),
            const ProjectsDataBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
