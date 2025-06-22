import 'package:get/get.dart';

import '../modules/date_details/bindings/date_details_binding.dart';
import '../modules/date_details/views/date_details_view.dart';
import '../modules/date_history/bindings/date_history_binding.dart';
import '../modules/date_history/views/date_history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.DATE_HISTORY,
      page: () => const DateHistoryView(),
      binding: DateHistoryBinding(),
    ),
    GetPage(
      name: _Paths.DATE_DETAILS,
      page: () => const DateDetailsView(),
      binding: DateDetailsBinding(),
    ),
  ];
}
