import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_booking/Modules/Home/controllers/home_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      backgroundColor: Color(0xff2c2e43),
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                    child: Text("P", style: TextStyle(
                      color: Color(0xffffd523),
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0,),
                    child: Text('ROFILE', style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, left: 8.0),
                    child: Text('V', style: TextStyle(
                        color: Color(0xffffd523),
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0,),
                    child: Text('IEW', style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ],
              ),
              SizedBox(
                height: 24.0,
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: Container(
                  padding: EdgeInsets.only(top: 24.0),
                  height: Get.height * 0.5,
                  width: Get.width * 0.9,
                  color: Color(0xff383b59),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text('Name : ${controller.userName}', style: TextStyle(
                          color: Color(0xffffd523),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text('Email : ${controller.userEmail}', style: TextStyle(
                            color: Color(0xffffd523),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text('Phone Number : ${controller.userPhone}', style: TextStyle(
                            color: Color(0xffffd523),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32.0,),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: SizedBox(
                  height: 64,
                  width: 250,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.logOut();
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xffffd523), elevation: 10),
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              )
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(8.0,0,8.0,16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          child: BottomNavigationBar(
            backgroundColor: Color(0xff595260),
            selectedItemColor: Color(0xffffd523),
            unselectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentIndex.value,
            onTap: (index){
              switch(index){
                case 0:
                  if(controller.currentIndex.value!=0)
                    Get.offAllNamed('/movie');
                  break;
                case 1:
                  if(controller.currentIndex.value!=1)
                    Get.toNamed('/ticket');
                  break;
                case 2:
                  if(controller.currentIndex.value!=2)
                    Get.toNamed('/profile');
                  break;
              }
              controller.currentIndex.value = index;
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.airplane_ticket),
                  label: 'Tickets'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile'
              )
            ],
          ),
        ),
      ),
    );
  }
}
