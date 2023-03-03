import 'package:database_model/api/db.dart';
import 'package:database_model/api/queries.dart';
import 'package:database_model/models/art/model_art.dart';

void main() async {
  await Db().conn();
  await testfun();
  await Db().connKill();
}

//logic-cubit
Future<void> testfun() async {
  List list = [];
  await Db().query(Queries.queries["allPaints"]!).then((value) {
    for (var element in value) {
      list.add(Art.fromList(element));
    }
  });
}
