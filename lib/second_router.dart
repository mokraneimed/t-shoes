import 'package:flutter/material.dart';

class SecondRouter extends StatelessWidget {
  Map shoe;
  SecondRouter({required this.shoe});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          margin: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Image.asset(
                shoe['url'],
                height: 200,
                width: 200,
              )
            ],
          ),
        ));
  }
}
