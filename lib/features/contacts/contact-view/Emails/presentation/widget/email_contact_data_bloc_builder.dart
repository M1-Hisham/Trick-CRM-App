import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/helpers/formatted_data_helper.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';

import '../../../../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../../../../core/widgets/app_data_table.dart';
import '../../../../../../../core/widgets/app_error_message.dart';
import '../../../contact-view/data/model/contacts_view_model.dart';
import '../../../contact-view/logic/cubit/contact_view_cubit.dart';
import '../../data/model/contact_mails_model.dart';

class EmailContactDataBlocBuilder extends StatelessWidget {
  final int contactId;
  const EmailContactDataBlocBuilder({super.key, required this.contactId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactViewCubit, BaseState<ContactsViewModel>>(
      bloc: getIt<ContactViewCubit>()..getContactView(contactId),
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => loadingShimmer(
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppDataTable<ContactMailsModel>(
                  data: [],
                  headers: [],
                  dataExtractors: [],
                ),
              ],
            ),
          ),
          success: (ContactsViewModel contactsViewModel) {
            final List<ContactMailsModel> contactMails =
                contactsViewModel.contactMails ?? [];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppDataTable<ContactMailsModel>(
                  dataMessage: 'No Contact Mails',
                  data: contactMails,
                  headers: const [
                    "Subject",
                    "Date",
                    "Sent By",
                    "Status",
                  ],
                  dataExtractors: [
                    (contactMails) => contactMails.subject ?? '',
                    (contactMails) =>
                        formattedDateHelperMM(contactMails.createdAt ?? ''),
                    (contactMails) => contactMails.user?.name ?? '',
                    (contactMails) => contactMails.status ?? '_',
                  ],
                ),
              ],
            );
          },
          error: (message) => appErrorMessage(
            message,
            () => getIt<ContactViewCubit>().getContactView(contactId),
          ),
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
