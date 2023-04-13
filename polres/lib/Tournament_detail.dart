import 'package:flutter/material.dart';
import 'app_styles.dart';
import 'size_config.dart';

class Tournament_detail extends StatefulWidget {
  const Tournament_detail({Key? key}) : super(key: key);

  @override
  State<Tournament_detail> createState() => _TournamentState();
}

class _TournamentState extends State<Tournament_detail> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: kLighterWhite,
        body: const Tournament_screen(),
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

class Tournament_screen extends StatelessWidget {
  const Tournament_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'NAVI  VS  Faze',
                style: kPoppinsBold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 10,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kBorderRadius),
                  color: kLightBlue,
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://d3dwep9z8m8y9r.cloudfront.net/publications/2023/03/publications-10208/thumbnail/36637/FaZe_Site_1738x800.png',
                    ),
                  ),
                ),
              ),
              Text(
                'Sabtu, 15 April 2023',
                style: kPoppinsRegular.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 6,
                ),
              ),
              Text(
                'Jam 19:00',
                style: kPoppinsRegular.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 6,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
