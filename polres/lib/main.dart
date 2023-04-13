import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'app_styles.dart';
import 'size_config.dart';
import 'home.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(
    const MyApp(),
  );
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
    Text('menu 2'),
    Text('menu 3'),
    Text('menu 4'),
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
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: kWhite,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _selectedIndex == 0
                  ? Icon(Icons.home)
                  : Icon(Icons.home_outlined),
              label: ' ',
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? Icon(Icons.article)
                  : Icon(Icons.article),
              label: ' ',
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 2
                  ? Icon(Icons.videogame_asset_rounded)
                  : Icon(Icons.videogame_asset_rounded),
              label: ' ',
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 3
                  ? Icon(Icons.account_circle)
                  : Icon(Icons.account_circle),
              label: ' ',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
