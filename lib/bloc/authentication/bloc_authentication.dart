import 'package:bloc/bloc.dart';
import 'package:database_model/bloc/authentication/states_authentication.dart';
import 'package:database_model/api/authentication.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(const AuthenticationInitial());

  Future<void> auth({
    required String username,
    required String password,
  }) async {
    try {
      emit(AuthenticationAuthing());
      await Authentication.instance.logIn(username, password);
      emit(AuthenticationAuth());
    } catch (e) {
      AuthenticationError error = state as AuthenticationError;
      throw Exception(error.message);
    }
  }

  Future<void> signUp({
    required String username,
    required String password,
    required int countryId,
    required int cityId,
  }) async {
    try {
      await Authentication.instance
          .signUp(username, password, countryId, cityId);
      await auth(username: username, password: password);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
