import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/di/setup-di/dependency_injection.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';
import 'package:trick_crm_app/core/widgets/app_waiting_feature.dart';

import '../../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../../core/resources/resources.dart';
import '../../../../../../../campaigns/campaign-view/campaign-view/logic/cubit/campaign_view_cubit.dart';
import '../logic/cubit/edit_lead_campaign_cubit.dart';

class EditLeadCampaign extends StatelessWidget {
  final int campaignId;
  final int leadId;
  final String campaignName;
  final String campaignstatus;
  final BuildContext contextCampaign;
  EditLeadCampaign({
    super.key,
    required this.campaignId,
    required this.contextCampaign,
    required this.campaignName,
    required this.campaignstatus,
    required this.leadId,
  });

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final String? status;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CampaignViewCubit>(),
      child: Dialog(
        backgroundColor: R.colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        child: SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Update Campaign Status',
                      style: R.textStyles.font17PrimaryW600,
                    ),
                    spacingV(20),
                    Text(
                      "Campaign Name: $campaignName",
                      style: R.textStyles.font15RegentGrayW500.copyWith(
                        color: R.colors.black,
                      ),
                    ),
                    spacingV(20),
                    Form(
                      key: _formKey,
                      child: _statusSelection(context),
                    ),
                    spacingV(20),

                    /// Submit and Cancel Button
                    _submitAndCancel(contextCampaign),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _submitAndCancel(contextCampaign) {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            icon: SvgPicture.asset(
              R.icons.add,
            ),
            text: 'Update',
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                appWaitingFeature(contextCampaign);
                await getIt<EditLeadCampaignCubit>().editLeadCampaign(
                  status!,
                  leadId,
                  campaignId,
                );
                Get.back();
                Get.back();
                Navigator.pop(contextCampaign, true);
                Get.showSnackbar(
                  GetSnackBar(
                    backgroundColor: R.colors.primaryColor,
                    message: 'Campaign status updated successfully',
                    duration: const Duration(seconds: 2),
                  ),
                );
              }
            },
          ),
        ),
        spacingH(10),
        Expanded(
          child: AppButton(
            text: "Cancel",
            textStyle: R.textStyles.font14DimGrayW400.copyWith(
              fontWeight: FontWeight.w500,
            ),
            onPressed: Get.back,
            backgroundColor: R.colors.white,
            borderColor: const Color(0xffC8C8C8),
            overlayColor: R.colors.primaryColor,
          ),
        ),
      ],
    );
  }

  _statusSelection(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        label: const FittedBox(fit: BoxFit.scaleDown, child: Text('Status')),
        labelStyle: const TextStyle(color: Colors.black),
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 19.h),
        hintStyle: R.textStyles.font15RegentGrayW500,
        filled: true,
        fillColor: R.colors.white,
        alignLabelWithHint: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 139, 139, 139),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 139, 139, 139),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: Color(0xFFE8ECF4),
          ),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          menuMaxHeight: 250,
          decoration: const InputDecoration(
            border: InputBorder.none,
            isDense: true,
          ),
          dropdownColor: R.colors.white,
          value: campaignstatus,
          isDense: true,
          hint: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "Select an option",
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey,
              ),
            ),
          ),
          onChanged: (String? value) {},
          onSaved: (value) {
            status = value;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select a selection';
            }
            return null;
          },
          items: const [
            "Planned",
            "Invited",
            "Sent",
            "Opened",
            "Responded",
            "Bounced",
            "Opted Out",
          ].map(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: R.textStyles.font15RegentGrayW500.copyWith(
                    color: R.colors.black,
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
