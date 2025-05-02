import 'package:trick_crm_app/core/api/api_service.dart';
import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';
import '../../data/model/clients_view_model.dart';

class ClientViewCubit extends BaseCubit<ClientsViewModel> {
  ClientViewCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                apiService.getClientView(params!['id']),
          ),
        );
  Future<void> getClientView(int clientId) async {
    await getData(params: {'id': clientId});
  }
}
