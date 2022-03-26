import 'package:flutter/material.dart';
import 'package:planet/constants.dart';
import 'package:planet/data.dart';

class  DetailPage extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);
  final PlanetInfo planetInfo;

  const DetailPage({Key? key, required this.planetInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 300,
                    ),
                    Text(
                      planetInfo.name,
                      style: const TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 56,
                        fontWeight: FontWeight.w900,
                        color: primaryTextColor,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const Text(
                      'Solar System',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 30,
                        fontWeight: FontWeight.w300,
                        color: primaryTextColor,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const Divider(color: Colors.black38,),
                    const SizedBox(height: 20,),
                    Text(
                      planetInfo.description,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: contentTextColor,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 20,),
                    const Divider(color: Colors.black38,),
                    const Padding(
                      padding: EdgeInsets.only(left: 32.0),
                      child: Text(
                          'Gallery',
                          style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                          color: primaryTextColor),
                          textAlign: TextAlign.left,
                            ),
                    ),
                          Container(
                            height: 250,
                            //padding: const EdgeInsets.only(left: 32.0),
                            child: ListView.builder(
                            itemCount: planetInfo.images.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                            return Card(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24)
                                ),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  planetInfo.images[index],
                                  fit: BoxFit.cover,)),
                  );
                }
                ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: -64,
              child: Hero(
                tag: planetInfo.position.toString(),
                child: Image.asset(planetInfo.iconImage
                )),
            ),
              Positioned(
                top: 150,
                left: 50,
                child: Text(
                  planetInfo.position.toString(),
                  style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 180,
                    fontWeight: FontWeight.w900,
                    color: primaryTextColor.withOpacity(0.1),
                  ),
                  textAlign: TextAlign.left,
                ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  ),
          ],
        ),
      ),
      );
      
  }
}
