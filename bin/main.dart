import 'package:database_model/api/authentication.dart';
import 'package:database_model/api/db.dart';
import 'package:database_model/api/queries.dart';
import 'package:database_model/bloc/art/bloc_art.dart';
import 'package:database_model/bloc/art/states_art.dart';
import 'package:database_model/bloc/artists/bloc_artist.dart';
import 'package:database_model/bloc/artists/states_artist.dart';
import 'package:database_model/bloc/authentication/bloc_authentication.dart';
import 'package:database_model/bloc/museum/bloc_museum.dart';
import 'package:database_model/bloc/museum/states_museum.dart';

Future<void> main(List<String> arguments) async {
  await Db().conn(); //start db connection
  final cubitMuseum = MuseumCubits();
  print(cubitMuseum.state.toString());
  await cubitMuseum.getMuseums();

  MuseumLoaded content = cubitMuseum.state as MuseumLoaded;
  for (var element in content.museums) {
    print(element.museumName);
  }
//*************************************ArtistCubit********************************************** */
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

  //***********************************ArtCubit************************************************ */

  final cubitArt = ArtCubit();
  print(cubitArt.state);
  await cubitArt.getArt(Que.allPaints);
  print(cubitArt.state);
  ArtLoaded artContent = cubitArt.state as ArtLoaded;
  for (var element in artContent.arts) {
    print(element.artName);
  }
  await cubitArt.close();

  //********************************AuthenticationCubitSignUp****************************************** */

  final cubitAuth = AuthenticationCubit();
  print(cubitAuth.state);
  await cubitAuth.signUp(
      username: "poqobi", password: "poqobi", countryId: 1, cityId: 1);
  print(cubitAuth.state);
  print(Authentication.instance.getAuthState);
  print(Authentication.instance.getUsername);
  print(Authentication.instance.getPassword);
  cubitAuth.close();

  //********************************AuthenticationCubitLogIn******************************************* */
  /*
  final cubitAuth = AuthenticationCubit();
  print(cubitAuth.state);
  await cubitAuth.auth(username: "pattis12", password: "abc1234");
  print(cubitAuth.state);
  print(Authentication.instance.getAuthState);
  cubitAuth.close();
  */

  await Db().connKill(); //kill the db connection.
}
