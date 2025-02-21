import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trick_crm_app/features/contacts/data/contacts_model.dart';
import 'package:trick_crm_app/features/contacts/logic/cubit/contacts_cubit.dart';

import '../../../../core/cubits/base_state.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/widgets/app_data_table.dart';

class ContactsDataBlocBuilder extends StatelessWidget {
  const ContactsDataBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsCubit, BaseState<ContactsModel>>(
      buildWhen: (previous, current) => current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => Shimmer.fromColors(
                  baseColor: R.colors.baseColorShimmer,
                  highlightColor: R.colors.highlightColorShimmer,
                  enabled: true,
                  child: const AppDataTable<Contacts>(
                    data: [],
                    headers: [],
                    dataExtractors: [],
                  ),
                ),
            success: (ContactsModel contactsModel) {
              final String? contactsMessage = contactsModel.message;
              final contacts = contactsModel.contacts;
              return AppDataTable<Contacts>(
                dataMessage: contactsMessage,
                data: contacts ?? [],
                headers: const [
                  "Contact Name",
                  "Company",
                  "Email",
                  "Phone",
                  "Lead Source",
                  "contact Assigned to",
                ],
                dataExtractors: [
                  (contacts) => contacts.contactName ?? '_',
                  (contacts) => contacts.company ?? '_',
                  (contacts) => contacts.email ?? '_',
                  (contacts) => contacts.mobile ?? '_',
                  (contacts) => contacts.leadSource ?? '_',
                  (contacts) => contacts.assigned?.name ?? '_',
                ],
                dataIdExtractor: (contacts) => (contacts.id ?? 0).toString(),
                dataLeadNameExtractor: (contacts) => contacts.firstName ?? '',
                onViewDetails: (id, leadName) {
                  // Get.toNamed(
                  //   RoutesNames.leadsView,
                  //   arguments: id != '' ? int.parse(id) : 0,
                  // );
                },
              );
            },
            error: (message) => const Center(
                  child: Text('An error occurred, Try again'),
                ),
            orElse: () {
              return const SizedBox.shrink();
            });
      },
    );
  }
}
