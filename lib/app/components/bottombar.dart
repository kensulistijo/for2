import 'package:flutter/material.dart';
import 'package:for2/app/modules/date_history/views/date_history_view.dart';
import 'package:for2/app/modules/home/views/home_view.dart';
import 'package:for2/app/modules/todo/views/todo_view.dart';
import 'package:for2/app/modules/wishlist/views/wishlist_view.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:for2/app/routes/app_pages.dart';

class MainNavBar extends StatelessWidget {
  final int initialIndex;
  final BuildContext context;

  const MainNavBar({super.key, required this.context, this.initialIndex = 0});

  List<Widget> _buildScreens() {
    return [HomeView(), TodoView(), DateHistoryView(), WishlistView()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.calendar_today),
        title: ("Todo"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.history),
        title: ("History"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.list),
        title: ("LWishlist"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller = PersistentTabController(
      initialIndex: initialIndex,
    );

    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineToSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      navBarStyle: NavBarStyle.style6, // Choose any style you like
    );
  }
}
