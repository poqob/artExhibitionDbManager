// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:database_model/api/db.dart';
import 'package:database_model/api/queries.dart';
import 'package:database_model/bloc/museum/states_museum.dart';
import 'package:database_model/models/museum/model_museum.dart';

//methods are written here according to MuseumStates.

class MuseumCubits extends Cubit<MuseumStates> {
  MuseumCubits() : super(const MuseumInitial());

  Future<void> getMuseums() async {
    try {
      emit(const MuseumLoading());

      //museums that will be listed here.
      List<Museum> museums = <Museum>[];

      await Db().query(Que.allMuseums.getQue).then((value) {
        for (var element in value) {
          museums.add(Museum.fromList(element));
        }
      });

      emit(MuseumLoaded(museums));
    } catch (e) {
      emit(MuseumsError(e.toString()));
    }
  }
}
