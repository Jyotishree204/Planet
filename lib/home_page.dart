import 'package:flutter/material.dart';
//import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:planet/constants.dart';
import 'package:planet/data.dart';
import 'package:planet/detail_page.dart';

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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [gradientStartColor, gradientEndColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.3,0.7]
          ),
        ),
      child: SafeArea(
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
                      child: Image.asset('assets/drop_down_icon.png'),
                    ),
                    underline: const SizedBox(),
                  ),
                ],
              ),
            ),
            Container(
              height: 500,
              padding: const EdgeInsets.only(left: 32),
              child: Swiper(
                itemCount: planets.length,
                itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                layout: SwiperLayout.STACK,
                pagination: const SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                    activeSize: 20,
                    space: 8,
                  ),
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, a, b) => DetailPage(planetInfo: planets[index],),
                          ),
                          );
                    },
                    child: Stack(
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
                                    const SizedBox(height: 32),
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
                        Hero(
                          tag: planets[index].position,
                          child: Image.asset(planets[index].iconImage)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
    bottomNavigationBar: myBottomNavigationBar(),
    );
  }

  Container myBottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
        color: navigationColor,
        ),
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/menu_icon.png'),
            ),
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/search_icon.png'),
            ),
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/profile_icon.png'),
            ),
        ],
      ),
    );
  }
}

