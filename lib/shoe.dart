import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Shoe extends StatelessWidget {
  Map shoe;
  Shoe({required this.shoe});
  Widget build(BuildContext context) {
    var name = shoe['name'];
    return Container(
        width: MediaQuery.of(context).size.width * 0.44,
        child: Column(
          children: [
            Stack(children: [
              Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                      width: 95,
                      height: 95,
                      decoration: BoxDecoration(
                        color: shoe['color'],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(75),
                        ),
                      ))),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Image.asset(
                  shoe['url'],
                  width: 120,
                  height: 120,
                ),
              )
            ]),
            Container(
              width: MediaQuery.of(context).size.width * 0.35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                ],
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              'x  $name',
              style: TextStyle(
                  color: Colors.white, fontSize: 22, fontFamily: 'font'),
            ),
            SizedBox(
              height: 7,
            ),
            Text('\$300',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: 'font',
                  fontWeight: FontWeight.w700,
                )),
          ],
        ));
  }
}
