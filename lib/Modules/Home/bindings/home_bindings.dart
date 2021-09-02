import 'package:get/get.dart';
import 'package:movie_booking/Modules/Home/controllers/home_controller.dart';
import 'package:movie_booking/Services/database_service.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(DatabaseService(), permanent: true);
    Get.put(HomeController(), permanent: true);
  }
}