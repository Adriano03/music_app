import 'package:music_app/shared/models/genre_model.dart';
import 'package:music_app/shared/models/music_model.dart';

class GenreDetailsModel extends GenreModel {
  final List<MusicModel> musics;

  GenreDetailsModel({
    super.img,
    required super.title,
    required super.searchString,
    required this.musics,
  });

  factory GenreDetailsModel.fromMap(Map<String, dynamic> map) {
    return GenreDetailsModel(
      img: map['img'],
      title: map['title'] ?? '',
      searchString: map['searchString'] ?? '',
      musics: (map['musics'] as List).map((music) => MusicModel.fromMap(music)).toList(),
    );
  }
}
