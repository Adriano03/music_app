import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:music_app/core/erros/exceptions.dart';
import 'package:music_app/shared/models/genre_details_model.dart';
import 'package:music_app/shared/models/genre_model.dart';

class ApiService extends DioForNative {
  ApiService([super.baseOptions]);

  Future<List<GenreModel>> getGenres() async {
    try {
      const endPoint = "/genres";

      final response = await get(endPoint);

      return (response.data as List).map((genre) => GenreModel.fromMap(genre)).toList();
    } on DioError catch (dioError, s) {
      log('Erro ao fazer o get dos gêneros musicais', error: dioError, stackTrace: s);
      throw ApiException(
        message: 'Erro ao carregar gêneros.',
        statusCode: dioError.response?.statusCode,
      );
    } catch (error, s) {
      log('Erro ao fazer o get dos gêneros musicais', error: error, stackTrace: s);
      throw GeneralException();
    }
  }

  Future<GenreDetailsModel> getGenreDetails({required String genre}) async {
    try {
      final endPoint = "/genres/$genre";

      final response = await get(endPoint);

      return GenreDetailsModel.fromMap(response.data);
    } on DioError catch (dioError, s) {
      log('Erro ao fazer o get dos detalhes do gênero musical.',
          error: dioError, stackTrace: s);
      throw ApiException(
        message: 'Erro ao fazer o get dos detalhes do gênero musical.',
        statusCode: dioError.response?.statusCode,
      );
    } catch (error, s) {
      log('Erro ao fazer o get dos detalhes do gênero musical.', error: error, stackTrace: s);
      throw GeneralException();
    }
  }
}
