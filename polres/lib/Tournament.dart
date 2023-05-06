import 'package:flutter/material.dart';
import 'Tournament_detail.dart';
import 'app_styles.dart';
import 'size_config.dart';
// ignore: depend_on_referenced_packages
import 'package:date_picker_timeline/date_picker_timeline.dart';

class Tournament_screen extends StatelessWidget {
  const Tournament_screen({Key? key}) : super(key: key);

  static List<Map<String, dynamic>> foto = [
    {
      "id": 1,
      "foto1":
          "https://upload.wikimedia.org/wikipedia/commons/e/e0/Natus_Vincere_logo.png",
      "foto2":
          "https://blog.logomyway.com/wp-content/uploads/2021/06/faze-symbol.jpg"
    },
    {
      "id": 2,
      "foto1":
          "https://upload.wikimedia.org/wikipedia/commons/e/e0/Natus_Vincere_logo.png",
      "foto2":
          "https://blog.logomyway.com/wp-content/uploads/2021/06/faze-symbol.jpg"
    },
    {
      "id": 3,
      "foto1":
          "https://upload.wikimedia.org/wikipedia/commons/e/e0/Natus_Vincere_logo.png",
      "foto2":
          "https://blog.logomyway.com/wp-content/uploads/2021/06/faze-symbol.jpg"
    },
    {
      "id": 4,
      "foto1":
          "https://upload.wikimedia.org/wikipedia/commons/e/e0/Natus_Vincere_logo.png",
      "foto2":
          "https://blog.logomyway.com/wp-content/uploads/2021/06/faze-symbol.jpg"
    },
    {
      "id": 5,
      "foto1":
          "https://upload.wikimedia.org/wikipedia/commons/e/e0/Natus_Vincere_logo.png",
      "foto2":
          "https://blog.logomyway.com/wp-content/uploads/2021/06/faze-symbol.jpg"
    },
    {
      "id": 6,
      "foto1":
          "https://upload.wikimedia.org/wikipedia/commons/e/e0/Natus_Vincere_logo.png",
      "foto2":
          "https://blog.logomyway.com/wp-content/uploads/2021/06/faze-symbol.jpg"
    },
    {
      "id": 7,
      "foto1":
          "https://upload.wikimedia.org/wikipedia/commons/e/e0/Natus_Vincere_logo.png",
      "foto2":
          "https://blog.logomyway.com/wp-content/uploads/2021/06/faze-symbol.jpg"
    },
    {
      "id": 9,
      "foto1":
          "https://upload.wikimedia.org/wikipedia/commons/e/e0/Natus_Vincere_logo.png",
      "foto2":
          "https://blog.logomyway.com/wp-content/uploads/2021/06/faze-symbol.jpg"
    },
    {
      "id": 10,
      "foto1":
          "https://upload.wikimedia.org/wikipedia/commons/e/e0/Natus_Vincere_logo.png",
      "foto2":
          "https://blog.logomyway.com/wp-content/uploads/2021/06/faze-symbol.jpg"
    },
  ];

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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'CALENDAR',
                style: kPoppinsBold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 6,
                ),
              ),
              Text(
                'Event',
                style: kPoppinsRegular.copyWith(
                  color: kGrey,
                  fontSize: SizeConfig.blockSizeHorizontal! * 3,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.only(top: 1),
            child: DatePicker(
              DateTime.now(),
              height: 100,
              width: 80,
              initialSelectedDate: DateTime.now(),
              selectionColor: kDarkBlue,
              selectedTextColor: kLighterWhite,
              dateTextStyle: kPoppinsMedium,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 580,
            child: ListView.builder(
              itemCount: foto.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(6),
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  width: 250,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    boxShadow: [
                      BoxShadow(
                        color: kDarkBlue.withOpacity(0.051),
                        offset: const Offset(0.0, 3.0),
                        blurRadius: 24.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Column(
                      children: [
                        Flexible(
                          child: Image.network(foto[index]["foto1"],
                              fit: BoxFit.cover),
                        ),
                        SizedBox(height: 5),
                        Flexible(
                          child: Image.network(foto[index]["foto2"],
                              fit: BoxFit.cover),
                        ),
                      ],
                    ),
                    title: Text(
                      'NAVI',
                      style: kPoppinsSemiBold.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 5),
                    ),
                    subtitle: Text(
                      'Faze',
                      style: kPoppinsSemiBold.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 5),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Tournament_detail()));
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
