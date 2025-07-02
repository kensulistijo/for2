import 'package:flutter/material.dart';
import 'package:for2/app/modules/navigation/controllers/navigation_controller.dart';
import 'package:for2/app/modules/todo/views/todo_view.dart';
import 'package:for2/app/modules/wishlist/views/wishlist_view.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../home/views/home_view.dart';
import '../../date_history/views/date_history_view.dart';

class NavigationView extends GetView<NavigationController> {
  const NavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller = PersistentTabController(
      initialIndex: 0,
    );

    return PersistentTabView(
      context,
      controller: controller,
      screens: const [
        HomeView(),
        TodoView(),
        DateHistoryView(),
        WishlistView(),
      ],
      items: [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home),
          title: "Home",
          activeColorPrimary: Colors.blue,
          activeColorSecondary: Colors.white,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.calendar_today),
          title: "Todo",
          activeColorPrimary: Colors.blue,
          activeColorSecondary: Colors.white,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.history),
          title: "History",
          activeColorPrimary: Colors.blue,
          activeColorSecondary: Colors.white,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.favorite),
          title: "Wishlists",
          activeColorPrimary: Colors.blue,
          activeColorSecondary: Colors.white,
          inactiveColorPrimary: Colors.grey,
        ),
      ],
      navBarStyle: NavBarStyle.style10,
    );
  }
}
