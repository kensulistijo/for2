import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:for2/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';

// import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNavigation extends StatefulWidget {
  // const BottomNavigation({super.key});

  final int? navIndex;

  const BottomNavigation({
    super.key,
    this.navIndex ,
  });

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  late int appPages;



  @override
  void initState() {
    super.initState();
    appPages = widget.navIndex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    // int idx = SpUtil.getBool('navIndex') == 0 ? 0 : SpUtil.getInt('navIndex');
    return CurvedNavigationBar(
      index:  appPages,
      iconPadding: 15,
      color: colorBackground,
      backgroundColor: Colors.transparent,
      buttonBackgroundColor: colorBtn,
      animationDuration:Duration(milliseconds: 290),
      items: [
        CurvedNavigationBarItem(
          child: Icon(
            Icons.home_outlined,
            color: appPages == 0 ? clLight : menuColor
          ),
          labelStyle: TextStyle(fontSize: 12, color: menuColor),
          label: 'Home',
          
        ),
        CurvedNavigationBarItem(
          labelStyle: TextStyle(fontSize: 12, color: menuColor),
          child: Icon(Icons.list_alt_outlined,
            color: appPages == 1 ? clLight : menuColor
          ),
          label: 'Open WO',
        ),
        CurvedNavigationBarItem(
          labelStyle: TextStyle(fontSize: 12, color: menuColor),
          child: Icon(Icons.playlist_add_check,
            color: appPages == 2 ? clLight : menuColor
          
          ),
          label: 'Close WO',
        ),
        CurvedNavigationBarItem(
          labelStyle: TextStyle(fontSize: 12, color: menuColor),
          child: Icon(Icons.settings,
             color: widget.navIndex == 3 ? clLight : menuColor
          ),
          label: 'Settings',
        ),
      ],
      onTap: (index) {
        setState(() {
          appPages = index;
        });

        Future.delayed(Duration(milliseconds: 300), () {
          Get.toNamed('/home', 
            arguments: {
              'userid': index
            });
        });
      },
      letIndexChange: (index) => true,
    );
  }
}