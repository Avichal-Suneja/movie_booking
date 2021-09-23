import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_booking/Modules/Home/controllers/home_controller.dart';

class TicketInfoView extends StatelessWidget {
  const TicketInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      backgroundColor: Color(0xff2c2e43),
      body: SafeArea(
        child: controller.bookedTicket.hallName == 'no'? Center(child: Text('No Tickets Booked!', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)))
        :Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: Container(
                  padding: EdgeInsets.only(top: 24.0),
                  width: Get.width * 0.9,
                  color: Color(0xff383b59),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text('${controller.bookedTicket.movieName}', style: TextStyle(
                            color: Color(0xffffd523),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text('Starts at', style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text('${controller.bookedTicket.startTime.day} ${controller.months[controller.bookedTicket.startTime.month]}, ${controller.bookedTicket.startTime.hour}:${controller.bookedTicket.startTime.minute} PM', style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text('Ends at', style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text('${controller.bookedTicket.endTime.day} ${controller.months[controller.bookedTicket.endTime.month]}, ${controller.bookedTicket.endTime.hour}:${controller.bookedTicket.endTime.minute} PM', style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                        ],
                      ),
                      SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text('${controller.bookedTicket.hallName}', style: TextStyle(
                            color: Color(0xffffd523),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text('Allotted Seats', style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for(var pos in controller.bookedTicket.positions)
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text('A$pos ', style: TextStyle(
                                  color: Color(0xffffd523),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold
                              ),),
                            ),
                        ],
                      ),
                      SizedBox(height: 16)
                    ],
                  ),
                ),
              ),
            ),
          ],
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
            elevation: 50.0,
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentIndex.value,
            onTap: (index) async {
              switch(index){
                case 0:
                  if(controller.currentIndex.value!=0)
                    Get.offAllNamed('/movie');
                  break;
                case 1:
                  if(controller.currentIndex.value!=1){
                    await controller.getBookedTicket();
                    Get.toNamed('/ticket');
                  }
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
