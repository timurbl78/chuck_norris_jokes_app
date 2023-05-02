import 'package:dio/dio.dart';
import 'package:flutter_app/models/categories.dart';
import 'package:flutter_app/models/joke.dart';
import 'package:flutter_app/models/search_jokes.dart';

class ChuckNorrisService {
  static const _BASE_URL = 'https://api.chucknorris.io/jokes';

  final Dio _dio = Dio(
    BaseOptions(baseUrl: _BASE_URL),
  );

  Future<Joke?> getRandomJoke({
    String category = '',
  }) async {
    Map<String, String> query = {};

    if (category != '') {
      query = {'category': category};
    }

    final response = await _dio.get(
      '/random',
      queryParameters: query,
    );

    if (response.statusCode != 200) {
      return null;
    }

    return Joke.fromJson(response.data);
  }

  Future<SearchJokes?> searchJokes({
    required String query,
  }) async {
    final response = await _dio.get(
      '/random',
      queryParameters: {'query': query},
    );

    if (response.statusCode != 200) {
      return null;
    }

    return SearchJokes.fromJson(response.data);
  }

  Future<List<String>?> getCategories() async {
    final response = await _dio.get(
      '/categories',
    );

    if (response.statusCode != 200) {
      return null;
    }

    return categoriesFromJson(response.data);
  }
}
