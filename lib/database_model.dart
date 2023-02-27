import 'package:postgres/postgres.dart';

// research how to create an instance of database.

class Db {
  late final PostgreSQLConnection connection;

  Db() {}

  Future<void> conn() async {
    connection = PostgreSQLConnection("localhost", 5432, "postgres",
        username: "postgres", password: "12345");
    await connection.open();
  }

  //returns museums as list of list.
  Future<PostgreSQLResult> museums() async {
    PostgreSQLResult result =
        await connection.query("select * from museums.museums;");
    return result;
  }

  Future<PostgreSQLResult> aboutMuseum(int aboutId) async {
    PostgreSQLResult result = await connection
        .query("select * from about.about_museum where about_id=$aboutId;");
    return result;
  }

  Future<void> connKill() => connection.close();
}

class ModelForMuseums {}

class ModelforPaints {
  // We'll fetch every data from arts.art schema and db which has 'p' parameter under 'art_type' column.
  // Then we will drip that block datas to model.
  // Finally, models are ready to turning to json format.
}
