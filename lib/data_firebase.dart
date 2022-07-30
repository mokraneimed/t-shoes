import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

late List shoes = [];
late List build_shoes = [];
var likes;
var name;
var price;
var color;

bool hh = false;
late Map value;
late Map<String, dynamic> shoe;
FirebaseFirestore firestore = FirebaseFirestore.instance;

class tryFirebase extends StatefulWidget {
  @override
  State<tryFirebase> createState() => Try_Firebase();
}

class Try_Firebase extends State<tryFirebase> {
  @override
  Widget build(BuildContext context) {
    if (build_shoes.length == 0) getData();

    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(children: [
          SizedBox(
            height: 60,
          ),
          (build_shoes.length != 0)
              ? Expanded(
                  child: ListView.builder(
                      itemCount: build_shoes.length,
                      itemBuilder: (context, index) {
                        shoe = build_shoes[index];
                        likes = shoe['likes'];
                        name = shoe['name'];
                        price = shoe['price'];
                        color = Color(shoe['color']);
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
                                            color: color,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(75),
                                            ),
                                          ))),
                                  Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: Hero(
                                        tag: shoe['name'],
                                        child: Image.asset(
                                          shoe['url'],
                                          width: 120,
                                          height: 120,
                                        ),
                                      ))
                                ]),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 40,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '$likes',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22,
                                                fontFamily: 'font',
                                              ),
                                            ),
                                            (shoe['liked'] == true)
                                                ? GestureDetector(
                                                    onTap: () {
                                                      update(
                                                          build_shoes[index]);
                                                      like(build_shoes[index]);
                                                    },
                                                    child: Icon(
                                                      Icons.star_rounded,
                                                      color: Colors.yellow,
                                                      size: 24,
                                                    ))
                                                : GestureDetector(
                                                    onTap: () {
                                                      update(
                                                          build_shoes[index]);
                                                      like(build_shoes[index]);
                                                    },
                                                    child: Icon(
                                                      Icons.star_border_rounded,
                                                      color: Colors.yellow,
                                                      size: 24,
                                                    ))
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
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
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
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: 'font'),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text('$price',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontFamily: 'font',
                                      fontWeight: FontWeight.w700,
                                    )),
                              ],
                            ));
                      }))
              : Text(
                  'Loading',
                  style: TextStyle(color: Colors.white),
                )
        ]));
  }

  void getData() async {
    await firestore
        .collection('shoes')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((f) {
        Map<String, dynamic> d = {
          'name': f['name'],
          'liked': f['liked'],
          'likes': f['likes'],
          'price': f['price'],
          'url': f['url'],
          'color': f['color']
        };
        build_shoes.add(d);
      });
    });
    setState(() {});
  }

  void update(Map<String, dynamic> shoe) async {
    bool liked = shoe['liked'];

    DocumentReference<Map<String, dynamic>> docShoe;
    docShoe = FirebaseFirestore.instance.collection('shoes').doc(shoe['name']);
    await docShoe.update({'liked': !liked});
  }

  void like(Map<String, dynamic> shoe) {
    bool liked = shoe['liked'];
    shoe['liked'] = !liked;

    setState(() {});
  }
}
