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
        body: Column(children: [
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.025),
                  width: 50,
                  child: Text(
                    'Name',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'font',
                        fontWeight: FontWeight.w900),
                  )),
              SizedBox(
                width: 10,
              ),
              Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.025),
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.white38),
                      borderRadius: BorderRadius.circular(80)),
                  child: TextField(
                      decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(22, 12, 0, 12),
                    isDense: true,
                    hintText: "...",
                    hintStyle: TextStyle(
                      color: Colors.white38,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'font',
                    ),
                  )))
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.025),
                  width: 50,
                  child: Text(
                    'Color',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'font',
                        fontWeight: FontWeight.w900),
                  )),
              SizedBox(
                width: 10,
              ),
              Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.025),
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.white38),
                      borderRadius: BorderRadius.circular(80)),
                  child: TextField(
                      decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(22, 12, 0, 12),
                    isDense: true,
                    hintText: "...",
                    hintStyle: TextStyle(
                      color: Colors.white38,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'font',
                    ),
                  )))
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.025),
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: Text(
                    'min price',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'font',
                        fontWeight: FontWeight.w900),
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.27,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.white38),
                      borderRadius: BorderRadius.circular(80)),
                  child: TextField(
                      decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(22, 12, 0, 12),
                    isDense: true,
                    hintText: "...",
                    hintStyle: TextStyle(
                      color: Colors.white38,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'font',
                    ),
                  ))),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.13,
              ),
              Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.025),
                  width: MediaQuery.of(context).size.width * 0.1,
                  child: Text(
                    'max price',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'font',
                        fontWeight: FontWeight.w900),
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.27,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.white38),
                      borderRadius: BorderRadius.circular(80)),
                  child: TextField(
                      decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(22, 12, 0, 12),
                    isDense: true,
                    hintText: "...",
                    hintStyle: TextStyle(
                      color: Colors.white38,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'font',
                    ),
                  ))),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.025),
                  width: MediaQuery.of(context).size.width * 0.11,
                  child: Text(
                    'min rating',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'font',
                        fontWeight: FontWeight.w900),
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.27,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.white38),
                      borderRadius: BorderRadius.circular(80)),
                  child: TextField(
                      decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(22, 12, 0, 12),
                    isDense: true,
                    hintText: "...",
                    hintStyle: TextStyle(
                      color: Colors.white38,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'font',
                    ),
                  ))),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.13,
              ),
              Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.025),
                  width: MediaQuery.of(context).size.width * 0.11,
                  child: Text(
                    'max rating',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'font',
                        fontWeight: FontWeight.w900),
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.27,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.white38),
                      borderRadius: BorderRadius.circular(80)),
                  child: TextField(
                      decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(22, 12, 0, 12),
                    isDense: true,
                    hintText: "...",
                    hintStyle: TextStyle(
                      color: Colors.white38,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'font',
                    ),
                  ))),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.yellow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Search',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'font',
                  fontWeight: FontWeight.w900,
                  fontSize: 16),
            ),
          ),
        ]));
  }
}
