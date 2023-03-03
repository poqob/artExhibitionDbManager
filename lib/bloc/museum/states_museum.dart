//states are written here.

import 'package:database_model/models/museum/model_museum.dart';
//import 'package:flutter/foundation.dart';

abstract class MuseumStates {
  const MuseumStates();
}

class MuseumInitial extends MuseumStates {
  const MuseumInitial();
}

class MuseumLoading extends MuseumStates {
  const MuseumLoading();
}

class MuseumLoaded extends MuseumStates {
  final List<Museum> museums;
  const MuseumLoaded(this.museums);

  @override
  bool operator ==(Object other) {
    if (other is MuseumLoaded) {
      return true;
    } else {
      return false;
    }
  }
}

class MuseumsError extends MuseumStates {
  final String message;

  const MuseumsError(this.message);
}
