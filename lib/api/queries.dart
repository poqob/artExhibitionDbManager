enum Que {
  allPaints,
  allStatues,
  allDecorative,
  allArchitecture,
  allArtists,
  allMuseums
}

extension ExtensionQueries on Que {
  static const String artQueryRoot =
      "select art_id,art_name,art_artist_id,art_material_id,art_movement_id,art_about_id,artist_name,material_name,movement_name,about_text,about_img from";
  String get getQue {
    switch (name) {
      case "allArtists":
        return "select * from artists.allArtists();";
      case "allMuseums":
        return "select * from museums.allMuseums();";
      default:
        return "$artQueryRoot arts.$name();";
    }
  }
}
