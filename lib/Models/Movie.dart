class Movie{
  String mid;
  String name;
  int durationInMinutes;

  Movie({required this.mid, required this.name, required this.durationInMinutes});

  factory Movie.fromJson (Map json){
    return Movie(
      mid: json['mid'],
      name: json['name'],
      durationInMinutes: json['duration']
    );
  }
}