import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:t_shoes/search_router.dart';
import 'dart:convert';

var name_textController = TextEditingController();
var color_textController = TextEditingController();
var max_price_textController = TextEditingController();
var min_price_textController = TextEditingController();
var max_rat_textController = TextEditingController();
var min_rat_textController = TextEditingController();

var name, color;
var max_price, min_price, max_rat, min_rat;

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
                      controller: name_textController,
                      style: TextStyle(color: Colors.white),
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
                      controller: color_textController,
                      style: TextStyle(color: Colors.white),
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
                      controller: min_price_textController,
                      style: TextStyle(color: Colors.white),
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
                      controller: max_price_textController,
                      style: TextStyle(color: Colors.white),
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
                      controller: min_rat_textController,
                      style: TextStyle(color: Colors.white),
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
                      borderRadius: BorderRadius.circular(35)),
                  child: TextField(
                      controller: max_rat_textController,
                      style: TextStyle(color: Colors.white),
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
            onPressed: () {
              name = name_textController.text;
              color = color_textController.text;
              if (min_price_textController.text != '') {
                min_price = int.parse(min_price_textController.text);
              } else {
                min_price = 0;
              }
              if (max_price_textController.text != '') {
                max_price = int.parse(max_price_textController.text);
              } else {
                max_price = 9999;
              }
              if (min_rat_textController.text != '') {
                min_rat = int.parse(min_rat_textController.text);
              } else {
                min_rat = 0;
              }
              if (max_rat_textController.text != '') {
                max_rat = int.parse(max_rat_textController.text);
              } else {
                max_rat = 9999;
              }
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                FocusManager.instance.primaryFocus?.unfocus();
              }

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SearchRouter(
                          name: name,
                          color: color,
                          min_price: min_price,
                          max_price: max_price,
                          min_rat: min_rat,
                          max_rat: max_rat)));
            },
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
