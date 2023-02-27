import 'package:database_model/database_model.dart' as database_model;

Future<void> main(List<String> arguments) async {
  database_model.Db db = database_model.Db();
  await db.conn();
  var museums = await db.museums();
  var abouts;

  for (List element in museums) {
    abouts = await db.aboutMuseum(element.last).then((value) {
      print("\n\n${element[1]} ${value[0].last}");
    });
  }

  db.connKill();
}
