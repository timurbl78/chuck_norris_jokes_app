import 'joke.dart';

class SearchJokes {
  int total;
  List<Joke> result;

  SearchJokes({
    required this.total,
    required this.result,
  });

  factory SearchJokes.fromJson(Map<String, dynamic> json) => SearchJokes(
        total: json["total"],
        result: List<Joke>.from(json["result"].map((x) => Joke.fromJson(x))),
      );
}
