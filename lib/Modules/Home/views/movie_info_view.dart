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
                      height: 335,
                      width: 230,
                      decoration: BoxDecoration(
                        image:  DecorationImage(
                          image: NetworkImage(controller.selectedMovie.posterUrl),
                          fit: BoxFit.fill
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
                          height: 80,
                          width: 80,
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
                          height: 80,
                          width: 80,
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
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Synopsis',
                    style: TextStyle(
                    fontSize: 24,
                    color: Color(0xffffd523),
                    fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: SizedBox(
                      height: 64,
                      width: 250,
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
    );
  }
}
