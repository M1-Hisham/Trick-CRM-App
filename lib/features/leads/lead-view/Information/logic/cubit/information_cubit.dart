import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';
import '../../data/model/edit_lead_model.dart';

class InformationCubit extends BaseCubit<EditLeadModel> {
  InformationCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                apiService.getEditLead(params!['id']),
          ),
        );
  Future<void> getInformation(int leadId) async {
    await getData(params: {'id': leadId});
  }
}
