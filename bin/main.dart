import 'package:database_model/api/db.dart';
import 'package:database_model/bloc/artists/bloc_artist.dart';
import 'package:database_model/bloc/artists/states_artist.dart';
import 'package:database_model/bloc/museum/bloc_museum.dart';
import 'package:database_model/bloc/museum/states_museum.dart';

Future<void> main(List<String> arguments) async {
  await Db().conn();
  final cubitMuseum = MuseumCubits();
  print(cubitMuseum.state.toString());
  await cubitMuseum.getMuseums();

  MuseumLoaded content = cubitMuseum.state as MuseumLoaded;
  for (var element in content.museums) {
    print(element.museumName);
  }
//********************************************************************************************* */
  await cubitMuseum.close();

  final cubitArtist = ArtistCubit();
  print(cubitArtist.state);
  await cubitArtist.getArtist();
  print(cubitArtist.state);

  ArtistLoaded contentArtist = cubitArtist.state as ArtistLoaded;
  for (var element in contentArtist.artists) {
    print(element.artistName);
  }
  await cubitArtist.close();
  await Db().connKill();
}
