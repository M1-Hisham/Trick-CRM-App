import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/widgets/app_error_message.dart';
import 'package:trick_crm_app/core/widgets/app_show_modal_bottom_sheet.dart';
import 'package:trick_crm_app/features/contacts/contacts/data/contacts_model.dart';
import 'package:trick_crm_app/features/contacts/contact-view/contact-view/presentation/screens/contact_view.dart';
import 'package:trick_crm_app/features/contacts/contacts/logic/cubit/contacts_cubit.dart';

import '../../../../../core/cubits/base_state.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_data_table.dart';
import '../../../create-contacts/presentation/create_contact_screen.dart';
import 'contacts_loading_screen.dart';

class ContactsDataBlocBuilder extends StatelessWidget {
  const ContactsDataBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsCubit, BaseState<ContactsModel>>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => contactsLoadingScreen(),
            success: (ContactsModel contactsModel) {
              final String? contactsMessage = contactsModel.message;
              final contacts = contactsModel.contacts;
              return Column(
                children: [
                  AppButton(
                    icon: SvgPicture.asset(R.icons.add),
                    text: 'Create Contacts',
                    onPressed: () async {
                      final result = await appShowModalBottomSheet(
                        context: context,
                        builder: (context) => CreateContactScreen(
                          contactsModel: contactsModel,
                        ),
                      );
                      if (result == true) {
                        // Refresh the data after creating a new call
                        // ignore: use_build_context_synchronously
                        context.read<ContactsCubit>().getData();
                      }
                    },
                  ),
                  spacingV(20),
                  Row(
                    children: [
                      Expanded(
                        child: AppButton(
                          icon: SvgPicture.asset(R.icons.importOptions),
                          text: 'Import Options',
                          onPressed: () {},
                        ),
                      ),
                      spacingH(8),
                      Expanded(
                        child: AppButton(
                          icon: SvgPicture.asset(R.icons.exportOptions),
                          text: 'Export Options',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  spacingV(20),
                  AppDataTable<Contacts>(
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
                    dataIdExtractor: (contacts) =>
                        (contacts.id ?? 0).toString(),
                    dataLeadNameExtractor: (contacts) =>
                        contacts.contactName ?? '',
                    onViewDetails: (id, contactName) {
                      Get.to(
                        () => ContactView(
                          contactId: int.parse(id),
                          contactName: contactName,
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
                    context.read<ContactsCubit>().getData();
                  },
                ),
            orElse: () {
              return const SizedBox.shrink();
            });
      },
    );
  }
}
