import 'package:flutter/material.dart';

class SecondRouter extends StatelessWidget {
  Map shoe;
  String sectionTitle;
  SecondRouter({required this.shoe, required this.sectionTitle});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Hero(
                  tag: shoe['name'] + sectionTitle,
                  child: Image.asset(
                    shoe['url'],
                    height: 200,
                    width: 200,
                  ))
            ],
          ),
        ));
  }
}
