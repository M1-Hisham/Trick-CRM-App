import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/clients/client-view/client-view/data/model/clients_view_model.dart';
import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';

class InfoClientViewCubit extends BaseCubit<ClientsViewModel> {
  InfoClientViewCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                apiService.getClientView(params!['id']),
          ),
        );
  Future<void> getInformationView(int clientId) async {
    await getData(params: {'id': clientId});
  }
}
