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

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Builder(
          builder:
              (context) => IconButton(
                icon: Icon(Icons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
        ),
        title: Text('Page title'),
        actions: [
          Icon(Icons.favorite),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
          Icon(Icons.more_vert),
        ],
        backgroundColor: const Color.fromARGB(255, 240, 155, 255),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 80,
              color: Colors.purple,
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(16),
              child: Center(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(
                    TextSpan(
                      text: 'Hello, ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                      ),
                      children: [
                        TextSpan(
                          text: 'KEN',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 177, 255, 180),
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: PersistentTabView(
        context,
        controller: controller,
        screens: [HomeView(), TodoView(), DateHistoryView(), WishlistView()],
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
      ),
    );
  }
}
