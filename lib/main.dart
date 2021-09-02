import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_booking/Modules/Authentication/auth_view.dart';
import 'package:movie_booking/Modules/Home/bindings/home_bindings.dart';
import 'package:movie_booking/Modules/Home/views/halls_list_view.dart';
import 'package:movie_booking/Modules/Home/views/movie_list_view.dart';
import 'package:movie_booking/Modules/Home/views/seat_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movie Booking',
      getPages: [
        GetPage(name: '/auth', page: ()=> AuthView()),
        GetPage(name: '/movie', page: ()=> MovieListView(), binding: HomeBinding()),
        GetPage(name: '/hall', page: ()=> HallListView(), binding: HomeBinding()),
        GetPage(name: '/seat', page: ()=> SeatView(), binding: HomeBinding()),
      ],
      initialRoute: '/auth',
    );
  }
}
