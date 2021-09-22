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
      backgroundColor: Color(0xff2c2e43),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 332.5,
                      width: 266,
                      decoration: BoxDecoration(
                        image:  DecorationImage(
                          image: NetworkImage(controller.selectedMovie.posterUrl),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          color: Color(0xff595260),
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
                      ),
                      SizedBox(height: 32),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          color: Color(0xff595260),
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
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 32),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Color(0xff383b59),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          controller.selectedMovie.description,
                          style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 1.25,
                            color: Colors.white
                          ),
                          textAlign: TextAlign.justify,
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
                                        primary: Color(0xffffd523), elevation: 10),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
