import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/di/setup-di/dependency_injection.dart';
import 'package:trick_crm_app/core/helpers/show_snack_bar.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';
import 'package:trick_crm_app/core/widgets/app_text_form_field.dart';
import 'package:trick_crm_app/core/widgets/app_waiting_feature.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/widgets/app_bar.dart';
import '../logic/cubit/update_password_cubit.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final FocusNode newPasswordNode = FocusNode();
  final FocusNode confirmPasswordNode = FocusNode();

  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isObscureText = true;

  @override
  void dispose() {
    newPasswordNode.dispose();
    confirmPasswordNode.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBar('Password & Security'),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      spacingV(20),
                      AppTextFormField(
                        hintText: 'Current Password',
                        nextFocusNode: newPasswordNode,
                        controller: currentPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password";
                          } else if (value.length < 8) {
                            return "Password must be at least 8 characters";
                          }
                          return null;
                        },
                      ),
                      spacingV(20),
                      AppTextFormField(
                        hintText: 'New Password',
                        focusNode: newPasswordNode,
                        nextFocusNode: confirmPasswordNode,
                        controller: newPasswordController,
                        isObscureText: isObscureText,
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                            log("Show Password");
                          },
                          icon: isObscureText
                              ? SvgPicture.asset(R.icons.eye)
                              : const Icon(Icons.visibility_off_outlined),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password";
                          } else if (currentPasswordController.text ==
                              newPasswordController.text) {
                            return "New password must be different from current password";
                          } else if (value.length < 8) {
                            return "Password must be at least 8 characters";
                          }
                          return null;
                        },
                      ),
                      spacingV(20),
                      AppTextFormField(
                        hintText: 'Confirm Password',
                        isObscureText: isObscureText,
                        focusNode: confirmPasswordNode,
                        controller: confirmPasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                            log("Show Password");
                          },
                          icon: isObscureText
                              ? SvgPicture.asset(
                                  R.icons.eye,
                                )
                              : const Icon(Icons.visibility_off_outlined),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password";
                          } else if (newPasswordController.text !=
                              confirmPasswordController.text) {
                            return "Password does not match";
                          } else if (value.length < 8) {
                            return "Password must be at least 8 characters";
                          }
                          return null;
                        },
                      ),
                      spacingV(20),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: AppButton(
                  text: 'Save Changes',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      log('Password changed successfully');
                      appWaitingFeature(context);
                      await getIt<UpdatePasswordCubit>().updatePassword(
                          currentPasswordController.text,
                          confirmPasswordController.text);
                      Get.back();
                      setState(() {
                        currentPasswordController.clear();
                        newPasswordController.clear();
                        confirmPasswordController.clear();
                      });
                      // ignore: use_build_context_synchronously
                      showSnackBar(context, 'Password changed successfully');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
