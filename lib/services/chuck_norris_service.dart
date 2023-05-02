import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter_app/models/categories.dart';
import 'package:flutter_app/models/joke.dart';
import 'package:flutter_app/models/search_jokes.dart';

class ChuckNorrisService {
  static const urlPrefix = 'https://api.chucknorris.io/jokes';

  Future<Joke?> getRandomJoke({
    String? category,
  }) async {
    var client = http.Client();
    Uri uri;

    if (category != '' && category != null) {
      uri = Uri.parse('$urlPrefix/random?category=$category');
    } else {
      uri = Uri.parse('$urlPrefix/random');
    }

    var response = await client.get(uri);

    if (response.statusCode != 200) {
      return null;
    }

    return Joke.fromJson(json.decode(response.body));
  }

  Future<List<String>?> getCategories() async {
    var client = http.Client();
    var uri = Uri.parse('$urlPrefix/categories');

    var response = await client.get(uri);

    if (response.statusCode != 200) {
      return null;
    }

    return categoriesFromJson(json.decode(response.body));
  }
}
