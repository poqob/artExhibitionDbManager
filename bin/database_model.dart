import 'package:database_model/models/museum.dart';
import 'package:database_model/api/museum_api.dart';

Future<void> main(List<String> arguments) async {
  //db instances
  Db db = Db();

  //museums that will be listed here.
  List<Museum> museums = <Museum>[];

  //connection to db
  await db.conn();

  //get all museum results from database
  await db.museumsResult.then((value) {
    for (var element in value) {
      museums.add(Museum(element[0], element[1], element[2]));
    }
  });

  for (var element in museums) {
    print(element.name);
  }

  await db.connKill();
}
