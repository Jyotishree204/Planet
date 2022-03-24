import 'package:flutter/material.dart';
//import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:planet/constants.dart';
import 'package:planet/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get cont => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: <Widget>[
                  const Text(
                    'Explore',
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 44,
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  DropdownButton(
                    items: const [
                      DropdownMenuItem(
                        child: Text(
                          'Solar System',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 24,
                            color: Color(0x7cdbf1ff),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                    onChanged: (dynamic value) {},
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Image.asset('asset/drop_down_icon.png'),
                    ),
                    underline: const SizedBox(),
                  ),
                ],
              ),
            ),
            Container(
              height: 500,
              child: Swiper(
                itemCount: planets.length,
                itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                layout: SwiperLayout.STACK,
                itemBuilder: (context, index) {
                  return Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          const SizedBox(height: 100),
                          Card(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                              ),
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const SizedBox(height: 100),
                                  Text(
                                    planets[index].name,
                                    style: const TextStyle(
                                      fontFamily: 'Avenir',
                                      fontSize: 44,
                                      color: Color(0xff47455f),
                                      fontWeight: FontWeight.w900,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  const Text(
                                    'Solar System',
                                    style: TextStyle(
                                      fontFamily: 'Avenir',
                                      fontSize: 23,
                                      color: primaryTextColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Row(
                                    children: const <Widget>[
                                      Text(
                                        'Know more',
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: secondaryTextColor,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: secondaryTextColor,
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
