import 'package:get/get.dart';

import 'package:user_management/app/modules/data_view/bindings/data_view_binding.dart';
import 'package:user_management/app/modules/data_view/views/data_view_view.dart';
import 'package:user_management/app/modules/edit_screen/bindings/edit_screen_binding.dart';
import 'package:user_management/app/modules/edit_screen/views/edit_screen_view.dart';
import 'package:user_management/app/modules/home/bindings/home_binding.dart';
import 'package:user_management/app/modules/home/views/home_view.dart';
import 'package:user_management/app/modules/sign_up/bindings/sign_up_binding.dart';
import 'package:user_management/app/modules/sign_up/views/sign_up_view.dart';
import 'package:user_management/app/modules/single_page_view/bindings/single_page_view_binding.dart';
import 'package:user_management/app/modules/single_page_view/views/single_page_view_view.dart';

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
      name: _Paths.DATA_VIEW,
      page: () => DataViewView(),
      binding: DataViewBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.SINGLE_PAGE_VIEW,
      page: () => SinglePageViewView(),
      binding: SinglePageViewBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_SCREEN,
      page: () => EditScreenView(),
      binding: EditScreenBinding(),
    ),
  ];
}
