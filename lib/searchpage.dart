import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          toolbarHeight: 90,
          title: Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              'Search',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'font',
                  fontWeight: FontWeight.w800,
                  fontSize: 28),
            ),
          )),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
              margin: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                'Name',
                style: TextStyle(color: Colors.white),
              )),
          SizedBox(
            height: 5,
          ),
          Container(
              margin: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              width: 20,
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.white38),
                  borderRadius: BorderRadius.circular(80)),
              child: TextField(
                  decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(22, 12, 0, 12),
                isDense: true,
                hintText: "Search...",
                hintStyle: TextStyle(
                  color: Colors.white38,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'font',
                ),
              )))
        ],
      ),
    );
  }
}
