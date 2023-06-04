import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'app_styles.dart';
import 'size_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _get = [];
  void initState() {
    super.initState();
    _getData();
  }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=5aae54827e234012a40622562bbe190b"));
      // return jsonDecode(response.body);

      // untuk cek data
      if (response.statusCode == 200) {
        print(response.body);
        final data = jsonDecode(response.body);
        setState(() {
          _get = data['articles'];
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        children: [
          Row(
            children: [
              SizedBox(
                width: 75,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Portal Berita",
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..shader = LinearGradient(
                              colors: <Color>[
                                Colors.pinkAccent,
                                Colors.deepPurpleAccent,
                                Colors.red
                                //add more color here.
                              ],
                            ).createShader(
                                Rect.fromLTWH(0.0, 0.0, 200.0, 100.0))))
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorderRadius),
              color: kWhite,
              boxShadow: [
                BoxShadow(
                  color: kDarkBlue.withOpacity(0.051),
                  offset: const Offset(0.0, 3.0),
                  blurRadius: 24.0,
                  spreadRadius: 0.0,
                )
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: kPoppinsRegular.copyWith(
                      color: kBlue,
                      fontSize: SizeConfig.blockSizeHorizontal! * 4,
                    ),
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      hintText: 'Search',
                      border: kBorder,
                      errorBorder: kBorder,
                      disabledBorder: kBorder,
                      focusedBorder: kBorder,
                      focusedErrorBorder: kBorder,
                      hintStyle: kPoppinsRegular.copyWith(
                        color: kLighterGrey,
                        fontSize: SizeConfig.blockSizeHorizontal! * 3,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: kBlue,
                    borderRadius: BorderRadius.circular(kBorderRadius),
                  ),
                  child: IconButton(
                    iconSize: 20,
                    icon: const Icon(Icons.search),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 14,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {},
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 304,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(right: 20),
                  height: 304,
                  width: 255,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    color: kWhite,
                    boxShadow: [
                      BoxShadow(
                        color: kDarkBlue.withOpacity(0.051),
                        offset: const Offset(0.0, 3.0),
                        blurRadius: 24.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 164,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kBorderRadius),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              _get.length > index
                                  ? _get[index]['urlToImage']
                                  : '',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Flexible(
                        child: Text(
                          _get.length > index ? _get[index]['title'] : '',
                          style: kPoppinsBold.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 19,
                                backgroundColor: kLightBlue,
                                backgroundImage: NetworkImage(
                                  'https://cdn-icons-png.flaticon.com/512/147/147144.png?w=360',
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Ghozal Imam',
                                    style: kPoppinsSemiBold.copyWith(
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! * 3,
                                    ),
                                  ),
                                  Text(
                                    'Kamis, 13 April 2023',
                                    style: kPoppinsRegular.copyWith(
                                      color: kGrey,
                                      fontSize:
                                          SizeConfig.blockSizeHorizontal! * 3,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            height: 38,
                            width: 38,
                            padding: const EdgeInsets.all(10),
                            child: LikeButton(
                              size: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Short for You',
                style: kPoppinsBold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                ),
              ),
              Text(
                'View all',
                style: kPoppinsMedium.copyWith(
                  color: kBlue,
                  fontSize: SizeConfig.blockSizeHorizontal! * 3,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 19,
          ),
          SizedBox(
            height: 400,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(9),
                  margin: const EdgeInsets.only(
                    right: 20,
                  ),
                  width: 200,
                  height: 88,
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
                  child: Row(
                    children: [
                      Container(
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kBorderRadius),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              _get.length > index
                                  ? _get[index]['urlToImage']
                                  : '',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Flexible(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _get.length > index ? _get[index]['title'] : '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: kPoppinsSemiBold.copyWith(
                                fontSize:
                                    SizeConfig.blockSizeHorizontal! * 3.5),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.visibility_outlined,
                                color: kGrey,
                                size: 15,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                '20.432',
                                style: kPoppinsMedium.copyWith(
                                  color: kGrey,
                                  fontSize: SizeConfig.blockSizeHorizontal! * 3,
                                ),
                              ),
                            ],
                          )
                        ],
                      ))
                    ],
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
