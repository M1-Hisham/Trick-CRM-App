import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/cubits/menu_cubit.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';

import '../../../../core/resources/resources.dart';
import '../widgets/home_bar.dart';
import '../widgets/card_bloc_builder.dart';
import '../widgets/deals_card.dart';
import '../widgets/meetings_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = MenuCubit.get(context);
    return GestureDetector(
      onTap: () {
        cubit.closeMenu();
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            const HomeBar(),
            Padding(
              padding: const EdgeInsets.all(22),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1.5),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: ModalRoute.of(context)!.animation!,
                  curve: Curves.linear,
                )),
                child: Column(
                  children: [
                    const CardBlocBuilder(),
                    // spacingV(22),
                    // const EmployeesChartCard(),
                    Card(
                      color: R.colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Employees Chart',
                              style: R.textStyles.font24JetBlackBold,
                            ),
                            spacingV(22),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Center(
                                child: Text(
                                  'Employees chart mode is still under development👨🏻‍💻 and will be available soon!',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    spacingV(16),
                    const DealsCard(),
                    spacingV(16),
                    const MeetingsCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
