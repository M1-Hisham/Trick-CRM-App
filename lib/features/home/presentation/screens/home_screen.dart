import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/cubits/menu_cubit.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';

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
