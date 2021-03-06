import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_booking/Modules/Home/controllers/home_controller.dart';

class MovieListView extends StatelessWidget {
  const MovieListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Obx(()=>Scaffold(
      backgroundColor:  Color(0xff2c2e43),
        body: SafeArea(
          child: Container(
            height: Get.height,
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0, left: 16.0),
                          child: Text('Hello', style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0, left: 8.0),
                          child: Text('${controller.userName}', style: TextStyle(
                              color: Color(0xffffd523),
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                        Text('!', style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),),
                      ],
                    ),
                   Row(
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(top: 0.0, left: 48.0),
                         child: Text('S',style: TextStyle(
                             color: Color(0xffffd523),
                             fontSize: 40,
                             fontWeight: FontWeight.bold
                         ),),
                       ),
                       Text('HOW',style: TextStyle(
                           color: Colors.white,
                           fontSize: 32,
                           fontWeight: FontWeight.bold
                       ),),
                       Text('B',style: TextStyle(
                           color: Color(0xffffd523),
                           fontSize: 40,
                           fontWeight: FontWeight.bold
                       ),),
                       Padding(
                         padding: const EdgeInsets.only(right: 8.0),
                         child: Text('UZZ',style: TextStyle(
                             color: Colors.white,
                             fontSize: 32,
                             fontWeight: FontWeight.bold
                         ),),
                       ),
                     ],
                   )
                  ],
                ),
                //SizedBox(height: 32.0,),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      color: Color(0xffb2b1b9),
                      width: Get.width * 0.92,
                      height: 48,
                      child: TextField(
                        controller: controller.searchController,
                        cursorColor: Colors.black,
                        cursorHeight: 28.0,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Icon(
                              Icons.search,
                              color: Color(0xffffd523),
                            ),),
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black.withOpacity(0.22),
                            letterSpacing: 1),
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(100.0)),
                              borderSide:
                              BorderSide(color: Colors.black26, width: 3.0)),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 16.0),
                  child: RichText(text: TextSpan(text: 'Featured ',
                    style: TextStyle(
                        color: Color(0xffffd523),
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold
                    ),
                    children: const <TextSpan>[
                    TextSpan(text: 'Movies', style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        )),
                   ],
                  ),),
                ),
                Container(
                  margin: EdgeInsets.only(top: 4.0, left: 16.0, right: 20.0),
                  height: 420.0,
                  width: 370.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.searchedMovieList.length,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        onTap: (){
                          controller.selectMovie(controller.searchedMovieList[index]);
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10.0),
                          height: 240.0,
                          width: 280.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              // color: Colors.red,
                              image: DecorationImage(
                                  image: NetworkImage(controller.searchedMovieList[index].posterUrl),
                                  fit: BoxFit.fill,
                              )
                          ),
                        ),
                      );
                    },
                  )
                ),
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
      ),
    );
  }
}
