import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_booking/Modules/Home/controllers/home_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      backgroundColor: Color(0xff303438),
      body: Center(
        child: Text('PROFILE VIEW', style: TextStyle(color:Colors.white)),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[800],
        selectedItemColor: Color(0xffEFAE28),
        unselectedItemColor: Colors.white,
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
    );
  }
}
