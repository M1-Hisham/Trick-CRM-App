import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/di/dependency_injection.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';
import 'package:trick_crm_app/core/widgets/app_error_message.dart';

import '../../../contact-view/data/model/contacts_view_model.dart';
import '../../logic/cubit/info_contact_view_cubit.dart';
import 'information_contact_details.dart';

class InfoContactDataBlocBuilder extends StatelessWidget {
  final int contactId;
  const InfoContactDataBlocBuilder({super.key, required this.contactId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfoContactViewCubit, BaseState<ContactsViewModel>>(
      bloc: getIt<InfoContactViewCubit>()..getInformationView(contactId),
      buildWhen: (previous, current) =>
          current is Success || current is Loading || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => loadingShimmer(
            child: informationContactDetails(ContactsViewModel()),
          ),
          success: (ContactsViewModel contactsViewModel) {
            return informationContactDetails(contactsViewModel);
          },
          error: (message) => appErrorMessage(
            message,
            () {
              context
                  .read<InfoContactViewCubit>()
                  .getInformationView(contactId);
            },
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
