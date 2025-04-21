import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/login/data/models/login_response.dart';
import '../helpers/shaerd_pref_helper.dart';

class UserCubit extends Cubit<UserData?> {
  UserCubit() : super(null);

  /// Get user data from shared preferences
  Future<void> loadUserData() async {
    final userData = await SharedPrefHelper.getUser();
    emit(userData);
  }

  /// Clear user data from shared preferences
  void clearUserData() {
    emit(null);
  }
}
