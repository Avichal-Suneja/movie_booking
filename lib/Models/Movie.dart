class Movie{
  String mid;
  String name;
  String posterUrl;
  int durationInMinutes;

  Movie({required this.mid, required this.name, required this.durationInMinutes, required this.posterUrl});

  factory Movie.fromJson (Map json){
    return Movie(
      mid: json['mid'],
      name: json['name'],
      durationInMinutes: json['duration'],
      posterUrl: json['posterUrl']
    );
  }
}