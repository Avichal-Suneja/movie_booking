import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_booking/Models/Hall.dart';
import 'package:movie_booking/Models/Movie.dart';
import 'package:movie_booking/Models/Ticket.dart';
import 'package:movie_booking/Services/auth_service.dart';
import 'package:movie_booking/Services/database_service.dart';

class HomeController extends GetxController {
  DatabaseService _db = Get.find<DatabaseService>();
  AuthService _auth = Get.find<AuthService>();

  RxList<Movie> movieList = <Movie>[].obs;
  RxList<Movie> searchedMovieList = <Movie>[].obs;

  RxList<Hall> hallList = <Hall>[].obs;

  late Movie selectedMovie;
  late Hall selectedHall;

  late DateTime startTime;
  late DateTime endTime;
  late Ticket bookedTicket;

  TextEditingController searchController = new TextEditingController();

  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'June',
    'July',
    'Aug',
    'Sept',
    'Oct',
    'Nov',
    'Dec'
  ];

  RxList<DateTime> dates = [DateTime.now(), DateTime.now().add(Duration(days: 1)),
    DateTime.now().add(Duration(days: 2)),DateTime.now().add(Duration(days: 3)),
    DateTime.now().add(Duration(days: 4)),DateTime.now().add(Duration(days: 5))].obs;
  
  List<TimeOfDay> time = [TimeOfDay(hour: 9, minute: 30), TimeOfDay(hour: 2, minute: 30),
    TimeOfDay(hour: 5, minute: 30), TimeOfDay(hour: 7, minute: 30)]; 

  List<RxBool> selectedDates = [false.obs,false.obs,false.obs,false.obs,false.obs,false.obs];
  List<RxBool> selectedTimes = [false.obs,false.obs,false.obs,false.obs];

  RxInt currentIndex = 0.obs;


  void selectMovie(Movie movie) async {
    selectedMovie = movie;
    getHallList();
    Get.toNamed('/movieInfo');
  }

  void selectHall(Hall hall){
    selectedHall = hall;
    Get.toNamed('/seat');
  }

  void selectDay(DateTime date, bool selected, int index){
    startTime = date;
    endTime = date;
    selectedDates[index].value = selected;
    for(int i=0; i<selectedDates.length; i++){
      if(i!=index && selected){
        selectedDates[i].value = false;
      }
    }
    dates.refresh();
  }
  
  void selectTime(TimeOfDay time, bool selected, int index){
    print(time);
    startTime = DateTime(endTime.year, endTime.month, endTime.day, time.hour, time.minute);
     var end = TimeOfDay(hour: time.hour + (selectedMovie.durationInMinutes/60).floor(), minute: time.minute + (selectedMovie.durationInMinutes%60).round());
     print(end);
    endTime = DateTime(startTime.year, startTime.month, startTime.day, end.hour, end.minute);

    print(startTime);
    print(endTime);
    selectedTimes[index].value = selected;
    for(int i=0; i<selectedTimes.length; i++){
      if(i!=index && selected){
        selectedTimes[i].value = false;
      }
    }
    dates.refresh();
  }

  void getHallList() async {
    hallList.bindStream(_db.getHallStreamWhere('Halls', 'movieIds', selectedMovie.mid).map((list) =>
        list.docs.map((doc) => Hall.fromJson(doc.data() as Map<String, dynamic>)).toList()));
  }

  void bookTicket() async {

    int amount = 0;
    List<int> positions = [];
    for(int i=0; i<selectedHall.seats.length; i++){
      if(selectedHall.seats[i]==1){
        amount++;
        positions.add(i);
      }
    }

    await _db.upsert('Tickets/${_auth.currentUser!.uid}', {
      'tid' : _auth.currentUser!.uid,
      'amount' : amount,
      'positions' : positions,
      'hid' : selectedHall.hid,
      'mid' : selectedMovie.mid,
      'startTime' : startTime,
      'endTime' : endTime,
    });

    for(var pos in positions){
      selectedHall.seats[pos] = 2;
    }

    await _db.upsert('Halls/${selectedHall.hid}',{
      'hid' : selectedHall.hid,
      'matrix' : selectedHall.matrix,
      'movieIds' : selectedHall.movieIds,
      'seats' : selectedHall.seats
    });

    Get.offAllNamed('/movie');
    Get.rawSnackbar(message: 'Tickets are successfully booked!');
  }

  getBookedTicket() async {
    Map? ticket = await _db.getData('Tickets/${_auth.currentUser!.uid}');
    Map? hall,movie;
    if(ticket!=null){
      hall = await _db.getData('Halls/${ticket['hid']}');
      movie = await _db.getData('Movies/${ticket['mid']}');
    }

    if(hall!=null && movie!=null && ticket!=null){
      Timestamp start = ticket['startTime'];
      Timestamp end = ticket['endTime'];
      bookedTicket = new Ticket(
        hallName: hall['name'],
        movieName: movie['name'],
        startTime: start.toDate(),
        endTime: end.toDate(),
        amount: ticket['amount'],
        positions: ticket['positions']
      );
    }
  }

  void logOut() async {
    await _auth.logout();
    Get.offAllNamed('/auth');
  }


  @override
  void onInit() {
    movieList.bindStream(_db.getStream('Movies').map((list) =>
        list.docs.map((doc) => Movie.fromJson(doc.data() as Map<String, dynamic>)).toList()));
    print(_auth.currentUser!.uid);

    searchedMovieList.value = movieList;

    searchController.addListener(() {
      searchedMovieList.value = movieList.where((movie){
        return movie.name.toLowerCase().contains(searchController.text.toLowerCase());
      }).toList();
    });

    super.onInit();
  }
}
