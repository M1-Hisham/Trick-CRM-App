import 'package:flutter/material.dart';
import '../../../../core/widgets/app_bar.dart';
import 'widget/projects_data_bloc_builder.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBar('Projects'),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: ProjectsDataBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
