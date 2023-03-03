import 'package:database_model/api/authentication.dart';
import 'package:database_model/api/db.dart';
import 'package:database_model/api/queries.dart';
import 'package:database_model/bloc/museum/bloc_museum.dart';
import 'package:database_model/bloc/museum/states_museum.dart';
import 'package:database_model/models/museum/model_museum.dart';

Future<void> main(List<String> arguments) async {
  await Db().conn();
  final cubit = MuseumCubits();
  print(cubit.state.toString());
  await cubit.getMuseums();

  MuseumLoaded content = cubit.state as MuseumLoaded;
  content.museums.forEach((element) {
    print(element.museumName);
  });

  await cubit.close();
  await Db().connKill();
}
