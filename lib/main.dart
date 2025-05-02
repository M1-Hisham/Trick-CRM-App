import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/core/cubits/user_cubit.dart';
import 'package:trick_crm_app/trick_app.dart';

import 'core/di/setup-di/dependency_injection.dart';
import 'core/helpers/shaerd_pref_helper.dart';
import 'core/widgets/app_bloc_observer.dart';
import 'features/auth/login/data/models/login_response.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  final UserData? user = await SharedPrefHelper.getUser();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  setupGetIt();
  runApp(
    BlocProvider(
      create: (context) => UserCubit()..setUser(user ?? UserData()),
      child: const TrickApp(),
    ),
  );
}
