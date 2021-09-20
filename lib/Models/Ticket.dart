class Ticket{
  String hallName;
  String movieName;
  DateTime startTime;
  DateTime endTime;
  int amount;
  List<dynamic> positions;

  Ticket({required this.hallName, required this.startTime, required this.endTime, required this.movieName,
  required this.amount, required this.positions});

}