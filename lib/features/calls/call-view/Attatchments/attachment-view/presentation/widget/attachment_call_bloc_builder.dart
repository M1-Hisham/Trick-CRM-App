import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/di/setup-di/dependency_injection.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';

import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../core/resources/resources.dart';
import '../../../../../../../core/widgets/app_button.dart';
import '../../../../../../../core/widgets/app_error_message.dart';
import '../../../../call-view/data/model/call_view_model.dart';
import '../../../../call-view/logic/cubit/call_view_cubit.dart';
import '../../../create-attachment/presentation/add_attachment_screen.dart';
import '../../../delete_attachment/presentation/screen/delete_attachment_call.dart';
import 'loading_attachment_screen.dart';

class AttachmentCallBlocBuilder extends StatelessWidget {
  final int callId;
  const AttachmentCallBlocBuilder({super.key, required this.callId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CallViewCubit, BaseState<CallViewModel>>(
      bloc: getIt<CallViewCubit>()..getCallView(callId),
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => loadingShimmer(
            child: loadingAttachmentScreen(),
          ),
          success: (data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // AppButton(
                //   icon: SvgPicture.asset(
                //     R.icons.add,
                //   ),
                //   text: 'Add Attachment',
                //   onPressed: () {
                //     // Show Add Attachment Dialog
                //     showDialog(
                //       context: context,
                //       builder: (context) {
                //         return const AddAttachmentScreen();
                //       },
                //     );
                //   },
                // ),
                spacingV(20),
                Text(
                  'Attachments',
                  style: R.textStyles.font17PrimaryW600,
                ),
                spacingV(20),
                data.callAttatchments?.isEmpty ?? true
                    ? const Center(child: Text("No attachments"))
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 1.5,
                        ),
                        itemCount: data.callAttatchments?.length ?? 0,
                        itemBuilder: (context, index) {
                          final attachment = data.callAttatchments?[index];
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.network(
                                  "https://crm-crmsubdomain.xv6jr6.easypanel.host${attachment?.url}",
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Center(
                                      child: Icon(Icons.broken_image),
                                    );
                                  },
                                ),
                                Positioned(
                                  right: 5,
                                  top: 5,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.black54,
                                    child: IconButton(
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red, size: 16),
                                      onPressed: () => deleteAttachmentCall(
                                        context,
                                        callId,
                                        attachment?.id ?? 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ],
            );
          },
          error: (message) => appErrorMessage(
            message,
            () {
              getIt<CallViewCubit>().getCallView(callId);
            },
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
