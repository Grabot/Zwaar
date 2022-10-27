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
    return Scaffold(
      appBar: appBarAgeOfGold(context, false),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              logo(),
              const SizedBox(height: 40),
              const Text(
                  "meet the team:",
                  style: TextStyle(color: Color(0xfff8f8f8), fontSize: 22)
              ),
              const Text(
                  "We are fortunate to have such a dedicated and accomplished board with a wide range of expertise.",
                  style: TextStyle(color: Color(0xfff8f8f8), fontSize: 18)
              ),const Text(
                  "Together, they're helping making the world a better place!",
                  style: TextStyle(color: Color(0xfff8f8f8), fontSize: 18)
              ),
              const SizedBox(height: 40),
              HexagonPortrait(
                  false,
                  "Sander Kools",
                  "Founder",
                  "Sander Kools is the founder of the company. Legend has it that he came up with the idea for the company while he was battling a bear with his bare anti-bear hands. After he stared death in the eyes and won the idea came to him. The same day he created the company and the rest is history\nZwaar developers quickly became one of the biggest development companies in his area.",
                  "I am proud that I was able to build such a great company and also the legend about me is not correct"
              ),
              HexagonPortrait(
                  true,
                  "Sander Kools",
                  "Co-Founder",
                  "",
                  ""
              ),
              HexagonPortrait(false,
                  "Sander Kools",
                  "CEO",
                  "",
                  ""
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget logo() {
  double logoWidth = 600;
  return Column(
      children: [
        SizedBox(
          height: 150,
          width: logoWidth-50,
          child: const Image(
            image: AssetImage("assets/images/Zwaar.png"),
          ),
        ),
        const Text(
            "       Developers",
            style: TextStyle(color: Color(0xff949494), fontSize: 30, fontWeight: FontWeight.bold)
        )
      ]
  );
}

class HexagonPortrait extends StatelessWidget {

  final bool evenRow;
  final String name;
  final String role;
  final String description;
  final String quote;

  HexagonPortrait(this.evenRow, this.name, this.role, this.description, this.quote);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        evenRow ? informationBox(width/2, name, role, description, quote) : Container(),
        SizedBox(width: 40),
        Image(
          image: AssetImage(
            "assets/images/founder.png",
          ),
        ),
        SizedBox(width: 40),
        evenRow ? Container() : informationBox(width/2, name, role, description, quote),
      ]
    );
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
    // return SizedBox(width: width);
  }
}