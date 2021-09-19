class Movie{
  String mid;
  String name;
  String posterUrl;
  int durationInMinutes;
  String description;
  String genre;

  Movie({required this.mid, required this.name, required this.durationInMinutes, required this.posterUrl, required this.description, required this.genre});

  factory Movie.fromJson (Map json){
    return Movie(
      mid: json['mid'],
      name: json['name'],
      durationInMinutes: json['duration'],
      posterUrl: json['posterUrl'],
      genre: json['genre'],
      description: json['description'],
    );
  }
}