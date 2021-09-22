import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_booking/Modules/Home/controllers/home_controller.dart';

class SeatView extends StatelessWidget {
  const SeatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Obx(()=>Scaffold(
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
          child: Column(
            children: [
              SizedBox(height: 16),
              Center(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for(var index=0; index<controller.dates.length; index++)
                      FilterChip(
                      backgroundColor: Color(0xff595260),
                      label: Column(
                        children: [
                          Text(
                            "${controller.months[controller.dates[index].month-1]}",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            '${controller.dates[index].day.toString()}',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      showCheckmark: false,
                      selected: controller.selectedDates[index].value,
                      selectedColor: Color(0xffffd523),
                      onSelected: (value){
                        controller.selectDay(controller.dates[index], value, index);
                      },
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text('Select Seats', style: TextStyle(color:Colors.white, fontSize: 24)),
              SizedBox(height: 16),
              Column(
                children: [
                  for(int i=0; i<int.parse(controller.selectedHall.matrix[2]); i++)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for(int j=0; j<int.parse(controller.selectedHall.matrix[0]); j++)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FilterChip(
                              disabledColor: Colors.white,
                              backgroundColor: Color(0xff595260),
                              showCheckmark: false,
                              label: Text('  '),
                              selectedColor: Color(0xffffd523),
                              selected: controller.currentSeats[5*i + j] == 1? true : false,
                              onSelected: controller.currentSeats[5*i + j] == 2? null : (value){
                                controller.currentSeats[5*i + j] = value? 1 : 0;
                                controller.dates.refresh();
                              },
                            ),
                          )
                      ],
                    )
                ],
              ),
              SizedBox(height: 16),
              Container(
                color: Color(0xff595260),
                width: Get.width*0.8,
                height: 30,
                child: Center(
                  child: Text(
                    'Screen',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xff595260),
                        radius: 12,
                      ),
                      SizedBox(width: 4),
                      Text('Available', style: TextStyle(color: Colors.white))
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xffffd523),
                        radius: 12,
                      ),
                      SizedBox(width: 4),
                      Text('Selected', style: TextStyle(color: Colors.white))
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 12,
                      ),
                      SizedBox(width: 4),
                      Text('Reserved', style: TextStyle(color: Colors.white))
                    ],
                  )
                ],
              ),
              SizedBox(height: 32),
              Center(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for(var index=0; index<controller.time.length; index++)
                      FilterChip(
                        backgroundColor: Color(0xff595260),
                        label: Text(
                          '${controller.time[index].hour}:${controller.time[index].minute} P.M',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        showCheckmark: false,
                        selected: controller.selectedTimes[index].value,
                        selectedColor: Color(0xffffd523),
                        onSelected: (value){
                          controller.selectTime(controller.time[index], value, index);
                        },
                      )
                  ],
                ),
              ),
              SizedBox(height: 8),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: SizedBox(
                      height: 64,
                      width: 350,
                      child: ElevatedButton(
                          onPressed: () {
                            controller.bookTicket();
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xffffd523), elevation: 10),
                          child: Text('Book Tickets',
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
