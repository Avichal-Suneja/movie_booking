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
  RxList<Hall> hallList = <Hall>[].obs;
  late Movie selectedMovie;
  late Hall selectedHall;

  late DateTime startTime;
  late DateTime endTime;
  late Ticket bookedTicket;


  void selectMovie(Movie movie){
    selectedMovie = movie;
  }

  void selectHall(Hall hall){
    selectedHall = hall;
  }

  void getHallList(){
    hallList.bindStream(_db.getHallStreamWhere('Halls', 'movieIds', selectedMovie.mid).map((list) =>
        list.docs.map((doc) => Hall.fromJson(doc.data() as Map<String, dynamic>)).toList()));
  }

  void bookTicket(int position) async {
    await _db.upsert('Tickets/${_auth.currentUser!.uid}', {
      'tid' : _auth.currentUser!.uid,
      'hid' : selectedHall.hid,
      'mid' : selectedMovie.mid,
      'startTime' : startTime,
      'endTime' : endTime,
    });
    selectedHall.seats[position] = 1;

    await _db.upsert('Halls/${selectedHall.hid}',{
      'hid' : selectedHall.hid,
      'matrix' : selectedHall.matrix,
      'movieIds' : selectedHall.movieIds,
      'seats' : selectedHall.seats
    });
  }

  getBookedTicket() async {
    Map? ticket = await _db.getData('Tickets/${_auth.currentUser!.uid}');
    Map? hall,movie;
    if(ticket!=null){
      hall = await _db.getData('Halls/${ticket['hid']}');
      movie = await _db.getData('Movies/${ticket['mid']}');
    }
    if(hall!=null && movie!=null && ticket!=null){
      bookedTicket = new Ticket(
        hallName: hall['name'],
        movieName: movie['name'],
        startTime: ticket['startTime'],
        endTime: ticket['endTime']
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
    super.onInit();
  }
}
