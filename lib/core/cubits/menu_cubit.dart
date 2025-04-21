import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class MenuCubit extends Cubit<bool> {
  final GlobalKey<SliderDrawerState> key = GlobalKey<SliderDrawerState>();

  bool isOpenOrClose = false;
  MenuCubit() : super(false);

  static MenuCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  void toggleMenu() {
    key.currentState?.toggle();
    isOpenOrClose = !isOpenOrClose;
    emit(isOpenOrClose);
  }

  void closeMenu() {
    if (isOpenOrClose) {
      key.currentState?.closeSlider();
      isOpenOrClose = !isOpenOrClose;
      emit(isOpenOrClose);
    }
  }
}
