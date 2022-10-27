

import 'dart:math';

import 'package:flutter/material.dart';

AppBar appBarAgeOfGold(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  double loginWidth = 100;
  return AppBar(
    toolbarHeight: 80,
    elevation: 0,
    backgroundColor: Colors.orange,
    flexibleSpace: Container(
      color: Colors.orange,
    ),
    leading: topAppBarRow(width, loginWidth),
    leadingWidth: width-loginWidth,
    automaticallyImplyLeading: false,
    actions: <Widget>[
      Container(
          width: 100,
          child: Column(
            children: [
              const SizedBox(height: 10),
              IconButton(
                icon: const Icon(Icons.account_circle_rounded),
                onPressed: () {
                  print("pressed this");
                },
              ),
              const Text("not logged in")
            ],
          )
      ),
    ],
  );
}



Widget topAppBarRow(double width, double loginWidth) {
  double buttonWidth = (width - loginWidth - 200) / 5;
  return Row(
      children: [
        InkWell(
          onTap: () {
            print("pressed Home button");
          },
          child: Container(
            padding: EdgeInsets.all(16),
            width: 150,
            height: 80,
            child: Image(
              image: AssetImage(
                  "assets/images/Logo.png",
              ),
            ),
          ),
        ),
      ]);
}
