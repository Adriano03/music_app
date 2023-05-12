import 'package:dartz/dartz.dart';
import 'package:music_app/core/errors/exceptions.dart';
import 'package:music_app/core/errors/failures.dart';
import 'package:music_app/core/services/api_service.dart';
import 'package:music_app/shared/models/genre_model.dart';

class GenreListRepository {
  final ApiService _apiService;

  GenreListRepository({
    required ApiService apiService,
  }) : _apiService = apiService;

  // O Either faz com que possa ser retornada dois métodos (Failure e List);
  Future<Either<Failure, List<GenreModel>>> getGenreList() async {
    try {
      final genres = await _apiService.getGenres();
      // Retorna gênero da direita;
      return Right(genres);
    } on ApiException catch (apiException) {
      return Left(GetGenreListFailure(apiException.message));
    } on GeneralException catch (generalException) {
      return Left(GetGenreListFailure(generalException.message));
    }
  }
}
