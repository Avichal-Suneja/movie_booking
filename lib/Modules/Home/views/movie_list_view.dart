import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_booking/Modules/Home/controllers/home_controller.dart';

class MovieListView extends StatelessWidget {
  const MovieListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Obx(()=>Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: controller.logOut,
          child: Text('logout', style: TextStyle(color: Colors.black, fontSize: 18)),
        ),
      ),
      body: ListView.builder(
        itemCount: controller.movieList.length,
        itemBuilder: (context, index){
          return Text(controller.movieList[index].name);
        },
      ),
    ));
  }
}
