import 'package:flutter/material.dart';
import 'package:zwaar/util/hexagon_button.dart';
import '../util/app_bar.dart';
import '../util/hexagon_painter.dart';


class Team extends StatefulWidget {

  static const String route = '/team';

  const Team({Key? key}) : super(key: key);

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {

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
                          "meet the team:",
                          style: TextStyle(color: Color(0xfff8f8f8), fontSize: topFontSize)
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                          "We are fortunate to have such a dedicated and accomplished team with a wide range of expertise.",
                          style: TextStyle(color: Color(0xfff8f8f8), fontSize: topFontSize-4)
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                          "Together, they're helping making the world a better place!",
                          style: TextStyle(color: Color(0xfff8f8f8), fontSize: topFontSize-4)
                      ),
                    ),
                    const SizedBox(height: 40),
                    HexagonPortrait(
                        false,
                        width,
                        "Sander",
                        "Founder",
                        "Sander Kools is the founder of the company. Legend has it that he came up with the idea for the company while he was battling a bear with his bare anti-bear hands. After he stared death in the eyes and won the idea came to him. The same day he created the company and the rest is history\nZwaar developers quickly became one of the biggest development companies in his area.",
                        "I am proud that I was able to build such a great company and also the legend about me is not correct",
                        "assets/images/founder.png"
                    ),
                    HexagonPortrait(
                        true,
                        width,
                        "Sander",
                        "Co-Founder",
                        "Sander Kools is the co-founder of the company. Along with the founder he came up with the ideas that made the company what it is today. There is no doubt in the genius of the 2 founders, their products and services are proof of that.",
                        "I met Sander at a festival and sold him some drugs. After that I just kinda stuck around.",
                        "assets/images/co_founder.png"
                    ),
                    HexagonPortrait(
                        false,
                        width,
                        "Sander",
                        "CEO",
                        "Sander Kools joined the team quickly after the founding. His prowess and technical skill quickly made him an integral part of the company. It was only obvious that someone with his skill and experience would some day lead the company.\nSince he took over the role of CEO from Sander the company has seen a meteoric rise.\n(It's the guy, not the dog)",
                        "Who are you and why are you not working?! You're FIRED!",
                        "assets/images/CEO.png"
                    ),
                    HexagonPortrait(
                        true,
                        width,
                        "Sander",
                        "CTO",
                        "Sander Kools started out as a fan of the company, using its products and services. In his free time he would find and fix bugs within these products and services that he loved. He was quickly brought in as part of the team and his contributions made these products and services incredibly solid.\nHis intelligence and understanding of the company software quickly made him the CTO, which he was always meant to be.\n(It's the cat, not the guy)",
                        "Meouw!",
                        "assets/images/CTO.png"
                    ),
                    HexagonPortrait(
                        false,
                        width,
                        "Sander",
                        "CCO",
                        "Within a development company such as Zwaar you can imagine that communication is an extra challenge. Everyone has a technical mindset which means they might not be very skillful in their communication. That is why the addition of Sander Kools as the CCO has been so beneficial for the company. Now there are no more issues with communication!",
                        "Communicason is important very, therefore I have",
                        "assets/images/CCO.png"
                    ),
                    HexagonPortrait(
                        true,
                        width,
                        "Max",
                        "Import/Export",
                        "One of the major issues that Zwaar faced was the ability to get items into the company and also to get items out of the company. For this astronomically difficult task they had to find the right person, which they did. After Max Sumrall was brought in as Import/Export expert there have been no more issues with stuff going in or stuff going out!",
                        "Few things in life are as eloquent or beautiful as Export. When I'm exporting I get chills and it makes me happy. There is only one thing I love more in life than Export and that is Import",
                        "assets/images/max_import_export.png"
                    ),
                    HexagonPortrait(
                        false,
                        width,
                        "Sander",
                        "Content manager",
                        "Sander Kools was brought in at a time when it was difficult to manage all the content that Zwaar was putting out. All of this content was just pilling up and being un-managed. After he was brought in to fix this problem all the content was quickly managed.",
                        "I love content! yum yum!",
                        "assets/images/content_manager.png"
                    ),
                    const SizedBox(height: 200)
                  ],
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
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
            style: TextStyle(color: Color(0xff949494), fontSize: sizeOfFont, fontWeight: FontWeight.bold)
        )
      ]
  );
}

class HexagonPortrait extends StatelessWidget {

  final bool evenRow;
  final double width;
  final String name;
  final String role;
  final String description;
  final String quote;
  final String imagePath;

  HexagonPortrait(this.evenRow, this.width, this.name, this.role, this.description, this.quote, this.imagePath);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    if (width < 1100) {
      return Container(
          padding: new EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(
                  imagePath,
                ),
              ),
              SizedBox(height: 20),
              informationBox((width/5)*4, name, role, description, quote),
              SizedBox(height: 40),
            ],
          ),
        );
    } else {
      return Container(
        padding: new EdgeInsets.all(40.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              evenRow ? informationBox(
                  width / 2, name, role, description, quote) : Container(),
              SizedBox(width: 30),
              Image(
                image: AssetImage(
                  imagePath,
                ),
              ),
              SizedBox(width: 30),
              evenRow ? Container() : informationBox(
                  width / 2, name, role, description, quote),
            ]
        ),
      );
    }
  }

  Widget informationBox(double width, String name, String role, String description, String quote) {
    return SizedBox(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              name + ": " + role,
              style: TextStyle(color: Color(0xff949494), fontSize: 24, fontWeight: FontWeight.bold)
          ),
          SizedBox(height: 10),
          Text(
              description,
              style: TextStyle(color: Color(0xff949494), fontSize: 18)
          ),
          SizedBox(height: 10),
          Text(
              "\"" + quote + "\"",
              style: TextStyle(color: Color(0xff949494), fontSize: 16, fontStyle: FontStyle.italic)
          )
        ],
      ),
    );
  }
}