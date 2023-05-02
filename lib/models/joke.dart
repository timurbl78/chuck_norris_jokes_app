class Joke {
  String id;
  String text;
  String? iconUrl;
  String? url;

  Joke({
    required this.id,
    required this.text,
    this.iconUrl,
    this.url,
  });

  factory Joke.fromJson(Map<String, dynamic> json) => Joke(
        id: json["id"],
        text: json["value"],
        iconUrl: json["icon_url"],
        url: json["url"],
      );
}
