import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/trick_app.dart';

import 'core/di/setup-di/dependency_injection.dart';
import 'core/widgets/app_bloc_observer.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  setupGetIt();
  runApp(const TrickApp());
}
