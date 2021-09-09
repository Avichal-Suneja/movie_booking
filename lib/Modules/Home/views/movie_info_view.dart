import 'package:flutter/material.dart';
import 'package:movie_booking/Modules/Home/controllers/home_controller.dart';
import 'package:get/get.dart';

class MovieInfoView extends StatelessWidget {
  const MovieInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      body: Center(
        child: Text(controller.selectedMovie.name),
      ),
    );
  }
}
