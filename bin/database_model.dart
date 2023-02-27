import 'package:database_model/api/museumApi.dart';
import 'package:database_model/models/museum.dart';
import 'package:postgres/postgres.dart';

Future<void> main(List<String> arguments) async {
  Db db = Db();
  List<Museum> museums = <Museum>[];
  await db.conn();

  dynamic response = await db.museumsResult.then((value) {
    for (var element in value) {
      museums.add(Museum(element[0], element[1], element[2]));
    }
  });

  for (var element in museums) {
    print(element.name);
  }

  await db.connKill();
}
