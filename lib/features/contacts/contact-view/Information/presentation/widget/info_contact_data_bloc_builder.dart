import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/di/setup-di/dependency_injection.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';
import 'package:trick_crm_app/core/widgets/app_error_message.dart';

import '../../../contact-view/data/model/contacts_view_model.dart';
import '../../../contact-view/logic/cubit/contact_view_cubit.dart';
import 'information_contact_details.dart';

class InfoContactDataBlocBuilder extends StatelessWidget {
  final int contactId;
  const InfoContactDataBlocBuilder({super.key, required this.contactId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactViewCubit, BaseState<ContactsViewModel>>(
      bloc: getIt<ContactViewCubit>()..getContactView(contactId),
      buildWhen: (previous, current) =>
          current is Success || current is Loading || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => loadingShimmer(
            child: informationContactDetails(
                contactId, ContactsViewModel(), context),
          ),
          success: (ContactsViewModel contactsViewModel) {
            return informationContactDetails(
                contactId, contactsViewModel, context);
          },
          error: (message) => appErrorMessage(
            message,
            () {
              getIt<ContactViewCubit>().getContactView(contactId);
            },
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
