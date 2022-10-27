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
    return Scaffold(
      appBar: appBarAgeOfGold(context, false),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            logo(),
            const SizedBox(height: 200),
            const Text(
              "Thanks for Visiting Zwaar Developers",
              style: TextStyle(color: Color(0xfff1f1f1), fontSize: 20)
            ),
            const SizedBox(height: 60),
            const Text(
                "If you want to get in touch with the team to ask for our services,",
                style: TextStyle(color: Color(0xfff1f1f1), fontSize: 20)
            ),
            const Text(
                "please download our app \"Brocast\" and send a message to \"Sander 🥰\"",
                style: TextStyle(color: Color(0xfff1f1f1), fontSize: 20)
            ),
            const SizedBox(height: 20),
            const Text(
                "Or send an email to the CEO at \"SanderKools@zwaar.dev\"",
                style: TextStyle(color: Color(0xfff1f1f1), fontSize: 20)
            ),
          ],
        ),
      ),
    );
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
}

