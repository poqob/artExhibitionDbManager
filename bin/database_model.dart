import 'package:database_model/api/db.dart';

Future<void> main(List<String> arguments) async {
  //db instances
  Db db = Db();
  //connection to db
  await db.conn();

  //closing db
  await db.connKill();
}
