import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_booking/Modules/Home/controllers/home_controller.dart';

class MovieListView extends StatelessWidget {
  const MovieListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<HomeController>();
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Color(0xff303438),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 16.0),
                  child: Text('Hello', style: TextStyle(
                    color: Color(0xff666a6e),
                    fontSize: 24.0,
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 8.0),
                  child: Text('Kunal', style: TextStyle(
                    color: Color(0xffEFAE28),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Text('!', style: TextStyle(
                    color: Color(0xff666a6e),
                    fontSize: 24.0,
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0, left: 56.0),
                  child: Text('S',style: TextStyle(
                    color: Color(0xffEFAE28),
                    fontSize: 40,
                    fontWeight: FontWeight.bold
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Text('HOW',style: TextStyle(
                      color: Color(0xff666a6e),
                      fontSize: 32,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Text('B',style: TextStyle(
                      color: Color(0xffEFAE28),
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Text('UZZ',style: TextStyle(
                      color: Color(0xff666a6e),
                      fontSize: 32,
                      fontWeight: FontWeight.bold
                  ),),
                ),
              ],
            ),
            SizedBox(height: 32.0,),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  color: Color(0xff9c9c9c),
                  width: Get.width * 0.92,
                  height: Get.height * 0.07,
                  child: TextField(
                    autofocus: true,
                    cursorColor: Colors.black,
                    cursorHeight: 28.0,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.search,
                          color: Color(0xffEFAE28),
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
                      contentPadding: EdgeInsets.symmetric(
                          vertical: -13.0, horizontal: 24.0),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0),
              child: RichText(text: TextSpan(text: 'Featured ',
                style: TextStyle(
                    color: Color(0xffEFAE28),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold
                ),
                children: const <TextSpan>[
                TextSpan(text: 'Movies', style: TextStyle(
                    color: Color(0xff666a6e),
                    fontSize: 24.0,
                    )),
               ],
              ),),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0, left: 16.0, right: 20.0),
              height: 420.0,
              width: 370.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 5.0),
                    width: 300.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      // color: Colors.red,
                      image: DecorationImage(
                        image: AssetImage('assets/2.jpg'),
                        fit: BoxFit.fill
                      )
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    width: 300.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      image: DecorationImage(
                        image: AssetImage('assets/3.jpg'),
                        fit: BoxFit.fill
                        )
                      ),
                    ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    width: 300.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.green,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    width: 300.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.yellow,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    width: 300.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
