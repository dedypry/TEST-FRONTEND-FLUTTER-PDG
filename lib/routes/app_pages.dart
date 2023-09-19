import 'package:get/get.dart';
import 'package:prout_digital_labs/app/bindings/home_binding.dart';
import 'package:prout_digital_labs/app/views/home/home_detail.dart';
import 'package:prout_digital_labs/app/views/home/home_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HOME_DETAIL,
      page: () => HomeDetail(),
    ),
  ];
}
