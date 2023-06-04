import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_button/like_button.dart';
import 'package:polres/Tournament.dart';
import 'package:polres/news.dart';
import 'package:polres/setting.dart';
import 'app_styles.dart';
import 'size_config.dart';
import 'login_page.dart';
import 'home.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      controllerPage.jumpToPage(index);
    });
  }

  final controllerPage = PageController(initialPage: 0);

  List<Widget> pilihanMenu = [
    HomeScreen(),
    NewsScreen(),
    Tournament_screen(),
    SettingsApp(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: kLighterWhite,
        body: PageView(
          controller: controllerPage,
          children: pilihanMenu,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _selectedIndex,
          showElevation: true, // use this to remove appBar's elevation
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
            controllerPage.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              activeColor: Color.fromARGB(255, 10, 48, 78),
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.article),
                title: Text('News'),
                activeColor: Color.fromARGB(255, 10, 48, 78)),
            BottomNavyBarItem(
                icon: Icon(Icons.calendar_month),
                title: Text('Matches'),
                activeColor: Color.fromARGB(255, 10, 48, 78)),
            BottomNavyBarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings'),
                activeColor: Color.fromARGB(255, 10, 48, 78)),
          ],
        ),
      ),
    );
  }
}
