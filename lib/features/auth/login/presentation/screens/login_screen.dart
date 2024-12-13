import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';

import '../../../../../core/resources/resources.dart';
import '../../logic/cubit/login_cubit.dart';
import '../widgets/email_and_pass_field.dart';
import '../widgets/login_bloc_listener.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: R.colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 55.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spacingV(15),
                Image.asset(R.icons.logo),
                spacingV(101),
                Text(
                  "Welcome back!\nGlad to see you,\nAgain!",
                  style: R.textStyles.font40BlackBold,
                ),
                spacingV(74),
                const EmailAndPassField(),
                spacingV(11),
                GestureDetector(
                  onTap: () {
                    //TODO: Forgot Password
                    log("Forgot Password?");
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Password?",
                      style: R.textStyles.font14darkGeryW600,
                    ),
                  ),
                ),
                spacingV(39),
                AppButton(
                  onPressed: () {
                    _login(context);
                  },
                  text: "Login",
                  borderRadius: 8,
                ),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
