import 'package:database_model/api/museum_api.dart';
import 'package:database_model/models/art/model_art.dart';

class ArtView extends Art {
  late final String? _tittle;
  late final String? _imageUrl;
  late final String? _text;
  late final String? _artistName;

  ArtView(List art) : super.fromList(art);

  Future<void> getArt() async {
    await Db().query("select");
  }
}
