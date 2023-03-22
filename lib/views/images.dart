import 'package:flutter/material.dart';
import '../util/app_bar.dart';


class Images extends StatefulWidget {

  static const String route = '/art';

  const Images({Key? key}) : super(key: key);

  @override
  State<Images> createState() => _ImagesState();
}

class _ImagesState extends State<Images> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double topFontSize = 22;
    if (width < 800) {
      topFontSize = 14;
    }

    return Scaffold(
      appBar: appBarAgeOfGold(context, false),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),
                logo(width),
                const SizedBox(height: 40),
                SelectionArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                            "Welcome the the Zwaar Developers art page",
                            style: TextStyle(color: Color(0xfff8f8f8), fontSize: topFontSize)
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                            "Here at Zwaar Developers we view the creation of sofware as high art. But besides software creation we also view arts as high art.\nHere we offer a showcase of any art, besides software, that has been created by members of our team",
                            style: TextStyle(color: Color(0xfff8f8f8), fontSize: topFontSize-4)
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(40.0),
                        child: Image(
                          image: AssetImage(
                            "assets/images/art/IMG_20200803_222627.jpg",
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(40.0),
                        child: Image(
                          image: AssetImage(
                            "assets/images/art/IMG_20210821_124105.jpg",
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(40.0),
                        child: Image(
                          image: AssetImage(
                            "assets/images/art/IMG_20210821_124116.jpg",
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(40.0),
                        child: Image(
                          image: AssetImage(
                            "assets/images/art/IMG_20211114_115030.jpg",
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(40.0),
                        child: Image(
                          image: AssetImage(
                            "assets/images/art/IMG_20230322_171419.jpg",
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(40.0),
                        child: Image(
                          image: AssetImage(
                            "assets/images/art/IMG_20230322_171735.jpg",
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(40.0),
                        child: Image(
                          image: AssetImage(
                            "assets/images/art/IMG_20230322_171958.jpg",
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }

  Widget logo(double maxWidth) {
    double logoWidth = 600;
    double logoHeight = 150;
    double sizeOfFont = 30;
    if (maxWidth < 800) {
      logoWidth = (maxWidth/5)*4;
      logoHeight = maxWidth/6;
      sizeOfFont = 10;
    }
    return Column(
        children: [
          SizedBox(
            height: logoHeight,
            width: logoWidth-50,
            child: const Image(
              image: AssetImage("assets/images/Zwaar_Logo.png"),
            ),
          ),
          Text(
              "       Developers",
              style: TextStyle(color: const Color(0xff949494), fontSize: sizeOfFont, fontWeight: FontWeight.bold)
          )
        ]
    );
  }
}

