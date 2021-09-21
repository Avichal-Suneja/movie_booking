import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_booking/Modules/Authentication/auth_view.dart';
import 'package:movie_booking/Modules/Home/bindings/home_bindings.dart';
import 'package:movie_booking/Modules/Home/views/halls_list_view.dart';
import 'package:movie_booking/Modules/Home/views/movie_info_view.dart';
import 'package:movie_booking/Modules/Home/views/movie_list_view.dart';
import 'package:movie_booking/Modules/Home/views/profile_view.dart';
import 'package:movie_booking/Modules/Home/views/seat_view.dart';
import 'package:movie_booking/Modules/Home/views/ticket_info_view.dart';
import 'package:movie_booking/Services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final String initialPath = AuthService().currentUser==null? '/auth' : '/movie';
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movie Booking',
      getPages: [
        GetPage(name: '/auth', page: ()=> AuthView()),
        GetPage(name: '/movie', page: ()=> MovieListView(), binding: HomeBinding()),
        GetPage(name: '/movieInfo', page: ()=> MovieInfoView(), binding: HomeBinding()),
        GetPage(name: '/hall', page: ()=> HallListView(), binding: HomeBinding()),
        GetPage(name: '/seat', page: ()=> SeatView(), binding: HomeBinding()),
        GetPage(name: '/ticket', page: ()=> TicketInfoView(), binding: HomeBinding()),
        GetPage(name: '/profile', page: ()=> ProfileView(), binding: HomeBinding()),
      ],
      initialRoute: '/movie',
    );
  }
}
