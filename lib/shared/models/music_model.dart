class MusicModel {
  final String? img;
  final String title;
  final String url;
  final int duration;

  MusicModel({
    this.img,
    required this.title,
    required this.url,
    required this.duration,
  });

  // Pega um map de chave e valor como argumento, usa os valores para passar para as váriaveis da model;
  factory MusicModel.fromMap(Map<String, dynamic> map) {
    return MusicModel(
      img: map['img'],
      title: map['title'] ?? '',
      url: map['path'] ?? '',
      duration: map['duration'] ?? 0,
    );
  }
}
