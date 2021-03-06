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
  List currentSeats = [];

  late Movie selectedMovie;
  late Hall selectedHall;

  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now();
  Ticket bookedTicket = new Ticket(hallName: 'no', startTime: DateTime.now(), endTime: DateTime.now(), movieName: '', amount: 0, positions: []);
  late String uid;
  String userName = '';
  String userEmail = '';
  String userPhone = '';


  TextEditingController searchController = new TextEditingController();
  int j=0;

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
  
  List<TimeOfDay> time = [TimeOfDay(hour: 2, minute: 30),
    TimeOfDay(hour: 5, minute: 30), TimeOfDay(hour: 7, minute: 30),TimeOfDay(hour: 9, minute: 30), ];

  List<RxBool> selectedDates = [true.obs,false.obs,false.obs,false.obs,false.obs,false.obs];
  List<RxBool> selectedTimes = [true.obs,false.obs,false.obs,false.obs];

  RxInt currentIndex = 0.obs;


  void selectMovie(Movie movie) async {
    selectedMovie = movie;
    getHallList();
    Get.toNamed('/movieInfo');
  }

  void selectHall(Hall hall){
    selectedHall = hall;
    currentSeats = selectedHall.seats[selectedMovie.mid]['Day-0'][time[0].toString()];
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
    currentSeats = selectedHall.seats[selectedMovie.mid]['Day-${index.toString()}'][time[0].toString()];
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

    for(j=0; j<dates.length; j++){
      if(dates[j].day == startTime.day)
        break;
    }
    currentSeats = selectedHall.seats[selectedMovie.mid]['Day-${j.toString()}'][time.toString()];
    dates.refresh();
  }

  void getHallList() async {
    hallList.bindStream(_db.getHallStreamWhere('Halls', 'movieIds', selectedMovie.mid).map((list) =>
        list.docs.map((doc) => Hall.fromJson(doc.data() as Map<String, dynamic>)).toList()));
  }

  void bookTicket() async {
    if(bookedTicket.hallName!='no'){
      Get.offAllNamed('/movie');
      Get.rawSnackbar(message: 'Can not Book Another Ticket, while one is already pending!', duration: Duration(seconds: 5));
    }else{
      int amount = 0;
      List<int> positions = [];
      for(int i=0; i<currentSeats.length; i++){
        if(currentSeats[i]==1){
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
        currentSeats[pos] = 2;
      }

      int k=0;
      for(var bul in selectedTimes){
        if(bul.value)
          break;
        else
          k++;
      }

      await _db.upsert('Halls/${selectedHall.hid}',{
        'hid' : selectedHall.hid,
        'matrix' : selectedHall.matrix,
        'movieIds' : selectedHall.movieIds,
        'seats' : {
          selectedMovie.mid : {
            'Day-${j.toString()}' : {
              time[k].toString() : currentSeats
            }
          }
        }
      });

      Get.offAllNamed('/movie');
      showDialog();
    }
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

  showDialog() {
    return Get.defaultDialog(
      title: '',
      barrierDismissible: true,
      backgroundColor: Color(0xff2c2e43),
        content: Container(
          color: Color(0xff2c2e43),
          child: Column(
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 104.0,),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Center(
                  child: Text('YaY', style: TextStyle(
                    color: Color(0xffffd523),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 32),
                child: Center(
                  child: Text('Ticket is Successfully Booked!!', style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),),
                ),
              )
            ],
          ),
        ),
    );
  }


  @override
  void onInit() async {
    movieList.bindStream(_db.getStream('Movies').map((list) =>
        list.docs.map((doc) => Movie.fromJson(doc.data() as Map<String, dynamic>)).toList()));
    
    uid = _auth.currentUser!.uid;
    Map<String, dynamic>? data = await _db.getData('Customers/$uid');
    userName = data!['name'];
    userEmail = data['email'];
    userPhone = data['phone'];

    searchedMovieList.value = movieList;

    searchController.addListener(() {
      searchedMovieList.value = movieList.where((movie){
        return movie.name.toLowerCase().contains(searchController.text.toLowerCase());
      }).toList();
    });

    super.onInit();
  }
}
