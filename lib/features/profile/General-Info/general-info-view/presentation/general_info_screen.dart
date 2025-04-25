import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trick_crm_app/features/profile/General-Info/general-info-view/data/model/general_info_model.dart';
import 'package:trick_crm_app/features/profile/General-Info/general-info-view/logic/cubit/general_info_cubit.dart';
import 'package:trick_crm_app/features/profile/General-Info/general-info-view/presentation/widget/loadig_general_info_screen.dart';
import 'package:trick_crm_app/features/profile/General-Info/update-general-info/data/model/update_general_info_req_body.dart';
import 'package:trick_crm_app/features/profile/General-Info/update-general-info/logic/cubit/update_general_info_cubit.dart';

import '../../../../../core/cubits/base_state.dart';
import '../../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../../core/helpers/loading_shimmer.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/app_bar.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_error_message.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../core/widgets/app_waiting_feature.dart';

class GeneralInfoScreen extends StatelessWidget {
  final int userId;
  GeneralInfoScreen({super.key, required this.userId});
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _fromData = {};
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: appBar('User Info'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: BlocBuilder<GeneralInfoCubit, BaseState<GeneralInfoModel>>(
              buildWhen: (previous, current) =>
                  current is Loading || current is Success || current is Error,
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () =>
                      loadingShimmer(child: loadingGeneralInfoScreen()),
                  success: (GeneralInfoModel data) {
                    final userInfo = data.userInfo;
                    return Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          spacingV(10),
                          Center(
                            child: CircleAvatar(
                              radius: 110.r,
                              backgroundColor: Colors.transparent,
                              backgroundImage: NetworkImage(
                                userInfo?.avatar ?? '',
                              ),
                              onBackgroundImageError: (context, error) {
                                if (error
                                    .toString()
                                    .contains("Failed host lookup")) {
                                  Image.asset(R.icons.imageUserError);
                                }
                                Image.asset(R.icons.imageUserError);
                              },
                            ),
                          ),
                          spacingV(20),
                          Text(
                            userInfo?.name ?? 'Name',
                            style: R.textStyles.font20ShadowGray29W500,
                          ),
                          spacingV(40),
                          AppTextFormField(
                            initialValue: userInfo?.name,
                            hintText: 'Full Name',
                            fillColor: R.colors.gray,
                            onSaved: (value) {
                              _fromData['name'] = value;
                            },
                          ),
                          spacingV(20),
                          AppTextFormField(
                            initialValue: userInfo?.email,
                            hintText: 'Email',
                            fillColor: R.colors.gray,
                            onSaved: (value) {
                              _fromData['email'] = value;
                            },
                          ),
                          spacingV(20),
                          AppTextFormField(
                            initialValue: userInfo?.details?.phone,
                            hintText: 'Phone Number',
                            keyboardType: TextInputType.phone,
                            fillColor: R.colors.gray,
                            validator: (value) {
                              if (value != null || value!.isNotEmpty) {
                                if (value.length < 11 && value.isEmpty) {
                                  return 'Phone number must be at least 11 digits';
                                }
                                return null;
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _fromData['phone_number'] = value;
                            },
                          ),
                          spacingV(20),
                          AppTextFormField(
                            initialValue: userInfo?.details?.jobTitle,
                            hintText: 'Job Title',
                            fillColor: R.colors.gray,
                            onSaved: (value) {
                              _fromData['job_title'] = value;
                            },
                          ),
                          spacingV(20),
                          AppTextFormField(
                            initialValue: "Egypt",
                            hintText: 'Country/Region',
                            fillColor: R.colors.gray,
                          ),
                          spacingV(20),
                          AppTextFormField(
                            initialValue: userInfo?.details?.address,
                            hintText: 'Address',
                            fillColor: R.colors.gray,
                            onSaved: (value) {
                              _fromData['address'] = value;
                            },
                          ),
                          spacingV(30),
                          AppButton(
                            text: "Save Change",
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                log("_fromData: $_fromData");
                                appWaitingFeature(context);
                                await getIt<UpdateGeneralInfoCubit>()
                                    .updateUserInfo(
                                  UpdateGeneralInfoReqBody(
                                    name: _fromData['name'],
                                    phone: _fromData['phone_number'],
                                    email: _fromData['email'],
                                    jobTitle: _fromData['job_title'],
                                    address: _fromData['address'],
                                  ),
                                );
                                // ignore: use_build_context_synchronously
                                Navigator.pop(context);
                                // ignore: use_build_context_synchronously
                                context
                                    .read<GeneralInfoCubit>()
                                    .getUserProfile(userId);
                              }
                            },
                          ),
                          spacingV(30),
                        ],
                      ),
                    );
                  },
                  error: (error) => appErrorMessage(
                    error,
                    () {
                      context.read<GeneralInfoCubit>().getUserProfile(userId);
                    },
                  ),
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
