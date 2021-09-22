import 'package:flutter/material.dart';
import 'package:movie_booking/Modules/Home/controllers/home_controller.dart';
import 'package:get/get.dart';

class HallListView extends StatelessWidget {
  const HallListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(controller.selectedMovie.name, style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: Get.back,
        ),
      ),
      backgroundColor: Color(0xff2c2e43),
      body: ListView.builder(
        itemCount: controller.hallList.length,
        itemBuilder: (context, index){
          return ListTile(
            onTap:(){
              controller.selectHall(controller.hallList[index]);
            },
            title: Text(controller.hallList[index].name, style: TextStyle(color: Color(0xffffd523))),
            subtitle: Text(controller.hallList[index].address, style: TextStyle(color: Colors.white)),
            leading: Icon(Icons.tv, color: Colors.white),
          );
        },
      ),
    );
  }
}
