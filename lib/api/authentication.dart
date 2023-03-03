import 'package:database_model/api/db.dart';

class Authentication {
  // making Authentication singleton.
  Authentication._privateConstructor();
  static final Authentication _instance = Authentication._privateConstructor();
  static Authentication get instance => _instance;

  //fields for login situation
  String? _username;
  String? _password;
  bool? _authState = false;

  //methods
  Future<bool> logIn(String username, String password) async {
    dynamic res;
    await Db()
        .query("select users.auth('$username','$password');")
        .then((value) {
      res = value[0][0];

      //type check
      res.runtimeType != bool
          ? throw Exception(
              "database query result's runtime type is not boolean. runtimetype: ${res.runtimeType}")
          : res;

      //true situation
      if (res) {
        _username = username;
        _password = password;
        _authState = true;
      }
    });
    return res;
  }

  //weak method!
  Future<void> signUp(
      String username, String password, int countryId, int cityId) async {
    await Db()
        .query(
            "select users.signUpFromForm('$username','$password','$countryId','$cityId');")
        .then((value) {
      _username = username;
      _password = password;
      _authState = true;
    });
  }
}

// getters
extension ExceptionAuth on Authentication {
  String? get getUsername => _authState == true ? _username : null;
  String? get getPassword => _authState == true ? _password : null;
  bool? get authState => _authState;
}
