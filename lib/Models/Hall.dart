class Hall{
  String hid;
  List movieIds;
  List seats;
  String matrix;
  String name;

  Hall({required this.hid, required this.movieIds, required this.seats, required this.matrix, required this.name});

  factory Hall.fromJson(Map json){
    return Hall(
      hid: json['hid'],
      movieIds: json['movieIds'],
      seats: json['seats'],
      matrix: json['matrix'],
      name : json['name']
    );
  }
}