import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

late List shoes = [];
late List build_shoes = [];
var likes;
bool hh = false;
late Map value;
late Map<String, dynamic> shoe;
FirebaseFirestore firestore = FirebaseFirestore.instance;

class TryFirebase extends StatefulWidget {
  @override
  State<TryFirebase> createState() => Try_Firebase();
}

class Try_Firebase extends State<TryFirebase> {
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
                        return Row(
                          children: [
                            Text(
                              shoe['name'],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              '$likes',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            (shoe['liked'])
                                ? IconButton(
                                    onPressed: () {
                                      update(build_shoes[index]);
                                      like(build_shoes[index]);
                                    },
                                    icon: Icon(
                                      Icons.favorite_outlined,
                                      color: Colors.yellow,
                                    ))
                                : IconButton(
                                    onPressed: () {
                                      update(build_shoes[index]);
                                      like(build_shoes[index]);
                                    },
                                    icon: Icon(
                                      Icons.favorite_border,
                                      color: Colors.yellow,
                                    ),
                                  )
                          ],
                        );
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
          'likes': f['likes']
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
