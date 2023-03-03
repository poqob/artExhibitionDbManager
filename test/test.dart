import 'package:database_model/api/authentication.dart';
import 'package:database_model/api/db.dart';

void main() async {
  await Db().conn();
  await Authentication.instance.logIn("poqob", "abc123");
  print(Authentication.instance.getAuthState);
  await Db().connKill();
}
