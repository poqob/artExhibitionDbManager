import 'package:bloc/bloc.dart';
import 'package:database_model/bloc/authentication/states_authentication.dart';
import 'package:database_model/api/authentication.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(const AuthenticationInitial());

  Future<void> auth(
      {required String username, required String password}) async {
    try {
      emit(AuthenticationAuthing());
      await Authentication.instance.logIn(username, password);
      emit(AuthenticationAuth());
    } catch (e) {
      AuthenticationError error = state as AuthenticationError;
      throw Exception(e.toString());
    }
  }
}
