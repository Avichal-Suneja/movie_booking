class Hall{
  String hid;
  List movieIds;
  Map seats;
  String matrix;
  String name;
  String address;

  Hall({required this.hid, required this.movieIds, required this.seats, required this.matrix, required this.name, required this.address});

  factory Hall.fromJson(Map json){
    return Hall(
      hid: json['hid'],
      movieIds: json['movieIds'],
      seats: json['seats'],
      matrix: json['matrix'],
      name : json['name'],
      address: json['address']
    );
  }
}