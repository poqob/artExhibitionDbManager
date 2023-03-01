import 'package:postgres/postgres.dart';

class Db {
  //Singleton architecture with factory.
  static final Db _singleton = Db._interval();
  Db._interval();
  factory Db() {
    return _singleton;
  }
  //var d1 = Db();
  //var d2 = Db();
  //print(identical(d1, d2)); output: true

  //Singleton architecture with Static field with getter.
  /*
  //definition
  Db._privateConstructor();
  static final Db _instance = Db_privateConstructor();
  static Db get instance => _instance;
  
  //usage
  Db db=Db.instance
   */

  late final PostgreSQLConnection connection;
  Future<void> conn() async {
    connection = PostgreSQLConnection("localhost", 5432, "postgres",
        username: "postgres", password: "12345");
    await connection.open();
  }

  Future<void> connKill() async => await connection.close();

  //returns museums as list of list.
  Future<PostgreSQLResult> _museums() async {
    PostgreSQLResult result = await connection
        .query("select museum_id, museum, about_id from museums.museums;");
    return result;
  }

  Future<PostgreSQLResult> _aboutMuseum(int aboutId) async {
    PostgreSQLResult result = await connection.query(
        "select about_text, about_img from about.about_museum where about_id=$aboutId;");
    return result;
  }

  Future<dynamic> get museumsResult async {
    var museum = await _museums();
    List res = [];
    for (List element in museum) {
      await _aboutMuseum(element.last).then((value) {
        //print("${element[1]}  ${value[0][0]}  ${value[0][1]}");
        res.add([element[1], value[0][0], value[0][1]]);
      });
    }
    return res;
  }

  Future<PostgreSQLResult> query(String query) async {
    PostgreSQLResult result = await connection.query(query);
    return result;
  }
}
