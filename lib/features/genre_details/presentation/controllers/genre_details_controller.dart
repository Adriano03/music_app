import 'package:get/get.dart';
import 'package:music_app/core/errors/failures.dart';
import 'package:music_app/core/mixins/screen_loading_and_error_mixin.dart';
import 'package:music_app/features/genre_details/data/repositories/genre_details_repository.dart';
import 'package:music_app/shared/features/music_app/presentation/controllers/music_player_controller.dart';
import 'package:music_app/shared/models/genre_details_model.dart';
import 'package:music_app/shared/models/genre_model.dart';
import 'package:music_app/shared/models/music_model.dart';

class GenreDetailsController extends GetxController with ScreenLoadingAndErrorMixin {
  final GenreDetailsRepository _genreDetailsRepository;
  final MusicPlayerController _musicPlayerController;

  GenreDetailsController(
    GenreDetailsRepository genreDetailsRepository,
    MusicPlayerController musicPlayerController,
  )   : _genreDetailsRepository = genreDetailsRepository,
        _musicPlayerController = musicPlayerController;

  GenreDetailsModel? genreDetails;

  @override
  void onInit() {
    // Recupera o argumento de genreListScreen do onTap em InkWell;
    final genre = Get.arguments as GenreModel;

    loadGenreDetails(genre.searchString);

    super.onInit();
  }

  Future<void> loadGenreDetails(String genre) async {
    setLoadingToTrue();
    setError(null);

    final genreDetailsResponseEither = await _genreDetailsRepository.getGenreDetails(genre);

    genreDetailsResponseEither.fold((Failure failureResponse) {
      if (failureResponse is GetGenreDetailsFailure) {
        setError(failureResponse.message);
      }
    }, (GenreDetailsModel genreDetailsResponse) {
      genreDetails = genreDetailsResponse;

      // Carrega a selected playlist de musicplayer controller;
      _musicPlayerController.loadPlaylist(
        genreDetailsResponse.musics,
        _musicPlayerController.selectedPlayList,
      );
    });

    setLoadingToFalse();
  }

  MusicModel? getMusicByIndex(int index) => genreDetails?.musics[index];

  List<MusicModel>? get getMusic => genreDetails?.musics;
}
