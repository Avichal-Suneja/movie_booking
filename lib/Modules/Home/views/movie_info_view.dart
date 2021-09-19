import 'package:flutter/material.dart';
import 'package:movie_booking/Modules/Home/controllers/home_controller.dart';
import 'package:get/get.dart';

class MovieInfoView extends StatelessWidget {
  const MovieInfoView({Key? key}) : super(key: key);

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
      backgroundColor: Color(0xff303438),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  Image(
                    image: NetworkImage(controller.selectedMovie.posterUrl),
                    width: 280,
                    height: 350,
                  ),
                  Column(
                    children: [
                      Container(
                        color: Color(0xff272833),
                        height: 100,
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.photo_camera_front, color: Colors.white),
                            Text('Genre', style: TextStyle(color: Colors.white)),
                            Text(controller.selectedMovie.genre,style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                      SizedBox(height: 32),
                      Container(
                        color: Color(0xff272833),
                        height: 100,
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.access_time,color: Colors.white),
                            Text('Duration',style: TextStyle(color: Colors.white)),
                            Text(controller.selectedMovie.durationInMinutes.toString() + 'm',
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 32),
              Text(
                controller.selectedMovie.description,
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 1.25,
                  color: Colors.white
                ),
                textAlign: TextAlign.center,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: SizedBox(
                      height: 64,
                      width: 350,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed('/hall');
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xffEFAE28), elevation: 10),
                          child: Text(
                            'Get Reservation',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
