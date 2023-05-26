import 'package:flutter/material.dart';
import 'app_styles.dart';
import 'size_config.dart';
import 'Tournament.dart';
import 'package:intl/intl.dart';

class Tournament_detail extends StatelessWidget {
  const Tournament_detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
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
                  GetDateNow(),
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
            IconButton(
              color: kDarkBlue,
              padding: const EdgeInsets.only(top: 370),
              icon: const Icon(Icons.cancel_rounded),
              iconSize: 65,
              onPressed: () {
                Navigator.pop(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Tournament_screen()));
              },
            )
          ],
        ),
      ),
    );
  }

  GetDateNow() {
    var date = DateTime.now();

    var formatt = DateFormat('EEEE, d MMMM y').format(date);

    return formatt;
  }
}
