import 'package:database_model/models/model_museum.dart';
import 'package:database_model/api/museum_api.dart';

Future<void> main(List<String> arguments) async {
  //db instances
  Db db = Db();
  //connection to db
  await db.conn();

  //closing db
  await db.connKill();
}
