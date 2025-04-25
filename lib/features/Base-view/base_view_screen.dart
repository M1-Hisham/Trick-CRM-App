import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:trick_crm_app/core/widgets/app_bottom_nav_bar.dart';

import '../../core/cubits/menu_cubit.dart';
import '../../core/widgets/app_menu.dart';
import '../home/presentation/screens/home_screen.dart';
import '../profile/presentation/profile_screen.dart';
import '../wallet/presentation/wallet_screen.dart';

class BaseViewScreen extends StatefulWidget {
  const BaseViewScreen({super.key});

  @override
  State<BaseViewScreen> createState() => _BaseViewScreenState();
}

class _BaseViewScreenState extends State<BaseViewScreen> {
  int _selectedIndex = 0;

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = MenuCubit.get(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SliderDrawer(
        isDraggable: false,
        animationDuration: 110,
        sliderOpenSize: 290.dg,
        key: cubit.key,
        appBar: null,
        slider: AppMenu(
          onTapProfile: () {
            cubit.toggleMenu();
            setState(() {
              _selectedIndex = 2;
            });
          },
        ),
        child: IndexedStack(
          index: _selectedIndex,
          children: const [
            HomeScreen(),
            WalletScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavBar(
        selectedIndex: _selectedIndex,
        onTabChange: _onTabChange,
      ),
    );
  }
}
