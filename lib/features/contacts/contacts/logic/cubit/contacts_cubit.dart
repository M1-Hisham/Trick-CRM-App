import '../../../../../core/api/api_service.dart';
import '../../../../../core/cubits/base_cubit.dart';
import '../../../../../core/repo/base_repo.dart';
import '../../data/contacts_model.dart';

class ContactsCubit extends BaseCubit<ContactsModel> {
  ContactsCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({params}) => apiService.getContacts(),
          ),
        );
}
