import 'package:bloc/bloc.dart';
import 'package:database_model/api/db.dart';
import 'package:database_model/api/queries.dart';
import 'package:database_model/bloc/art/states_art.dart';
import 'package:database_model/models/art/model_art.dart';

class ArtCubit extends Cubit<ArtStates> {
  ArtCubit() : super(const ArtInitial());

  Future<void> getArt(Que que) async {
    try {
      emit(ArtLoading());

      List<Art> arts = <Art>[];

      await Db().query(que.getQue).then((value) {
        for (var element in value) {
          arts.add(Art.fromList(element));
        }
      });

      emit(ArtLoaded(arts));
    } catch (e) {
      emit(ArtError(e.toString()));
    }
  }
}
