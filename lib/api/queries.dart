class Queries {
  static const String artQueryRoot =
      "select art_id,art_name,art_artist_id,art_material_id,art_movement_id,art_about_id,artist_name,material_name,movement_name,about_text,about_img from";
  static Map<String?, String?> queries = <String?, String?>{
    "allPaints": "$artQueryRoot arts.allPaints();",
    "allStatues": "$artQueryRoot arts.allStatues();",
    "allDecorative": "$artQueryRoot arts.allDecorative();",
    "allArchitecture": "$artQueryRoot arts.allArchitecture();",
  };
}

enum Que { allPaints, allStatues, allDecorative, allArchitecture }

extension ExtensionQueries on Que {
  static const String artQueryRoot =
      "select art_id,art_name,art_artist_id,art_material_id,art_movement_id,art_about_id,artist_name,material_name,movement_name,about_text,about_img from";
  String get getQue => "$artQueryRoot arts.$name();";
}
