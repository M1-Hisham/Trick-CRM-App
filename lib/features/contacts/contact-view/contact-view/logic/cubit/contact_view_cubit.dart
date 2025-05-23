import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/contacts/contact-view/contact-view/data/model/contacts_view_model.dart';
import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';

class ContactViewCubit extends BaseCubit<ContactsViewModel> {
  ContactViewCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                apiService.getContactView(params!['id']),
          ),
        );
  Future<void> getContactView(int contactId) async {
    await getData(params: {'id': contactId});
  }
}
