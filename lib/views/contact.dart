import 'package:flutter/material.dart';
import '../util/app_bar.dart';


class Contact extends StatefulWidget {

  static const String route = '/contact';

  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBarAgeOfGold(context, false),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(40.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                logo(width),
                const SizedBox(height: 200),
                const SelectableText(
                  "Thanks for Visiting Zwaar Developers",
                  style: TextStyle(color: Color(0xfff1f1f1), fontSize: 20)
                ),
                const SizedBox(height: 60),
                const SelectableText(
                    "If you want to get in touch with the team to ask for our services,",
                    style: TextStyle(color: Color(0xfff1f1f1), fontSize: 20)
                ),
                const SelectableText(
                    "please download our app \"Brocast\" and send a message to \"Sander 🥰\"",
                    style: TextStyle(color: Color(0xfff1f1f1), fontSize: 20)
                ),
                const SizedBox(height: 20),
                const SelectableText(
                    "Or send an email to the CEO at \"SanderKools@zwaar.dev\"",
                    style: TextStyle(color: Color(0xfff1f1f1), fontSize: 20)
                ),
              ],
            ),
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
                image: AssetImage("assets/images/Zwaar.png"),
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

