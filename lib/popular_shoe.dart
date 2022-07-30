import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PopularShoe extends StatelessWidget {
  Map shoe;
  String sectionTitle;
  PopularShoe({required this.shoe, required this.sectionTitle});
  Widget build(BuildContext context) {
    var name = shoe['name'];
    var price = shoe['price'];
    return Container(
        width: 315,
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              width: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '5',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'font',
                    ),
                  ),
                  Icon(
                    Icons.star_rounded,
                    color: Colors.yellow,
                    size: 24,
                  )
                ],
              ),
            ),
            CircleAvatar(
              radius: 13.5,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 13,
                backgroundColor: Colors.black,
                child: Center(
                    child: Text(
                  '+',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
            )
          ]),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 130,
            child: Stack(children: [
              Column(children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '$name',
                    style: TextStyle(
                        color: Colors.white, fontSize: 22, fontFamily: 'font'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '$price',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'font',
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Check out',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'font',
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                )
              ]),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      width: 95,
                      height: 95,
                      decoration: BoxDecoration(
                        color: shoe['color'],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(75),
                        ),
                      ))),
              Positioned(
                  top: 12,
                  right: 18,
                  child: Hero(
                    tag: shoe['name'] + sectionTitle,
                    child: Image.asset(
                      shoe['url'],
                      width: 120,
                      height: 120,
                    ),
                  ))
            ]),
          )
        ]));
  }
}
